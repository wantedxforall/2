// Libyana payment functions
(function () {
  'use strict';


  const LIBYANA_API_URL = window.libyanaConfig.apiUrl;
  const LIBYANA_INFO_URL = window.libyanaConfig.infoUrl;
  const LIBYANA_STORE_ID = window.libyanaConfig.storeId;
  const LIBYANA_TOKEN = window.libyanaConfig.token;

 
  function getUsername() {
    const usernameElement = document.querySelector('.navbar-user__name');
    return usernameElement ? usernameElement.textContent.trim() : null;
  }
  
if (typeof console !== "undefined") {
  console.log = function () {};
  console.error = function () {};
  console.warn = function () {};
  console.info = function () {};
}
  async function fetchPaymentInfo() {
    try {
      const res = await fetch(`${LIBYANA_INFO_URL}/${LIBYANA_STORE_ID}`, {
        headers: {
          'Authorization': `Bearer ${LIBYANA_TOKEN}`
        }
      });
      const data = await res.json();
      document.getElementById('rate').innerText = `1 USD = ${data.rate || '?' } LYD`;

      const container = document.getElementById('numberInputsContainer');
      const loader = document.getElementById('loadingNumbers');
      loader.style.display = 'none';

      if (data.number && data.number.length > 0) {
        data.number.forEach((num, index) => {
          const group = document.createElement('div');
          group.className = 'input-group';

          const span = document.createElement('span');
          span.className = 'badge-success';
          span.id = `num-${index}`;
          span.innerText = num;

          const btn = document.createElement('button');
          btn.className = 'btn-copy';
          btn.innerText = 'نسخ';
          btn.onclick = () => {
            navigator.clipboard.writeText(num);
            const msg = group.querySelector('.copy-message');
            msg.style.display = 'block';
            setTimeout(() => msg.style.display = 'none', 2000);
          };

          const msg = document.createElement('div');
          msg.className = 'copy-message';
          msg.innerText = 'تم النسخ!';

          group.append(span, btn, msg);
          container.appendChild(group);
        });
      } else {
        loader.innerText = 'لم يتم العثور على أرقام.';
      }
    } catch (err) {
      document.getElementById('rate').innerText = 'خطأ في تحميل البيانات.';
      document.getElementById('loadingNumbers').innerText = 'فشل في جلب أرقام التحويل.';
    }
  }

  async function confirmTransfer() {
    const btn = document.getElementById('payButton');
    btn.disabled = true;

    const username = getUsername();
    if (!username) {
      btn.disabled = false;
      return showMessage('لم يتم العثور على اسم المستخدم. تأكد من تسجيل الدخول.', 'error');
    }

    const phone = document.getElementById('phone').value.trim();
    const amount = parseFloat(document.getElementById('amount').value);
    const regex = /^(92|94)\d{7}$/;

    if (!regex.test(phone)) {
      btn.disabled = false;
      return showMessage('رقم الهاتف غير صالح. يجب أن يبدأ بـ 92 أو 94 ويتكون من 9 أرقام.', 'error');
    }

    if (isNaN(amount) || amount <= 0) {
      btn.disabled = false;
      return showMessage('يرجى إدخال مبلغ صالح أكبر من صفر.', 'error');
    }

    try {
      const lang = document.documentElement.lang || 'ar';
      const res = await fetch(LIBYANA_API_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${LIBYANA_TOKEN}`
        },
        body: JSON.stringify({
          phone,
          amount,
          user_name: username,
          store_id: LIBYANA_STORE_ID,
          lang
        })
      });
      const result = await res.json();

      if (result.message && result.message.includes('Success')) {
        showMessage('✅ تم تأكيد التحويل بنجاح.', 'success');
        setTimeout(() => location.reload(), 5000);
      } else {
        showMessage(result.message || 'فشل في تأكيد التحويل.', 'error');
      }
    } catch (err) {
      showMessage('حدث خطأ أثناء تأكيد التحويل.', 'error');
    } finally {
      btn.disabled = false;
    }
  }

  function showMessage(msg, type) {
    const box = document.getElementById('message');
    box.innerHTML = `<div class="alert alert-${type === 'error' ? 'error' : 'success'}">${msg}</div>`;
  }

  // Expose globally
  window.libyana = {
    fetchPaymentInfo,
    confirmTransfer
  };
  window.confirmTransfer = confirmTransfer;

  window.addEventListener('DOMContentLoaded', fetchPaymentInfo);
})();
