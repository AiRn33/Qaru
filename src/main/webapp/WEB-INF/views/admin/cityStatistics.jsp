<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md" style="height: 100px;!important;">
    <div class="row d-flex justify-content-center align-items-center h-100" style="margin-top: 40px;">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="row g-0">
                <div class="col-12" style="line-height:150%;">
                    <span style="font-size: 30px;">예약별 지역 통계 조회</span>
                    <br>
                    <span style="font-size: 12px; color: red;">지역별 통계 데이터는 전체 예약자들의 통계입니다.</span>
                    <hr style="margin: 0.4rem;">
                </div>
            </div>
            <div>
                <div class="row g-0">
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">서울</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">인천</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">광주</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">대구</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">대전</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">울산</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">부산</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">제주</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">세종</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 align-self-center">
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.seoul}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.incheon}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.gwangju}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.daegu}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.daejeon}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.ulsan}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.busan}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.jeju}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.sejong}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 align-self-center">
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">경기</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">강원</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">충북</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">충남</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">전북</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">전남</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">경북</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">경남</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 align-self-center">
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.gyeonggi}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.gangwon}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.chungbuk}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.chungnam}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.jeonbuk}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.jeonnam}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.gyeongbuk}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">${area.gyeongnam}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center" style="margin-top: 180px;">
            <div>
                <div class="row g-0">
                    <div class="col-5"></div>
                    <div class="col-7" style="margin-bottom: 10px;">
                        <div style="width: 79%;float: right;">
                            <div style="float: right; margin-bottom: 10px; margin-left: 10px;">
                                날짜 조회&nbsp<span style="font-size: 10px; color: red;">(시작 날짜 / 마지막 날짜)</span>
                            </div>
                            <div style="float: right;">
                                <button class="btn btn-outline-gray" type="button" id="dateBtn" style="float: right;"
                                        onclick="searchOrderList()">
                                    조회
                                </button>
                                <input class="btn btn-outline-gray" type="text" id="endDate"
                                       style="width: 35%; float: right;">
                                <input class="btn btn-outline-gray" type="text" id="startDate"
                                       style="width: 35%; float: right;">
                            </div>
                            <div style="float: right;">
                                <span style="font-size: 10px; color: red;">현재 날짜 기준 1년 전/후로 조회 가능합니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div style="float: right;">
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="row g-0">
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">순번</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">예약 유저</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">번호</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">예약 날짜/시간</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">예약 상태</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">메시지</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${reservationCount     > 0}">
                    <c:forEach items="${reservationList}" varStatus="status" var="item">
                        <div>
                            <div class="row g-0">
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 18px;">${status.index + 1}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 18px;">${item.reservationName}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 15px;">${item.reservationPhone}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 13px;">${item.reservationTimes}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                    <span style="color: dimgray; font-size: 15px;">
                                        <c:choose>
                                            <c:when test="${item.reservationType == 'WAIT'}">
                                                대기
                                            </c:when>
                                            <c:when test="${item.reservationType == 'CANCEL'}">
                                                고객 취소
                                            </c:when>
                                            <c:when test="${item.reservationType == 'APPROVE'}">
                                                예약 승인
                                            </c:when>
                                            <c:when test="${item.reservationType == 'REFUSE'}">
                                                가게 취소
                                            </c:when>
                                        </c:choose>
                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1 align-self-center">
                                    <div class="" style="height: 50px;">
                                        <div style="">
                                    <span style="color: dimgray; font-size: 18px;">
                                        <c:choose>
                                            <c:when test="${item.reservationMessage != ''}">
                                                <button type="button" class="btn btn-outline-pink"
                                                        style="width: 100%; height: 50px;"
                                                        onclick="popup_on(${item.reservationId})">
                                                        <i class="bi bi-chat-dots"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-outline-bluemint"
                                                        style="width: 100%; height: 50px;" disabled>
                                                        <i class="bi bi-x-circle"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>

                                    </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    <div class="row g-0">
                        <div class="col-4"></div>
                        <div class="col-4" style="margin-top: 20px;">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center;">
                                    <c:choose>
                                        <c:when test="${pageNum < 4}">
                                            <li class="page-item">
                                                <a class="page-link" onclick="pageMove(${pageNum})"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                       end="${endPageNum}">
                                                <li class="page-item">
                                                    <a class="page-link"
                                                       onclick="pageMove(${status.index})">${status.index + 1}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" onclick="pageMove(${endPageNum})"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" onclick="pageMove(${pageNum})"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                       end="${pageNum + 4}">
                                                <li class="page-item">
                                                    <a class="page-link"
                                                       onclick="pageMove(${status.index})">${status.index + 1}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" onclick="pageMove(${pageNum + 4})"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </nav>
                        </div>

                        <div class="col-4"></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row g-0">
                        <div class="col-12">
                            <div class="card" style="padding:8px">
                                <h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>
                                <hr style="margin: 0.4rem;">
                                <label style="font-size: 15px; font-weight: lighter;">주문 내역이 없습니다.</label>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-2"></div>
    </div>
</div>
<script>
    window.onload = function () {

        //실행될 코드
        document.querySelector('#startDate').value = '${startDate}';
        document.querySelector('#endDate').value = '${endDate}';
    }

    function searchOrderList() {
        let start = document.querySelector('#startDate').value;
        let end = document.querySelector('#endDate').value;

        location.href = '/admin/city-statistics?page=0&size=7&startDate=' + start + '&endDate=' + end;
    }

    function popup_on(input) {
        alert(input);
    }

    function popup_close() {
        document.querySelector('#orderDataArea').innerHTML = '';

        document.querySelector('#modal-bg').style.display = 'none';
        document.querySelector('#modal-wrap').style.display = 'none';
    }


    /* cursor: pointer; */
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
                , minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , onSelect: function (date) {
                    $('#endDate').datepicker("option", "minDate", date);
                }
            });

        $("#endDate").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            , showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            , showMonthAfterYear: false //년도 먼저 나오고, 뒤에 월 표시
            , changeYear: true //콤보박스에서 년 선택 가능
            , changeMonth: true //콤보박스에서 월 선택 가능
            , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
            , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
            , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
            , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
            , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
            , minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , onSelect: function (date) {
                $('#startDate').datepicker("option", "maxDate", date);
            }
        });
        // 선택 최대값 설정
        maxDate.setMonth(maxDate.getMonth() + 1);
        $('#startDate').datepicker("option", "maxDate", maxDate);
        $('#endDate').datepicker("option", "maxDate", maxDate);
    });

    function pageMove(pageNum) {

        let num = pageNum;
        let startDate = document.querySelector('#startDate').value;
        let endDate = document.querySelector('#endDate').value;

        location.href = '/admin/city-statistics?page=' + num + '&size=7&startDate=' + startDate + '&endDate=' + endDate;

    }


</script>
</body>