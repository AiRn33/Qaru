<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-1"></div>
        <div class="col-10 text-center">
            <div class="card" style="padding:8px;">
                <h1 style="margin-top: 10px;">주문 내역 확인</h1>
                <span style="color: dimgray; font-size: 15px;">가게 이름 : ${orders[0].shopName}</span>
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
                    <div class="col-4 align-self-center">
                        <div class="card" style="padding:8px; height: 50px; line-height:115%;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 15px;">
                                    주문 메뉴
                                </span>
                                <br>
                                <span style="color: red; font-size: 11px;">(클릭 시 주문 갯수 확인이 가능합니다)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">주문 갯수</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">총 메뉴 가격</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div style="margin-top: 3px;">
                                <span style="color: dimgray; font-size: 18px;">상태</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${ordersCount > 0}">
                    <c:forEach items="${orders}" varStatus="status" var="item">
                        <div>
                            <div class="row g-0">
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px; line-height:180%;">
                                        <div class="form-floating mb-1 align-middle">
                                            <span style="color: dimgray; font-size: 18px;">${status.index + 1}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px; line-height:180%;">
                                        <div class="form-floating mb-1 align-middle">
                                            <span style="color: dimgray; font-size: 18px;">${item.userNickName}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 align-self-center">
                                    <c:forEach items="${item.orderData}" var="data">
                                        <input type="hidden" name="orderData_${status.index}"
                                               value="${data.menuName}/${data.menuCount}">
                                    </c:forEach>
                                    <div class="custom_card" style="padding:8px; height: 50px; line-height:180%;"
                                         onclick="popup_on('orderData_${status.index}')">
                                            <span style="font-size: 13px;">
                                                <c:choose>
                                                    <c:when test="${fn:length(item.menuNameAll) > 35}">
                                                        ${fn:substring(item.menuNameAll, 0, 35)} ...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${item.menuNameAll}
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                    </div>

                                </div>
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;  line-height:180%;">
                                        <div>
                                            <span style="font-size: 15px; font-weight: bold">${item.orderMenuCount} 개</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div style="margin-top: 3px;">
                                            <span style="color: red;font-size: 18px; font-weight: bold; text-decoration-line: underline; margin-top: 3px;">${item.orderMenuPrice} 원</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding: 6px 5px 7px 5px; height: 50px;">
                                        <div>
                                                <span style="font-size: 15px; font-weight: bold;">
                                                    <select class="form-select" onchange="orderStatusUpdate(this.value, '${item.orderMenuId}')">
                                                        <option value="1"<c:if test="${item.statusType == 'INCOMPLETE'}">selected</c:if>>✔️주문 대기</option>
                                                          <option value="2"<c:if test="${item.statusType == 'COMPLETE'}">selected</c:if>>⭕주문 완료</option>
                                                    </select>
                                                </span>
                                        </div>
                                    </div>
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
                            <label style="font-size: 15px; font-weight: lighter;">주문한 내역이 없습니다.</label>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="row g-0" style="margin-top: 10px;">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="location.href='/admin/home'">
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

<script>

    function popup_on(input) {
        let data = document.getElementsByName(input);
        let html = '';

        for (let i = 0; i < data.length; i++) {

            let value = data[i].value.split('/');

            html += '<div class="row g-0">'
            html += '   <div class="col-2 align-self-center">'
            html += '       <div class="card" style="padding:8px; height: 50px;">'
            html += '           <div class="form-floating mb-1 align-middle">'
            html += '               <span style="color: dimgray; font-size: 18px;">' + (i + 1) + '</span>'
            html += '           </div>'
            html += '       </div>'
            html += '   </div>'
            html += '       <div class="col-6 align-self-center">'
            html += '           <div class="card" style="padding:8px; height: 50px;">'
            html += '               <div class="form-floating mb-1 align-middle">'
            html += '                   <span style="color: dimgray; font-size: 18px;">' + value[0] + '</span>'
            html += '               </div>'
            html += '           </div>'
            html += '       </div>'
            html += '       <div class="col-4 align-self-center">'
            html += '           <div class="card" style="padding:8px; height: 50px;">'
            html += '               <div class="form-floating mb-1 align-middle">'
            html += '                   <span style="color: dimgray; font-size: 18px;">' + value[1] + '</span>'
            html += '               </div>'
            html += '           </div>'
            html += '       </div>'
            html += '</div>'
        }
        document.querySelector('#orderDataArea').innerHTML += html;

        if(data.length > 4){
            let heightLength = data.length * 85;
            document.querySelector('#modal-wrap').style.height = heightLength + "px";
        }else{
            document.querySelector('#modal-wrap').style.height = "500px";
        }

        document.querySelector('#modal-bg').style.display = '';
        document.querySelector('#modal-wrap').style.display = '';
    }

    function popup_close() {
        document.querySelector('#orderDataArea').innerHTML = '';

        document.querySelector('#modal-bg').style.display = 'none';
        document.querySelector('#modal-wrap').style.display = 'none';
    }


    function orderStatusUpdate(value, menuId){
        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/admin/order/" + menuId,      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {value : value},
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                console.log(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }
</script>

