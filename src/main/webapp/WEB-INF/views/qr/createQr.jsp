<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>QR 코드 생성</h1>
            </div>
            <form action="none" method="get">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="input-group has-validation">
                                <div class="form-floating is-invalid"></div>
                                <div class="invalid-feedback"
                                     style="text-align: right; font-size: 11px; color: #ff6b81">
                                    QR 코드에 담을 URL을 입력해주세요. / 예 : www.naver.com
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="textInput" name="userId">
                                <label for="textInput">URL 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                                <button type="button" class="btn btn-bluemint" id="gobtn"
                                        style="float: right; margin-top: 5px;">
                                    <span style="color : white;">QR 생성</span>
                                </button>
                            </div>
                            <div class="form-floating mb-3">
                                <hr style="margin: 0.4rem;">
                                <div id="qrout"><span id="noQr" style="font-weight: bold;">생성된 QR 코드가 없습니다.</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px; margin-top: 10px;">
                            <div class="form-floating mb-3">
                                <c:choose>
                                    <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user == null}">
                                        <span style="font-size: 12px;"><a href="/user/login">로그인</a> 하시면 작성한 여행 목록을 QR코드로 만들 수 있습니다.</span>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="row g-0">
                                            <div class="col-8 align-self-center">
                                                <div class="card" style="padding:8px; height: 50px;">
                                                    <div class="form-floating mb-1 align-middle">
                                                        <span style="color: dimgray; font-size: 18px;">제목</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4 align-self-center">
                                                <div class="card" style="padding:8px; height: 50px;">
                                                    <div class="form-floating mb-1 align-middle">
                                                        <span style="color: dimgray; font-size: 18px;">생성</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tourList">

                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-pink" onclick="location.href='/'">
                                <i class="bi bi-box-arrow-in-right fs-5" style="color: white;">
                                    &nbsp;뒤로 가기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-4"></div>
    </div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"
        charset="utf-8"></script>
<script type='text/javascript'>

    var gqrapi = "http://chart.apis.google.com/chart?cht=qr&chs=144x144&choe=UTF-8&chld=H|0";

    $(document).ready(function () {
        if (${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user != null}) {
            tourList();
        }
        //구글API URL

        $("#gobtn").click(function () {
            createQr();
        });
    });

    function createQr(){
        $text = $("#textInput").val();

        //입력한 내용 있는지 체크
        if ($text !== "") {
            var imgsrc = gqrapi + "&chl=" + encodeURIComponent($text); //입력 데이터 인코딩해서 구글 API에 파라메터로 붙이고...

            //이미지 객체를 생성해서 구글API URL을 "src="로 지정
            var img = new Image();

            $(img).load(function () {
                var $this = $(this);
                $this.hide();
                $("#qrout").empty().append(this); //<div></div>에 이미지 객체를 덧붙이고...

                $this.fadeIn(); //블로그에 붙이고 수정하다 잘라먹었습니다. 실행안되시는분은 이줄이 빠져서 만들어진 QR코드가 화면에 안보이는겁니다.

            }).attr({"src": imgsrc, "width": 144, "height": 144, "alt": "QR CODE: " + $("#textInput").val()}); //이미지 객체의 속성 지정 "src"에 구글API URL 지정
        } else {
            document.querySelector('#noQr').innerHTML =
                '<span id="noQr" style="font-weight: bold; color: red;">URL이 정상적으로 입력되지 않았습니다.</span>';
        }
    }

    function createQrTour(input){

        let url = 'http://localhost:8080/tour/' + input;
        $text = url;

        //입력한 내용 있는지 체크
        if ($text !== "") {
            var imgsrc = gqrapi + "&chl=" + encodeURIComponent($text); //입력 데이터 인코딩해서 구글 API에 파라메터로 붙이고...

            //이미지 객체를 생성해서 구글API URL을 "src="로 지정
            var img = new Image();

            $(img).load(function () {
                var $this = $(this);
                $this.hide();
                $("#qrout").empty().append(this); //<div></div>에 이미지 객체를 덧붙이고...

                $this.fadeIn(); //블로그에 붙이고 수정하다 잘라먹었습니다. 실행안되시는분은 이줄이 빠져서 만들어진 QR코드가 화면에 안보이는겁니다.

            }).attr({"src": imgsrc, "width": 144, "height": 144, "alt": "QR CODE: " + $text}); //이미지 객체의 속성 지정 "src"에 구글API URL 지정
        } else {
            document.querySelector('#noQr').innerHTML =
                '<span id="noQr" style="font-weight: bold; color: red;">URL이 정상적으로 입력되지 않았습니다.</span>';
        }
    }

    function tourList() {
        $.ajax({
            type: "GET",
            url: "/qr/tour",
            dataType: "json",
            success: function (res) {
                let html = '';
                for(let i = 0; i < res.length; i++){
                    html += '<div class="row g-0">';
                    html +=     '<div class="col-8 align-self-center">';
                    html += '<div class="card" style="padding:8px; height: 50px;">';
                    html += '<div class="form-floating mb-1 align-middle">';
                    html += '<span style="color: dimgray; font-size: 18px;">' + res[i].tourTitle + '</span>';
                    html += '</div></div></div>';
                    html += '<div class="col-4 align-self-center">';
                    html += '<div class="card" style="padding:8px; height: 50px;">';
                    html += '<div>';
                    html += '<button type="button" class="btn" style="position: relative;bottom: 3px;" onclick="createQrTour('+res[i].tourId+')">';
                    html += '<span style="color: dimgray; font-size: 18px; height: 50px;">';
                    html += '<i class="bi bi-box2-heart" style="color: black;"></i>';
                    html += '</span></button></div></div></div></div>';
                }

                document.querySelector('#tourList').innerHTML = html;
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
    }

</script>