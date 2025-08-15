<div class="row gy-lg-4 gy-4 justify-content-center">
    @foreach ($blogs as $item)
    <div class="col-lg-4 col-md-6 col-12 wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
        <div class="card">
            <div class="thumb">
                <img src="{{ getImage(getFilePath('frontend') .'/'.'blog/'. @$item->data_values->blog_image) }}"
                    alt="@lang('image')">
                <div class="date">
                    <h4>{{ \Carbon\Carbon::parse($item->created_at)->format('d') }} <br>
                        <span>{{ \Carbon\Carbon::parse($item->created_at)->format('M') }}</span>
                    </h4>
                </div>
            </div>
            <div class="content">
                <a href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id]) }}">
                    <h4>
                        @if (strlen(__(@$item->data_values->title)) > 33)
                        {{ substr(__(@$item->data_values->title), 0, 33) . '...' }}
                        @else
                        {{__(@$item->data_values->title) }}
                        @endif
                    </h4>
                </a>
                <p>@if (strlen(__(strip_tags(@$item->data_values->description))) > 60)
                    {{ substr(__(strip_tags(@$item->data_values->description)), 0, 60) . '...' }}
                    @else
                    {{ __(strip_tags(@$item->data_values->description)) }}
                    @endif
                </p>
            </div>
        </div>
    </div>
    @endforeach
</div>
