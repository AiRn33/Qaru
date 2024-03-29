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
                    <span style="font-size: 30px;">메뉴별 주문 통계 조회</span>
                    <br>
                    <span style="font-size: 12px; color: red;">메뉴별 주문 통계 조회에서는 총 주문량을 확인할 수 있습니다.</span>
                    <hr style="margin: 0.4rem;">
                </div>
            </div>
            <div>
                <div class="row g-0" id="menuArea">
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">메뉴 이름</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">총 주문 수량</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                    </div>
                    <div class="col-3 align-self-center">
                        <button type="button" class="btn btn-outline-gray" onclick="chart_on()">
                            <i class="bi bi-bar-chart-line fs-5">
                                &nbsp;차트로 보기
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-2"></div>

    </div>
</div>

<div class="container-md" id="container" style="height: 120%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div>
                <div class="row g-0">
                    <div class="col-12" style="line-height:150%;">
                        <span style="font-size: 30px;">주문별 통계 조회</span>
                        <br>
                        <span style="font-size: 12px; color: red;">초기 데이터는 현재 기준 1년 전 데이터까지 조회됩니다.</span>
                        <hr style="margin: 0.4rem;">
                    </div>
                </div>
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
                                       style="width: 35%; float: right;" readonly>
                                <input class="btn btn-outline-gray" type="text" id="startDate"
                                       style="width: 35%; float: right;" readonly>
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
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">순번</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문 유저</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px; line-height:95%;">
                                <span style="color: dimgray; font-size: 18px;">주문 내역</span>
                                <br>
                                <span style="color: red; font-size: 10px;">(클릭 시 확인 가능)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문 가격</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문수</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문 날짜</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">비고</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <c:choose>

                    <c:when test="${orderStatisticsListCount > 0}">

                        <c:forEach var="item" items="${orderStatisticsList}" varStatus="status">
                            <div class="row g-0">
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 14px;">${status.index + 1}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 14px;">${item.userNickName}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="custom_card" style="padding:8px; height: 50px; line-height:200%;"
                                         onclick="popup_on('${item.orderMenuId}')">
                                            <span style="font-size: 15px; color: #e74c3c;">
                                               <span>메뉴 확인하기</span>
                                            </span>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 14px;">${item.orderMenuPrice}원</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                            <span style="color: dimgray; font-size: 14px;">${item.orderMenuCount}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                    <span style="color: dimgray; font-size: 14px;">
                                            ${fn:substring(item.createDate, 0, 10)}
                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">
                                    ✔️주문 대기
                                </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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
            <c:if test="${orderStatisticsListCount > 0}">
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
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}" end="${endPageNum}">
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
            </c:if>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<div id="modal-bg" class="modal-bg" style="display: none;">
</div>
<div id="modal-wrap" class="modal-wrap" style="display: none;">
    <div class="container-md" style="height: 110%!important;">
        <div class="row d-flex justify-content-center align-items-center h-100" style="margin-right: 12px;">
            <div class="col-1"></div>
            <div class="col-10 text-center">
                <div class="card" style="padding:8px">
                    <h2>상세 주문 내역</h2>
                </div>
                <div class="row g-0">
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle">
                                <span style="color: dimgray; font-size: 18px;">번호</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle">
                                <span style="color: dimgray; font-size: 18px;">메뉴 이름</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle">
                                <span style="color: dimgray; font-size: 18px;">메뉴 수량</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="orderDataArea">

                </div>
                <div class="row g-0" style="margin-top: 15px;">
                    <div class="col-12 align-self-center">
                        <button type="button" class="btn btn-pink" onclick="popup_close()">
                            <i class="bi bi-x-circle fs-5" style="color: white">
                                &nbsp;팝업 닫기
                            </i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-1"></div>
    </div>
</div>
</div>
<div id="chart-bg" class="modal-bg" style="display: none;">
</div>
<div id="chart-wrap" class="modal-wrap-graph" style="display: none;">
    <button type="button" class="btn btn-outline-gray" style="border-radius: inherit; float: right;" onclick="chart_close()">
        <i class="bi bi-x-circle fs-5">
        </i>
    </button>
    <canvas id="myChart" width="300" height="300"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script>
    window.onload = function () {

        //실행될 코드
        document.querySelector('#startDate').value = '${startDate}';
        document.querySelector('#endDate').value = '${endDate}';

        document.querySelector('#container').style.height = '90%';

        orderMenuStatistics();
    }

    function searchOrderList() {
        let start = document.querySelector('#startDate').value;
        let end = document.querySelector('#endDate').value;

        location.href = '/admin/order-statistics?page=0&size=7&startDate=' + start + '&endDate=' + end;
    }
    function chart_on() {
        document.querySelector('#chart-bg').style.display = '';
        document.querySelector('#chart-wrap').style.display = '';
    }

    function chart_close() {
        document.querySelector('#chart-bg').style.display = 'none';
        document.querySelector('#chart-wrap').style.display = 'none';
    }

    function chart(input){
        const ctx = document.getElementById('myChart').getContext('2d');
        let menuNameArr = new Array();
        let dataArr = new Array();
        console.log(input);
        for(let i = 0; i < input.length; i++){
            menuNameArr.push(input[i].menuName);
            dataArr.push(input[i].menuCount);
        }
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: menuNameArr,
                datasets: [{
                    label: '# of Votes',
                    data: dataArr,
                    backgroundColor: [
                        'rgba(255, 0, 0, 0.2)',
                        'rgba(0, 255, 0, 0.2)',
                        'rgba(0, 0, 255, 0.2)',
                        'rgba(255, 255, 0, 0.2)',
                        'rgba(255, 0, 255, 0.2)',
                        'rgba(0, 255, 255, 0.2)',
                        'rgba(128, 0, 0, 0.2)',
                        'rgba(0, 128, 0, 0.2)',
                        'rgba(0, 0, 128, 0.2)',
                        'rgba(128, 128, 0, 0.2)',
                        'rgba(128, 0, 128, 0.2)',
                        'rgba(0, 128, 128, 0.2)',
                        'rgba(128, 128, 128, 0.2)',
                        'rgba(192, 192, 192, 0.2)',
                        'rgba(255, 165, 0, 0.2)',
                        'rgba(0, 128, 255, 0.2)',
                        'rgba(0, 0, 0, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 0, 0, 0.2)',
                        'rgba(0, 255, 0, 0.2)',
                        'rgba(0, 0, 255, 0.2)',
                        'rgba(255, 255, 0, 0.2)',
                        'rgba(255, 0, 255, 0.2)',
                        'rgba(0, 255, 255, 0.2)',
                        'rgba(128, 0, 0, 0.2)',
                        'rgba(0, 128, 0, 0.2)',
                        'rgba(0, 0, 128, 0.2)',
                        'rgba(128, 128, 0, 0.2)',
                        'rgba(128, 0, 128, 0.2)',
                        'rgba(0, 128, 128, 0.2)',
                        'rgba(128, 128, 128, 0.2)',
                        'rgba(192, 192, 192, 0.2)',
                        'rgba(255, 165, 0, 0.2)',
                        'rgba(0, 128, 255, 0.2)',
                        'rgba(0, 0, 0, 0.2)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    function popup_on(input) {
        let html = '';

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/admin/order-statistics",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {id: input},
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                for (let i = 0; i < res.length; i++) {

                    html += '<div class="row g-0">'
                    html += '   <div class="col-2 align-self-center">'
                    html += '       <div class="card" style="padding:8px; height: 50px;">'
                    html += '           <div class="form-floating mb-1 align-middle" style="height: 170%;">'
                    html += '               <span style="color: dimgray; font-size: 15px;">' + (i + 1) + '</span>'
                    html += '           </div>'
                    html += '       </div>'
                    html += '   </div>'
                    html += '       <div class="col-6 align-self-center">'
                    html += '           <div class="card" style="padding:8px; height: 50px;">'
                    html += '               <div class="form-floating mb-1 align-middle">'
                    html += '                   <span style="color: dimgray; font-size: 15px;">' + res[i].menuName + '</span>'
                    html += '               </div>'
                    html += '           </div>'
                    html += '       </div>'
                    html += '       <div class="col-4 align-self-center">'
                    html += '           <div class="card" style="padding:8px; height: 50px;">'
                    html += '               <div class="form-floating mb-1 align-middle">'
                    html += '                   <span style="color: dimgray; font-size: 15px;">' + res[i].menuCount + '개</span>'
                    html += '               </div>'
                    html += '           </div>'
                    html += '       </div>'
                    html += '</div>'
                }
                document.querySelector('#orderDataArea').innerHTML += html;
                if (res.length > 4) {
                    let heightLength = res.length * 100;
                    document.querySelector('#modal-wrap').style.height = heightLength + "px";
                } else {
                    document.querySelector('#modal-wrap').style.height = "500px";
                }

                document.querySelector('#modal-bg').style.display = '';
                document.querySelector('#modal-wrap').style.display = '';
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
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
                , minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
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
            , minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , onSelect: function (date) {

            }
        });

        // 선택 최대값 설정
        $('#startDate').datepicker("option", "maxDate", maxDate);
        $('#endDate').datepicker("option", "maxDate", maxDate);
    });

    function pageMove(pageNum) {

        let num = pageNum;
        let startDate = document.querySelector('#startDate').value;
        let endDate = document.querySelector('#endDate').value;

        location.href = '/admin/order-statistics?page=' + num + '&size=7&startDate=' + startDate + '&endDate=' + endDate;

    }

    function orderMenuStatistics() {
        $.ajax({
            type: "get",            // HTTP method type(GET, POST) 형식이다.
            url: "/admin/order-statistics/3497",      // 컨트롤러에서 대기중인 URL 주소이다.
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                chart(res);
                let html = '';
                for (let i = 0; i < res.length; i++) {
                    html += '<div class="col-2 align-self-center">';
                    html += '<div class="card" style="padding:8px; height: 50px;">';
                    html += '<div class="form-floating mb-1 align-middle" style="margin-top: 3px;">'
                    html += '<span style="color: dimgray; font-size: 14     px;">' + res[i].menuName + '</span>';
                    html += '</div></div></div>';
                    html += '<div class="col-2 align-self-center">';
                    html += '<div class="card" style="padding:8px; height: 50px;">';
                    html += '<div class="form-floating mb-1 align-middle" style="margin-top: 3px;">'
                    html += '<span style="color: dimgray; font-size: 14px;">' + res[i].menuCount + '</span>';
                    html += '</div></div></div>';

                }

                document.querySelector('#menuArea').innerHTML += html;
                document.querySelector('#container').style.height = 110 + (res.length / 6 * 15) + '%';

            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
    }
</script>
</body>