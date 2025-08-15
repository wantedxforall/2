<div class="d-flex mx-2">
    <div class="icon text-black">
        <i class="fa-solid fa-globe"></i>
    </div>
    <select class="select-dir langSel text-black">
        @foreach ($languages as $language)
            <option value="{{ $language->code }}"
                @if (Session::get('lang') === $language->code) selected @endif>
                {{ __($language->name) }}
            </option>
         @endforeach
    </select>
</div>
