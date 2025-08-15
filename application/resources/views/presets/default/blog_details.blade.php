@extends($activeTemplate.'layouts.frontend')
@section('content')
<!-- ==================== Blog Details Start ==================== -->
<section class="blog-detials py-100">
    <div class="container">
        <div class="row gy-5 justify-content-center">
            <div class="col-lg-8">
                <div class="blog-details">
                    <div class="thumb">
                        <img src="{{ getImage(getFilePath('frontend') . '/blog'.'/' . $blog->data_values->blog_image) }}"
                            alt="@lang('blog-details')">
                    </div>
                    <div class="content">
                        <h3>{{ __($blog->data_values->title) }}</h3>
                        @php
                        echo $blog->data_values->description;
                        @endphp

                        <div class="mt-4 d-flex align-items-center">
                            <h5>@lang('Share This')</h5>
                            <ul class="social">
                                <li><a href="https://www.facebook.com/share.php?u={{ Request::url() }}&title={{ slug(@$blog->data_values->title) }}"
                                        target="_blank"><i class="fab fa-facebook-f"></i></a> </li>
                                <li><a href="https://www.linkedin.com/shareArticle?mini=true&url={{ Request::url() }}&title={{ slug(@$blog->data_values->title) }}&source=behands"
                                        target="_blank"> <i class="fab fa-linkedin-in"></i></a></li>
                                <li><a
                                        href="https://twitter.com/intent/tweet?status={{ slug(@$blog->data_values->title) }}+{{ Request::url() }}">
                                        <i class="fab fa-twitter" target="_blank"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <!-- ============================= Blog Details Sidebar Start ======================== -->
                <div class="blog-sidebar-wrapper">
                    <div class="blog-sidebar">
                        <h5 class="blog-sidebar__title">@lang('Latests Topics')</h5>
                        <span class="hr-line"></span>
                        <span class="border"></span>
                        @foreach ($latests as $item)
                        <div class="latest-blog">
                            <div class="latest-blog__thumb">
                                <a
                                    href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id]) }}">
                                    <img src="{{ getImage(getFilePath('frontend') . '/blog' .'/'. 'thumb_' . $item->data_values->blog_image) }}"
                                        alt="@lang('blog-image')">
                                </a>
                            </div>
                            <div class="latest-blog__content">
                                <h6 class="latest-blog__title"><a
                                        href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id]) }}">
                                        @if (strlen(__(@$item->data_values->title)) > 50)
                                        {{ substr(__(@$item->data_values->title), 0, 50) . '...' }}
                                        @else
                                        {{__(@$item->data_values->title) }}
                                        @endif
                                    </a>
                                </h6>
                                <span class="latest-blog__date">{{ showDateTime($item->created_at) }}</span>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                <!-- ============================= Blog Details Sidebar End ======================== -->
            </div>
        </div>
    </div>
</section>
<!-- ==================== Blog Details End ==================== -->
@endsection
