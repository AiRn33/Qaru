<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-3"></div>
        <div class="col-6 text-center">
            <div class="card" style="padding:8px">
                <h1>가게 예약</h1>
            </div>
            <form id="menuForm">
                <input type="hidden" id="menu_count" value="1">
                <input type="hidden" id="img_count" value="">
                <div id="menuArea_1">
                    <div class="row g-0">
                        <div class="col">
                            <div class="card" style="padding:8px">
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 가게 이름 </span> : ${shopData.shopName}
                                </div>
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 가게 주소 </span> : ${shopData.shopCity} ${shopData.shopStreet}
                                </div>
                                <div class="form-floating mb-1" id="menuName_1Area" style="margin-top: 10px;">
                                    <input type="text" class="form-control" id="menuName_1" name="menuName_1"
                                           placeholder=""
                                           value="">
                                    <label for="menuName_1">예약자 이름<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" id="menuComment_1Area">
                                    <input type="text" class="form-control" id="menuComment_1" name="menuComment_1"
                                           placeholder=""
                                           value="">
                                    <label for="menuComment_1">예약자 연락처 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" style="margin-top: 10px;">
                                    <span style="color: dimgray">예약 숫자 </span>
                                    <button type="button" class="btn-outline-bluemint btn" style="border: none;" onclick="countDown();">
                                        <i class="bi bi-arrow-left-circle"></i>
                                    </button>
                                    <input type="number" name="inputCount" id="reservationNum"
                                           class="btn btn-outline-bluemint" value="0" style="text-align: center; width: 30%">
                                    <button type="button" class="btn-outline-bluemint btn" style="border: none; " onclick="countUp();">
                                        <i class="bi bi-arrow-right-circle"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card" style="padding:8px">
                                <div class="form-floating mb-1" id="reservationArea">
                                    <input class="btn btn-outline-gray" type="button" id="startDate" value="예약 날짜 선택"
                                           style="width: 100%; float: right;" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="Submit()">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;메뉴 등록
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="location.href='/'">
                            <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                &nbsp;뒤로가기
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</div>
<script>

    $(function () {
        var maxDate = new Date();

        //input을 datepicker로 선언
        $("#startDate").datepicker(
            {
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                , showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                , showMonthAfterYear: false //년도 먼저 나오고, 뒤에 월 표시
                , changeYear: true //콤보박스에서 년 선택 가능
                , maxDate: maxDate
                , changeMonth: true //콤보박스에서 월 선택 가능
                , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
                , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
                , maxDate: "+1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , onSelect: function (date) {
                    $('#endDate').datepicker("option", "minDate", date);
                    reservationSearch(this.value);
                }
            });
    });

    function reservationSearch(input){
        $.ajax({
            type: "GET",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/reservation-time/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {reservationDate: input},
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.

            }
        });
    }

    function countUp(){
        document.querySelector('#reservationNum').value++;
    }

    function countDown(){
        document.querySelector('#reservationNum').value--;

        if(document.querySelector('#reservationNum').value < 0){
            document.querySelector('#reservationNum').value = 0;
        }
    }
</script>

