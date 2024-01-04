<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-1"></div>
        <div class="col-10 text-center">
            <div class="card" style="padding:8px;">
                <h1 style="margin-top: 10px;">예약 내역</h1>
                <span style="color: red; font-size: 12px;">예약 내역은 과거 2달까지만 확인가능합니다</span>
                <span style="color: red; font-size: 12px;">사장님으로 부터 도착 한 메시지가 있을 시 메시지 버튼이 활성화 됩니다.</span>
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
                    <div class="col-3 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">
                                    예약자 이름 / 번호
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">
                                    예약 날짜
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">인원</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">메시지 입력하기</span>
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
                </div>
            </div>
            <c:choose>
                <c:when test="${reservationCount > 0}">
                    <c:forEach items="${reservationData}" varStatus="status" var="item">
                        <div>
                            <div class="row g-0">
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 95px; line-height:500%;">
                                        <div class="form-floating mb-1 align-middle">
                                            <span style="color: dimgray; font-size: 18px;">${status.index + 1}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3 align-self-center">
                                    <div class="card" style="padding:8px; height: 95px; line-height:500%;">
                                            <span style="font-size: 14px;">
                                                ${item.reservationName}
                                                <hr style="margin: 0.4rem;">
                                                ${item.reservationPhone}
                                            </span>
                                    </div>
                                </div>
                                <div class="col-3 align-self-center">
                                    <div class="card" style="padding:8px; height: 95px; line-height:500%;">
                                        <div>
                                            <span style="font-size: 12px; font-weight: bold">${item.reservationTimes}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 95px; line-height:480%">
                                        <div style="margin-top: 3px;">
                                            <span style="color: red;font-size: 15px; font-weight: bold;
                                            text-decoration-line: underline; margin-top: 3px;">${item.reservationNum} 명</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding: 3px 5px 7px 5px; height: 95px;">
                                        <div style="margin-top: 3px;">
                                            <c:choose>
                                                <c:when test="${item.reservationMessage == ''}">
                                                    <button type="button" class="btn btn-outline-bluemint"
                                                            style="width: 100%; height: 215%;"
                                                            onclick="popup_on(${item.reservationId})">
                                                        <i class="bi bi-chat-dots"></i>
                                                        메세지 입력
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-outline-pink"
                                                            style="width: 100%; height: 215%;"
                                                            onclick="popup_on(${item.reservationId})">
                                                        <i class="bi bi-chat-dots"></i>
                                                        메세지 수정
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <c:choose>
                                        <c:when test="${item.reservationType == 'WAIT'}">
                                            <div class="card"
                                                 style="padding: 2px 5px 7px 5px; height: 95px; line-height: 50%;">
                                                <div style="margin-top: 3px;">
                                                    <span style="font-size: 12px;">
                                                        <button type="button" class="btn btn-outline-gray"
                                                                style="font-size: 14px; width: 100%;"
                                                                onclick="reservationCancel('${item.reservationId}', 'approve')">
                                                           ✔️ 예약 확정하기
                                                        </button>
                                                        <hr style="margin: 0.4rem;">
                                                        <button type="button" class="btn btn-outline-gray"
                                                                style="font-size: 14px; width: 100%;"
                                                                onclick="reservationCancel('${item.reservationId}', 'refuse')">
                                                            ❌ 예약 거절하기
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${item.reservationType == 'APPROVE'}">
                                            <div class="card"
                                                 style="padding: 2px 5px 7px 5px; height: 95px; line-height: 180%;">
                                                <div style="margin-top: 3px;">

                                                    <span style="font-size: 13px;">
                                                        ✔️예약 승인 완료
                                                        <hr style="margin: 0.4rem;">
                                                        <button type="button" class="btn btn-outline-gray"
                                                                style="font-size: 14px; width: 100%;"
                                                                onclick="reservationCancel('${item.reservationId}', 'wait')">
                                                        <i class="bi bi-arrow-repeat fs-7">상태 수정하기</i>
                                                    </button>
                                                    </span>

                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${item.reservationType == 'REFUSE'}">
                                            <div class="card"
                                                 style="padding: 2px 5px 7px 5px; height: 95px; line-height: 180%;">
                                                <div style="margin-top: 3px;">

                                                    <span style="font-size: 13px;">
                                                        ❌예약 거절 완료
                                                        <hr style="margin: 0.4rem;">
                                                        <button type="button" class="btn btn-outline-gray"
                                                                style="font-size: 14px; width: 100%;"
                                                                onclick="reservationCancel('${item.reservationId}', 'wait')">
                                                        <i class="bi bi-arrow-repeat fs-7 ">상태 수정하기</i>
                                                    </button>
                                                    </span>

                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>


                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12">
                        <div class="card" style="padding:8px">
                            <h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 15px; font-weight: lighter;">예약한 내역이 없습니다.</label>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="row g-0" style="margin-top: 10px;">
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
        <div class="col-1"></div>
    </div>
</div>

<div id="modal-bg" class="modal-bg" style="display: none;">
</div>
<div id="modal-wrap" class="modal-wrap" style="display: none;">
    <input type="hidden" id="msgId" value="">
    <div class="container-md" style="height: 110%!important;">
        <div class="row d-flex justify-content-center align-items-center h-100" style="margin-right: 12px;">
            <div class="col-1"></div>
            <div class="col-10 text-center">
                <div class="card" style="padding:8px; height: 35px; line-height: 100%;">
                    <span style="color: dimgray;">고객에게 남길 메시지</span>
                </div>
                <div class="row g-0">
                    <div class="col-12 align-self-center">
                        <div class="card" style="padding:8px;">
                            <div class="form-floating mb-1 align-middle">
                                 <textarea class="form-control" id="msgArea" placeholder=""
                                           style="height: 200px; resize: none;"></textarea>
                                <label for="msgArea">메시지 입력 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="orderDataArea">

                </div>
                <div class="row g-0" style="margin-top: 15px;">
                    <div class="col-6 align-self-center">
                        <button type="button" class="btn btn-bluemint" onclick="changeMsg()" style="width: 95%;">
                            <i class="bi bi-check-circle fs-5" style="color: white">
                                &nbsp;메세지 저장
                            </i>
                        </button>
                    </div>
                    <div class="col-6 align-self-center">
                        <button type="button" class="btn btn-pink" onclick="popup_close()" style="width: 95%;">
                            <i class="bi bi-x-circle fs-5" style="color: white">
                                &nbsp; 팝업 닫기
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

<script>

    function popup_on(id) {

        let html = '';
        $.ajax({
            type: "get",            // HTTP method type(GET, POST) 형식이다.
            url: "/user/reservationMsg/" + id,      // 컨트롤러에서 대기중인 URL 주소이다.
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                document.querySelector('#msgArea').value = res;
                document.querySelector('#msgId').value = id;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
        document.querySelector('#modal-bg').style.display = '';
        document.querySelector('#modal-wrap').style.display = '';
    }

    function popup_close() {
        document.querySelector('#orderDataArea').innerHTML = '';

        document.querySelector('#modal-bg').style.display = 'none';
        document.querySelector('#modal-wrap').style.display = 'none';
    }

    function reservationCancel(id, input) {
        let msg;
        if(input == 'approve'){
            msg = '예약을 승인 하시겠습니까 ?';
        }else if(input == 'refuse'){
            msg = '예약을 거절 하시겠습니까 ?';
        }else if(input == 'wait'){
            msg = '예약 상태를 수정하시겠습니까 ?';
        }

        if (confirm(msg)) {
            $.ajax({
                type: "get",            // HTTP method type(GET, POST) 형식이다.
                url: "/admin/reservationStatus/" + id,      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {status: input},
                success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(input == 'approve'){
                        alert('승인 완료');
                        location.href = '/admin/reservations';
                    }else if(input =='refuse'){
                        alert('거절 완료\n거절 메시지를 고객에게 전송해주세요');
                        popup_on(id);
                    }else if(input =='wait'){
                        alert('상태 변경 완료');
                        location.href = '/admin/reservations';
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.");
                }
            });
        }
    }

    function changeMsg(){

        let id = document.querySelector('#msgId').value;
        let msg = document.querySelector('#msgArea').value;
        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/admin/reservation-msg/" + id,      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {msg : msg.trim().length == 0?'': msg},
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                alert('저장 완료');
                location.href='/admin/reservations';
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }
</script>

