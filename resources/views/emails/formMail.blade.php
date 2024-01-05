<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="{{asset('assets/css/customMail.css')}}">
    </head>
    <body>

        <div  style="
            max-width: 1140px;
            background-color: #9f9f9f;
            overflow: hidden;
            margin-top: 25px ;
            --bs-gutter-x: 1.5rem;
            --bs-gutter-y: 0;
            width: 100%;
            padding-right: calc(var(--bs-gutter-x) * .5);
            padding-left: calc(var(--bs-gutter-x) * .5);
            margin-right: auto;
            margin-left: auto;
        ">
            <div  style="margin: 20px 0;">
                <div  style="
                    --bs-gutter-x: 1.5rem;
                    --bs-gutter-y: 0;
                    display: flex;
                    flex-wrap: wrap;
                    margin-top: calc(-1 * var(--bs-gutter-y));
                    margin-right: calc(-.5 * var(--bs-gutter-x));
                    margin-left: calc(-.5 * var(--bs-gutter-x));
                
                ">
                    <div  style="
                        flex: 0 0 auto;
                        width: 33.33333333%;
                        text-align: center;

                    ">
                        <img src="{{ 'https://apimovie.bkshop.site/'.$mailData['image'] }}"   alt="{{ asset('/storage/movie/1/ws5GhGTOAVTLnGsogvTF.jpg') }}" style="
                            max-width: 60%;
                            padding: unset;
                            border-radius: 10px;
                            background-color: var(--bs-body-bg);
                            border: var(--bs-border-width) solid var(--bs-border-color);
                            height: auto;
                        ">
                    </div>
                    <div style="
                        flex: 0 0 auto;
                        width: 50%;
                    ">
                        <div  style="
                            font-size: 2rem;
                            word-wrap: break-word;
                            word-break: break-word;
                            text-transform: uppercase;
                            font-weight: 700;
                        ">
                            {{$mailData['movie']}}
                        </div>

                        <div> 
                            <div>
                                <div class="date">
                                    Ngày chiếu: <span style=" margin-left: 6px;">{{$mailData['date']}}</span>
                                </div>
                            </div>

                            <div>
                                <div class="time">
                                    <div class="time_show">
                                        Giờ: <span style=" margin-left: 6px;"> {{$mailData['time_start']}}</span> - <span>{{$mailData['time_end']}}</span>
                                    </div>
                                    <div>Thời lượng: <span style="margin-left: 6px;">{{$mailData['time_show']}}</span></div>
                                </div>
                            </div>
                        </div>

                        <div style="
                            margin-top: 15px;
                            font-size: 1.5rem;
                            word-wrap: break-word;
                            word-break: break-word;
                            font-weight: 700;
                        ">
                            <img src="https://apimovie.bkshop.site/public/assets/image/location_.png" alt="location.png" style="
                                margin-right: 20px;
                                vertical-align: middle;
                            ">
                            <span>{{$mailData['location']}}</span>
                        </div>
                        <div class="info-ticket room" style="
                            margin-top: 15px;
                            text-transform: capitalize;
                            font-weight: bold;
                        ">
                            <img src="https://apimovie.bkshop.site/public/assets/image/door_.png" alt="door.png" style="
                                margin-right: 20px;
                                vertical-align: middle;
                            ">
                            <span>{{$mailData['room']}}</span>
                        </div>
                        <div style="
                            margin-top: 15px;
                            text-transform: capitalize;
                            font-weight: bold;
                            word-wrap: break-word;
                             word-break: break-word;
                        ">
                            <img src="https://apimovie.bkshop.site/public/assets/image/seat_.png" alt="seat.png" style="
                                margin-right: 20px;
                                vertical-align: middle;
                            ">
                            @foreach($mailData['seats'] as $item)
                                <span style="
                                    position: relative;
                                    margin-right: 20px;
                                ">
                                    {{$item}}
                                </span>
                            @endforeach
                            

                        </div>

                        <div style="
                            margin-top: 15px;
                            text-transform: capitalize;
                            font-weight: bold;
                        ">
                            <img src="https://apimovie.bkshop.site/public/assets/image/food_.png" alt="food.png" style="
                                margin-right: 20px;
                                vertical-align: middle;
                            ">
                            @if($mailData['food'])
                                @foreach($mailData['food'] as $item)
                                    <span style="
                                        position: relative;
                                        margin-right: 20px;
                                    ">
                                        {{$item}}
                                    </span>
                                @endforeach

                            @else
                                <span style="
                                    position: relative;
                                    margin-right: 20px;
                                ">
                                    không có
                                </span>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div style="
                width: 100%;
                height: 100%;
                text-align: center;
            ">
                <div style="
                    margin: 15px;
                    font-size: 25px;
                "> Mã vé</div>
                <div style="
                    padding: 15px;
                    background-color: #6d6c6c;
                    text-align: center;
                    color: red;
                    font-size: 25px;
                ">
                    {{$mailData['id_booking']}}
                </div>
            </div>
            <div style="
                text-transform: capitalize;
                font-size: 25px;
                margin-right: 15%;
                margin-left: 20px;
                margin-top: 25px
            ">
                <div class="price" style="display: flex;"><span style="display: block;  width: 120px;">Giá vé:</span>  <span style="margin-left: 60px;">{{number_format($mailData['price_ticket'],0,",",".") }} <sup>đ</sup></span></div>
                <div class="price" style="display: flex;"><span style="display: block;  width: 120px;">Giá thức ăn:</span>  <span style="margin-left: 60px;">{{number_format($mailData['price_food'],0,",",".") }} <sup>đ</sup></span></div>
                <div class="price" style="display: flex;"><span style="display: block;  width: 150px;">Thanh toán:</span>  <span style="margin-left: 60px;">{{$mailData['payment']}}</span></div>

                <div style="
                    position: relative;
                    margin: 20px 0;
                    margin-bottom: 50px;
                    font-weight: bold;
                    color: red;
                "><span style="
                content: '';
                position: absolute;
                width: 100%;
                height: 3px;
                left: 0;
                top: -10px;
                background-color: rgb(107, 107, 107);
                "></span>Tổng cộng: <span style="float: right;">{{number_format($mailData['price_ticket']+$mailData['price_food'],0,",",".") }} <sup>đ</sup></span></div>
            </div>
                
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>