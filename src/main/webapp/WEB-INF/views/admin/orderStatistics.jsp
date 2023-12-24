<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center" >
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
                                <button class="btn btn-outline-gray" type="button" id="dateBtn" style="float: right;">
                                    조회
                                </button>
                                <input class="btn btn-outline-gray" type="text" id="datepicker2"
                                       style="width: 35%; float: right;">
                                <input class="btn btn-outline-gray" type="text" id="datepicker1"
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
                    <div class="col-5 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문 내역</span>
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
                <div class="row g-0">
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">1</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle" style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">주문 유저</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">주문 내역</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 14px;">2023년 11월 12일</span>
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
            </div>
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
        </div>
        <div class="col-2"></div>
    </div>
</div>
<script>
    /* cursor: pointer; */
    $(function () {
        //input을 datepicker로 선언
        $("#datepicker1").datepicker({
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
            , minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , maxDate: "+6M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        $("#datepicker2").datepicker({
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
            , minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , maxDate: "+6M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        //초기값을 오늘 날짜로 설정
        $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
</script>
</body>