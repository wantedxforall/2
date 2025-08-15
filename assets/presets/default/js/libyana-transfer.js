
function getUsername() {
  const usernameElement = document.querySelector('.navbar-user__name');
  return usernameElement ? usernameElement.textContent.trim() : null;
}

async function confirmTransfer() {
  const phone = document.getElementById('phone').value.trim();
  const amount = parseFloat(document.getElementById('amount').value);
  const username = getUsername();
  const token = window.libyanaConfig?.token;

  const btn = event.target;
  btn.disabled = true;

  if (!username) {
    showMessage('لم يتم العثور على اسم المستخدم.', 'error');
    btn.disabled = false;
    return;
  }

  const res = await fetch('/payment/confirm', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]').content,
      ...(token ? { 'Authorization': `Bearer ${token}` } : {})
    },
    body: JSON.stringify({ phone, amount, username })
  });

  const result = await res.json();
  if (result.message?.includes('Success')) {
    showMessage('✅ تم تأكيد التحويل بنجاح.', 'success');
  } else {
    showMessage(result.message || 'فشل في تأكيد التحويل.', 'error');
  }
  btn.disabled = false;
}

function showMessage(msg, type) {
  const box = document.getElementById('message');
  box.innerHTML = `<div style="color: ${type === 'success' ? 'green' : 'red'}">${msg}</div>`;
}
