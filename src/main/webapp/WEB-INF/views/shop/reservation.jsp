<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important; display: none;" id="timeSelectArea">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div style="line-height: 90%; margin-bottom: 5px;">
                <span>선택 날짜 : </span><span id="selectDateSpan"></span>
                <hr>
                <span id="seleteDate" style="color: red; font-size: 13px;">해당 예약 날짜의 선택 해주세요</span>
            </div>
            <div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="row g-0" id="reservationTimeArea">

                            </div>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-pink" onclick="timeBack(1)">
                            <i class="bi bi-arrow-bar-right fs-5">
                                &nbsp;날짜 다시 고르기
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-4"></div>
    </div>
</div>

<div class="container-md" style="height: 90%!important;" id="dateSelectArea">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-3"></div>
        <div class="col-6 text-center">
            <div class="col" style="margin-bottom: 30px;">
                <div class="row g-0">
                    <div class="col-3"></div>
                    <div class="col-6">
                        <span>예약하실 날짜를 선택해주세요.</span>
                    </div>
                    <div class="col-3"></div>
                    <div class="col-3"></div>
                    <div class="col-6">
                        <span style="color: red; font-size: 12px;">예약은 오늘 기준 한달 까지만 예약이 가능합니다.</span>
                    </div>
                    <div class="col-3"></div>
                    <div class="col-3"></div>
                    <div class="col-6">
                        <div class="form-floating mb-1" id="reservationArea">
                            <input class="btn btn-outline-gray" type="button" id="reservationDate" value="예약 날짜 선택"
                                   style="width: 100%; float: right; height: 230px;">
                        </div>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>

        </div>
        <div class="col-3"></div>
    </div>
</div>

<div class="container-md" style="height: 110%!important; display: none;" id="dataArea">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-3"></div>
        <div class="col-6 text-center">
            <div class="card" style="padding:8px;">
                <h1>가게 예약</h1>
            </div>
            <form>
                <div>
                    <div class="row g-0">
                        <div class="col">
                            <div class="card" style="padding:8px">
                                <input type="hidden" value="" id="selectDate">
                                <input type="hidden" value="" id="reservationTime">
                                <input type="hidden" value="" id="limitNum">
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 가게 이름 </span>
                                    : ${shopData.shopName}
                                </div>
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 가게 주소 </span>
                                    : ${shopData.shopCity} ${shopData.shopStreet}
                                </div>
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 날짜 </span>
                                    : <span id="reservationDateSpan"></span>
                                </div>
                                <div class="form-floating mb-1" style="text-align: left;">
                                    <span style="color: dimgray">&nbsp;&nbsp;&nbsp;예약 시간 </span>
                                    : <span id="reservationHourSpan"></span>
                                </div>

                                <div class="form-floating mb-1" style="margin-top: 10px;">
                                    <input type="text" class="form-control" name="reservationName"
                                           placeholder=""
                                           value="" id="reservationName">
                                    <label for="reservationName">예약자 이름<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1">
                                    <input type="text" class="form-control" name="reservationPhone"
                                           placeholder=""
                                           value="" id="reservationPhone">
                                    <label for="reservationPhone">예약자 연락처 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" style="margin-top: 10px;">
                                    <span style="color: dimgray">예약 인원 </span>
                                    <button type="button" class="btn-outline-bluemint btn" style="border: none;"
                                            onclick="countDown();">
                                        <i class="bi bi-arrow-left-circle"></i>
                                    </button>
                                    <input type="number" name="inputCount" id="inputCount"
                                           class="btn btn-outline-bluemint" value="1"
                                           style="text-align: center; width: 30%" readonly>
                                    <button type="button" class="btn-outline-bluemint btn" style="border: none; "
                                            onclick="countUp();">
                                        <i class="bi bi-arrow-right-circle"></i>
                                    </button>
                                </div>
                                <div class="form-floating mb-1" style="text-align: center; font-size: 12px; color: red;" id="limitNumSpan">

                                </div>
                            </div>
                            <div class="col-3">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="row g-0">
                        <div class="col-6">
                            <button type="button" class="btn btn-bluemint" style="width: 95%;" onclick="reservationSubmit()">
                                <i class="bi bi-bookmark-check-fill fs-5" style="color: white">
                                    &nbsp;예약하기
                                </i>
                            </button>
                        </div>
                        <div class="col-6">
                            <button type="button" class="btn btn-pink" style="width: 95%;" onclick="timeBack(2)">
                                <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                    &nbsp;뒤로가기
                                </i>
                            </button>
                        </div>
                        </div>
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
        $("#reservationDate").datepicker(
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
                , minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , onSelect: function (date) {
                    reservationSearch(this.value);
                },
                beforeShowDay: function (date) {

                    let mon = (date.getDay() == 1);
                    let tues = (date.getDay() == 2);
                    let wed = (date.getDay() == 3);
                    let thur = (date.getDay() == 4);
                    let fri = (date.getDay() == 5);
                    let sat = (date.getDay() == 6);
                    let sun = (date.getDay() == 0);

                    if (mon) {
                        if (${shopData.mon}) {
                            return [true];
                        }
                    }
                    if (tues) {
                        if (${shopData.tues}) {
                            return [true];
                        }
                    }
                    if (wed) {
                        if (${shopData.wed}) {
                            return [true];
                        }
                    }
                    if (thur) {
                        if (${shopData.thur}) {
                            return [true];
                        }
                    }
                    if (fri) {
                        if (${shopData.fri}) {
                            return [true];
                        }
                    }
                    if (sat) {
                        if (${shopData.sat}) {
                            return [true];
                        }
                    }
                    if (sun) {
                        if (${shopData.sun}) {
                            return [true];
                        }
                    }
                    return [false];
                }
            }
        );
    });

    function reservationSearch(input) {
        $.ajax({
            type: "GET",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/reservation-time/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {reservationDate: input},
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.

                document.querySelector('#dateSelectArea').style.display = 'none';
                document.querySelector('#timeSelectArea').style.display = '';
                let selectDate = input.split('-');
                let selectDateVal = selectDate[0] + '년 ' + selectDate[1] + '월 ' + selectDate[2] + '일';

                document.querySelector('#selectDateSpan').innerHTML = selectDateVal;
                document.querySelector('#selectDate').value = selectDate[0] + '-' + selectDate[1] + '-' + selectDate[2];
                document.querySelector('#limitNum').value = res.reservationLimitNum;
                document.querySelector('#limitNumSpan').innerHTML =
                        '<span>최대 예약 가능 인원은 ' + res.reservationLimitNum + '명 입니다.</span>';

                let reservationOpenTime = (Number)(res.reservationOpenTime);
                let reservationOpenMinute = (Number)(res.reservationOpenMinute);
                let reservationCloseTime = (Number)(res.reservationCloseTime);
                let reservationCloseMinute = (Number)(res.reservationCloseMinute);
                let reservationTime = (Number)(res.reservationTime);

                let html = '';

                // 마감시간이 새벽인 경우
                if (reservationOpenTime > reservationCloseTime) {

                    let setTime = reservationOpenTime;
                    if(setTime > 24){
                        setTime = 0;
                    }
                    // 시간이 한 시간인 경우
                    if (reservationTime == '60') {
                        for(let i = reservationOpenTime; i < 24; i++) {
                            html += sixtyHtml(setTime);
                            setTime++;
                        }
                        setTime = 0;
                        for(let i = setTime; i <= reservationCloseTime; i++){
                            html += sixtyHtml(setTime);
                            setTime++;
                        }

                        // 시간이 30분인 경우
                    } else if (reservationTime == '30') {

                        if(reservationOpenMinute == '30'){
                            html += openThirtyHtml(setTime);
                            setTime++;
                        }else{
                            html += thirtyHtml(setTime);
                            setTime++;
                        }

                        for(let i = reservationOpenTime + 1; i < 24; i++){
                            html += thirtyHtml(setTime);
                            setTime++;
                        }
                        setTime = 0;
                        for(let i = setTime; i <= reservationCloseTime - 1; i++) {
                            html += thirtyHtml(setTime);
                            setTime++;
                        }

                        if(reservationCloseMinute == '30'){
                            html += thirtyHtml(setTime);
                        }else if(reservationCloseMinute == '0'){
                            html += sixtyHtml(setTime);
                        }
                    }

                    document.querySelector('#reservationTimeArea').innerHTML = html;
                    html = '';

                }
                // 예약 시간과 마감 시간이 같은 경우
                else if (reservationOpenTime == reservationCloseTime) {

                    let setTime = reservationOpenTime;

                    html += sixtyHtml(setTime);

                    document.querySelector('#reservationTimeArea').innerHTML = html;
                    html = '';
                }
                // 정상
                else {
                    let setTime = reservationOpenTime;

                    // 시간이 한 시간인 경우
                    if (reservationTime == '60') {
                        for (let i = 0; i < (reservationCloseTime - reservationOpenTime) + 1; i++) {
                            html += sixtyHtml(setTime);
                            setTime++;
                        }

                        // 시간이 30분인 경우
                    } else if (reservationTime == '30') {

                        if(reservationOpenMinute == '30'){
                            html += openThirtyHtml(setTime);
                            setTime++;
                        }else{
                            html += thirtyHtml(setTime);
                            setTime++;
                        }

                        for (let i = 0; i < (reservationCloseTime - reservationOpenTime) - 1; i++) {
                            html += thirtyHtml(setTime);
                            setTime++;
                        }

                        if(reservationCloseMinute == '30'){
                            html += thirtyHtml(setTime);
                        }else if(reservationCloseMinute == '0'){
                            html += sixtyHtml(setTime);
                        }
                    }

                    document.querySelector('#reservationTimeArea').innerHTML = html;
                    html = '';
                }
            }
        });
    }

    function countUp() {
        let limitNum = document.querySelector('#limitNum').value;
        let inputCount = document.querySelector('#inputCount').value;

        if(Number(inputCount) >= Number(limitNum)){
            alert('최대 예약 가능 인원은 ' + limitNum + "명 입니다.");
            return false;
        }
        document.querySelector('#inputCount').value++;
    }

    function countDown() {
        document.querySelector('#inputCount').value--;

        if (document.querySelector('#inputCount').value < 1) {
            document.querySelector('#inputCount').value = 1;
        }
    }

    function timeBack(input) {
        if (input == 1) {
            document.querySelector('#dateSelectArea').style.display = '';
            document.querySelector('#timeSelectArea').style.display = 'none';
        }else if(input ==2){
            document.querySelector('#timeSelectArea').style.display = '';
            document.querySelector('#dataArea').style.display = 'none';
        }
    }

    function reservationSubmit(){

        let data = {
            selectDate: document.querySelector('#selectDate').value,
            reservationTime:document.querySelector('#reservationTime').value,
            reservationName:document.querySelector('#reservationName').value,
            reservationLimitNum:document.querySelector('#inputCount').value,
            reservationPhone:document.querySelector('#reservationPhone').value
        }

        console.log(data);

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/reservation-time/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: data,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType : "json",
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                console.log(res);
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });

    }

    function sixtyHtml(setTime) {
        let html = '';
        let sixty = '00';

        html += '<div class="col-6">';
        html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 00분' + '" ' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + sixty + ')">';
        html += '</div>';
        return html;
    }

    function thirtyHtml(setTime) {
        let html = '';
        let sixty = '00';
        let thirty = '30';

        html += '<div class="col-6">';
        html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 00분' + '"' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + sixty + ')">';
        html += '</div>';

        html += '<div class="col-6">';
        html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 30분' + '" ' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + thirty + ')">';
        html += '</div>';
        return html;
    }

    function openThirtyHtml(setTime) {
        let html = '';
        let thirty = '30';
        html += '<div class="col-6">';
        html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 30분' + '" ' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + thirty + ')">';
        html += '</div>';
        return html;
    }

    function reservationDataOn(setTime, type){

        let timeSet;
        if(type == '0'){
            timeSet = setTime + '-00';
            document.querySelector('#reservationHourSpan').innerHTML = setTime + '시 00분';
        }else{
            timeSet = setTime + '-30';
            document.querySelector('#reservationHourSpan').innerHTML = setTime + '시 30분';
        }

        document.querySelector('#reservationTime').value = timeSet;
        document.querySelector('#reservationDateSpan').innerHTML = document.querySelector('#selectDateSpan').innerHTML;
        document.querySelector('#dataArea').style.display = '';
        document.querySelector('#timeSelectArea').style.display = 'none';

    }
</script>

