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
                                    <div id="reservationNameArea"></div>
                                </div>
                                <div class="form-floating mb-1">
                                    <input type="text" class="form-control" name="reservationPhone"
                                           placeholder=""
                                           value="" id="reservationPhone">
                                    <label for="reservationPhone">예약자 연락처 &nbsp;<i class="bi bi-mouse"></i></label>
                                    <div id="reservationPhoneArea"></div>
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
                                <div class="form-floating mb-1" style="text-align: center; font-size: 12px; color: red;"
                                     id="limitNumSpan">

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
                                <button type="button" class="btn btn-bluemint" style="width: 95%;"
                                        onclick="reservationSubmit()">
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

    let reservationCheckList;
    let reservationValid = [];
    let reservationValidCount = 0;
    let reservationValidCheckCount = 0;

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
                reservationCheckList = res.reservationCheck;
                for (let i = 0; i < reservationCheckList.length; i++) {
                    if (res.reservationCheck[i].count >= res.reservationLimitTeam) {
                        reservationValid.push(reservationCheckList[i].reservationTime.slice(11));
                        reservationValidCount++;
                    }
                }

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
                    if (setTime > 24) {
                        setTime = 0;
                    }
                    // 시간이 한 시간인 경우
                    if (reservationTime == '60') {
                        for (let i = reservationOpenTime; i < 24; i++) {
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }
                        setTime = 0;
                        for (let i = setTime; i <= reservationCloseTime; i++) {
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        // 시간이 30분인 경우
                    } else if (reservationTime == '30') {

                        if (reservationOpenMinute == '30') {
                            html += openThirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        } else {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        for (let i = reservationOpenTime + 1; i < 24; i++) {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }
                        setTime = 0;
                        for (let i = setTime; i <= reservationCloseTime - 1; i++) {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        if (reservationCloseMinute == '30') {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                        } else if (reservationCloseMinute == '0') {
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
                        }
                    }

                    document.querySelector('#reservationTimeArea').innerHTML = html;
                    html = '';

                }
                // 예약 시간과 마감 시간이 같은 경우
                else if (reservationOpenTime == reservationCloseTime) {

                    let setTime = reservationOpenTime;

                    if(reservationTime == '60'){
                        if(reservationOpenMinute != '30'){
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
                        }else{
                            html += '예약 불가';
                        }
                    }else{
                        if(reservationOpenMinute == reservationCloseMinute){
                            if(reservationOpenMinute == '30'){
                                html += openThirtyHtml(setTime, reservationValidCheck(setTime));
                            }else{
                                html += sixtyHtml(setTime, reservationValidCheck(setTime));
                            }
                        }else{
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                        }
                    }

                    document.querySelector('#reservationTimeArea').innerHTML = html;
                    html = '';
                }
                // 정상
                else {
                    let setTime = reservationOpenTime;
                    // 시간이 한 시간인 경우
                    if (reservationTime == '60') {

                        if (reservationOpenMinute == '30') {
                            setTime++;
                        }
                        for (let i = 0; i < (reservationCloseTime - reservationOpenTime) + 1; i++) {
                            // 마지막 때
                            if (reservationOpenMinute == '30') {
                                if (i == (reservationCloseTime - reservationOpenTime)) {
                                    if (reservationCloseMinute == '30') {
                                        break;
                                    }
                                }
                            }
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        // 시간이 30분인 경우
                    } else if (reservationTime == '30') {

                        if (reservationOpenMinute == '30') {
                            html += openThirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        } else {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        for (let i = 0; i < (reservationCloseTime - reservationOpenTime) - 1; i++) {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                            setTime++;
                        }

                        if (reservationCloseMinute == '30') {
                            html += thirtyHtml(setTime, reservationValidCheck(setTime));
                        } else if (reservationCloseMinute == '0') {
                            html += sixtyHtml(setTime, reservationValidCheck(setTime));
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

        if (Number(inputCount) >= Number(limitNum)) {
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
        } else if (input == 2) {
            document.querySelector('#timeSelectArea').style.display = '';
            document.querySelector('#dataArea').style.display = 'none';
        }
    }

    function reservationSubmit() {

        if (!validation()) {
            return false;
        }

        let selectDate = (document.querySelector('#selectDate').value).split('-');
        let time = (document.querySelector('#reservationTime').value).split('-');

        if (!confirm('예약자 성함 : ' + document.querySelector('#reservationName').value +
            '\n예약 시간 : ' + selectDate[0] + '년 ' + selectDate[1] + '월 ' + selectDate[2] + '일 ' + time[0] + '시 ' + time[1] + '분' +
            '\n휴대폰 번호 : ' + document.querySelector('#reservationPhone').value +
            '\n예약 인원 : ' + document.querySelector('#inputCount').value +
            '\n예약 하시겠습니까?')) {
            return false;
        }

        let data = {
            selectDate: document.querySelector('#selectDate').value,
            reservationTime: document.querySelector('#reservationTime').value,
            reservationName: document.querySelector('#reservationName').value,
            reservationLimitNum: document.querySelector('#inputCount').value,
            reservationPhone: document.querySelector('#reservationPhone').value
        }

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/reservation-time/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: data,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                alert('예약 완료 \n\n' +
                    '예약자 성함 : ' + res.reservationName +
                    '\n예약 시간 : ' + res.selectDate +
                    '\n휴대폰 번호 : ' + res.reservationPhone +
                    '\n예약 인원 : ' + res.reservationLimitNum);
                location.href = '/';
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });

    }

    function sixtyHtml(setTime, type) {
        let html = '';
        let sixty = '00';

        html += '<div class="col-6">';

        if (type == '1' || type == '3') {
            html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 00분' + '"' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + sixty + ')">';
        } else if (type == '2') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 00분' + '(예약 불가)"' +
                'style="width: 95%" disabled>';
        }
        html += '</div>';

        return html;
    }

    function thirtyHtml(setTime, type) {
        let html = '';
        let sixty = '00';
        let thirty = '30';

        html += '<div class="col-6">';
        if (type == '1' || type == '3') {
            html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 00분' + '"' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + sixty + ')">';
        } else if (type == '2') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 00분' + '(예약 불가)"' +
                'style="width: 95%" disabled>';
        } else if (type == '4') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 00분' + '(예약 불가)"' +
                'style="width: 95%" disabled>';
        }
        html += '</div>';

        html += '<div class="col-6">';
        if (type == '1' || type == '2') {
            html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 30분' + '" ' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + thirty + ')">';
        } else if (type == '3') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 30분' + '(예약 불가)" ' +
                'style="width: 95%;" disabled>';
        } else if (type == '4') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 30분' + '(예약 불가)" ' +
                'style="width: 95%;" disabled>';
        }
        html += '</div>';
        return html;
    }

    function openThirtyHtml(setTime, type) {
        let html = '';
        let thirty = '30';

        html += '<div class="col-6">';
        if (type == '1' || type == '2') {
            html += '<input type="button" class="btn btn-outline-gray" value="' + setTime + '시 30분' + '" ' +
                'style="width: 95%" onclick="reservationDataOn(' + setTime + ', ' + thirty + ')">';
        } else if (type == '3') {
            html += '<input type="button" class="btn btn-gray" value="' + setTime + '시 30분' + '(예약 불가)" ' +
                'style="width: 95%;" disabled>';
        }
        html += '</div>';

        return html;
    }

    function reservationDataOn(setTime, type) {

        let timeSet;
        if (type == '0') {
            timeSet = setTime + '-00';
            document.querySelector('#reservationHourSpan').innerHTML = setTime + '시 00분';
        } else {
            timeSet = setTime + '-30';
            document.querySelector('#reservationHourSpan').innerHTML = setTime + '시 30분';
        }

        document.querySelector('#reservationTime').value = timeSet;
        document.querySelector('#reservationDateSpan').innerHTML = document.querySelector('#selectDateSpan').innerHTML;
        document.querySelector('#dataArea').style.display = '';
        document.querySelector('#timeSelectArea').style.display = 'none';

    }

    function validation() {

        let patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
        let patternKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

        let check = true;

        let phone = document.querySelector('#reservationPhone').value;
        let hipunPhone = phone
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);

        if (!patternPhone.test(hipunPhone)) {
            let html = '';
            html = error('휴대폰 번호를 다시 입력해주세요.');
            document.querySelector('#reservationPhoneArea').innerHTML = html;
            check = false;
        } else {
            document.querySelector('#reservationPhoneArea').innerHTML = '';
        }

        if (!patternKorean.test(document.querySelector('#reservationName').value)) {
            let html = '';
            html = error('예약자명은 한글만 입력가능합니다.');
            document.querySelector('#reservationNameArea').innerHTML = html;
            check = false;
        } else {
            document.querySelector('#reservationNameArea').innerHTML = '';
        }

        if (!check) {
            return false;
        }
        return true;
    }

    function reservationValidCheck(input) {
        if (reservationValidCount > 0) {
            if (input == reservationValid[reservationValidCheckCount].split(':')[0]) {

                if(reservationValid.length > (reservationValidCheckCount + 1)){
                    if (reservationValid[reservationValidCheckCount].split(':')[0] ==
                        reservationValid[reservationValidCheckCount + 1].split(':')[0]) {
                        // 12:00 / 12:30 동시 예약시 체크
                        reservationValidCount = reservationValidCount - 2;
                        reservationValidCheckCount = reservationValidCheckCount + 2;
                        return '4';
                    } else {
                        if (reservationValid[reservationValidCheckCount].split(':')[1] == '30') {
                            reservationValidCount--;
                            reservationValidCheckCount++;
                            return '3';
                        } else {
                            reservationValidCount--;
                            reservationValidCheckCount++;
                            return '2';
                        }
                    }
                }else{
                    if (reservationValid[reservationValidCheckCount].split(':')[1] == '30') {
                        reservationValidCount--;
                        reservationValidCheckCount++;
                        return '3';
                    } else {
                        reservationValidCount--;
                        reservationValidCheckCount++;
                        return '2';
                    }
                }
            }
            return '1';
        }
        return '1';
    }
</script>

