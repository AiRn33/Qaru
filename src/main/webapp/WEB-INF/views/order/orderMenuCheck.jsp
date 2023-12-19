<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <form id="menuForm" method="post" action="">
                <div>
                    <div class="row g-0">
                        <div class="col-12">
                            <span style="font-size: 30px;">주문 내역</span>
                            <hr style="margin: 0.4rem;">
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-2 align-self-center">
                            <div class="card" style="padding:8px; height: 50px;">
                                <div class="form-floating mb-1 align-middle">
                                    <span style="color: dimgray; font-size: 18px;">순번</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-4 align-self-center">
                            <div class="card" style="padding:8px; height: 50px;">
                                <div class="form-floating mb-1 align-middle">
                                    <span style="color: dimgray; font-size: 18px;">메뉴 이름</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-2 align-self-center">
                            <div class="card" style="padding:8px; height: 50px;">
                                <div>
                                    <span style="color: dimgray; font-size: 18px;">주문 갯수</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-2 align-self-center">
                            <div class="card" style="padding:8px; height: 50px;">
                                <div>
                                    <span style="color: dimgray; font-size: 18px;">메뉴 가격</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-2 align-self-center">
                            <div class="card" style="padding:8px; height: 50px;">
                                <div>
                                    <span style="color: dimgray; font-size: 18px;">메뉴 총가격</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${orderData}" varStatus="status" var="item">
                    <input type="hidden" id="menuId_${status.index}" value="${item.menuId}">
                    <input type="hidden" id="orderCount_${status.index}" value="${item.menuCount}">
                    <div>
                        <div class="row g-0">
                            <div class="col-2 align-self-center">
                                <div class="card" style="padding:8px; height: 50px;">
                                    <div class="form-floating mb-1 align-middle">
                                        <span style="color: dimgray; font-size: 18px;">${status.index + 1}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 align-self-center">
                                <div class="card" style="padding:8px; height: 50px;">
                                    <div class="form-floating mb-1 align-middle">
                                        <span style="font-size: 20px; font-weight: bold">${item.menuName}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 align-self-center">
                                <div class="card" style="padding:8px; height: 50px;">
                                    <div>
                                        <span style="font-size: 20px; font-weight: bold">${item.menuCount}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 align-self-center">
                                <div class="card" style="padding:8px; height: 50px;">
                                    <div>
                                        <span style="font-size: 13px; font-weight: bold">${item.menuPrice} 원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 align-self-center">
                                <div class="card" style="padding:8px; height: 50px;">
                                    <div>
                                        <span style="font-size: 15px; font-weight: bold; text-decoration-line: underline;">${item.menuAllPrice} 원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </form>

            <div style="text-align: right; color : red; margin-top: 10px;">
                <span>총 가격 : ${orderAllPrice}</span>
            </div>

            <div class="row g-0" style="margin-top: 10px;">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="kakaopay()">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;메뉴 결제
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="history.back()">
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
        <div class="col-2"></div>
    </div>
</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

    function kakaopay(){

        let today = new Date();
        let year = (String)(today.getFullYear()); // 년도
        let month = (String)(today.getMonth() + 1);  // 월
        let date = (String)(today.getDate());  // 날짜
        let randomNumber = (String)(Math.floor(Math.random() * 10000));
        let orderId = year + month + date + randomNumber;

        var IMP = window.IMP;
        IMP.init('imp18062400');
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "order_" + orderId,
            name : '주문 결제',
            amount : ${orderAllPrice}
        }, function(rsp) {
            if(rsp.success == true){
                createOrder(rsp);
            }else{
                alert('결제 실패. 다시 시도해주세요');
            }
        });
    }
    function createOrder(input){
        let orderData = [];
        let orderMenuCount = ${orderMenuCount};
        for(let i = 0; i < orderMenuCount; i++){
            orderData.push(
                {
                    orderPriceAll: input.paid_amount,
                    menuId: document.querySelector('#menuId_' + i).value,
                    orderCount: document.querySelector('#orderCount_' + i).value
                });
        }


        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/order/${shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: new Blob([JSON.stringify(orderData)], {type: "application/json"}),
            contentType: false,               // * 중요 *
            processData: false,               // * 중요 *
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                if (res > 0) {
                    alert("주문 완료. 주문 메뉴로 이동합니다.");
                    location.href = '/user/orders';
                }
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert('결제 실패.');
            }
        });
    }
</script>

