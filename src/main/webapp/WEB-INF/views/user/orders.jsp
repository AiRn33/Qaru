<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>주문 내역</h1>
            </div>

            <div>

                <div class="row g-0">
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle">
                                <span style="color: dimgray; font-size: 18px;">순번</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div class="form-floating mb-1 align-middle">
                                <span style="color: dimgray; font-size: 18px;">가게 이름</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div>
                                <span style="color: dimgray; font-size: 18px;">주문 메뉴</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div>
                                <span style="color: dimgray; font-size: 18px;">총 주문 갯수</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div>
                                <span style="color: dimgray; font-size: 18px;">총 메뉴 가격</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 align-self-center">
                        <div class="card" style="padding:8px; height: 50px;">
                            <div>
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
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle">
                                            <span style="color: dimgray; font-size: 18px;">${status.index + 1}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div class="form-floating mb-1 align-middle">
                                            <span style="font-size: 20px; font-weight: bold">${item.shopName}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div>
                                            <span style="font-size: 10px;">${item.menuNameAll}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div>
                                            <span style="font-size: 15px; font-weight: bold">${item.orderMenuCount} 개</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div>
                                            <span style="color: red;font-size: 15px; font-weight: bold; text-decoration-line: underline;">${item.orderMenuPrice} 원</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1 align-self-center">
                                    <div class="card" style="padding:8px; height: 50px;">
                                        <div>
                                            <c:if test="${item.statusType == 'INCOMPLETE'}">
                                        <span style="font-size: 15px; font-weight: bold;">
                                            제조 중
                                        </span>
                                            </c:if>

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
        <div class="col-2"></div>
    </div>
</div>
<script>

    function countUp(input) {
        document.querySelector('#count_input_' + input).value++;
    }

    function countDown(input) {
        document.querySelector('#count_input_' + input).value--;

        if (document.querySelector('#count_input_' + input).value < 0) {
            document.querySelector('#count_input_' + input).value = 0;
        }
    }

    function Submit() {

        let valueCheck = true;

        for (let i = 0; i < ${menuListCount}; i++) {
            if (document.querySelector('#count_input_' + i).value > 0) {
                valueCheck = false;
            }
        }

        if (valueCheck) {
            alert('주문한 메뉴가 없습니다.');
            return false;
        }
        document.querySelector('#menuForm').submit();
    }
</script>

