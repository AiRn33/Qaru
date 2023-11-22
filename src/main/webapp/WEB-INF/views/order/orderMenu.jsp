<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>메뉴 등록</h1>
            </div>
            <div class="card" style="padding:8px">
                <div class="row g-0">
                    <div class="col-4">
                        <span>가게 이름</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shop_name}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 설명</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shop_comment}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 종류</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shop_type}</span>
                    </div>
                </div>
            </div>



            <form id="menuForm" method="post" action="/order/menu/${shopData.shop_id}">
                <input type="hidden" id="menu_count" value="${menuListCount}">
                <c:forEach items="${menuList}" varStatus="status" var="item">
                    <input type="hidden" id="menu_id_${status.index}" name="menuId" value="${item.menuId}">
                    <div>
                        <div class="col">
                            <div class="card" style="padding:8px; margin-top: 10px; height: auto;">
                                <span>메뉴</span>
                            </div>
                        </div>
                        <div class="row g-0">
                            <div class="col-4">
                                <div class="card" style="padding:8px; height: 271px;">
                                    <span>이미지</span>
                                    <hr style="margin: 0.4rem;">
                                    <div>
                                        <img src="/img/${item.storedFileName}" class="img-thumbnail" alt="..." style="width: 190px; height: 190px;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-5 align-self-center">
                                <div class="card" style="padding:8px; height: 271px;">
                                    <div class="form-floating mb-1 align-middle" style="top: 28%;">
                                        <span style="color: dimgray; font-size: 10px;"><i class="bi bi-chat-left-text"></i>&nbsp; 메뉴 이름 : </span>
                                        <span>&nbsp;&nbsp;${item.menuName}</span>
                                            <hr style="margin: 0.4rem;">
                                        <span style="color: dimgray; font-size: 10px;"><i class="bi bi-chat-right-dots"></i>&nbsp; 메뉴 설명 : </span>
                                        <span>&nbsp;&nbsp;${item.menuComment}</span>
                                            <hr style="margin: 0.4rem;">
                                        <span style="color: red; font-size: 10px;"><i class="bi bi-coin"></i>&nbsp; 메뉴 가격 : </span>
                                        <span>&nbsp;&nbsp;${item.menuPrice} 원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 align-self-center">
                                <div class="card" style="padding:8px; height: 271px;">
                                    <div  style="top: 26%; position: relative;">
                                        <button type="button" class="btn-outline-bluemint btn" style="border: none;" onclick="countUp(${status.index});">
                                            <i class="bi bi-arrow-up-circle"></i>
                                        </button>
                                        <input type="number" id="count_input_${status.index}" name="inputCount"
                                               class="btn btn-outline-bluemint" value="0" style="text-align: center; width: 90%">
                                        <button type="button" class="btn-outline-bluemint btn" style="border: none;" onclick="countDown(${status.index});">
                                            <i class="bi bi-arrow-down-circle"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </form>

            <div class="row g-0" style="margin-top: 10px;">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="Submit()">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;메뉴 주문
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="history.back();">
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

    function countUp(input){
        document.querySelector('#count_input_' + input).value++;
    }

    function countDown(input){
        document.querySelector('#count_input_' + input).value--;

        if(document.querySelector('#count_input_' + input).value < 0){
            document.querySelector('#count_input_' + input).value = 0;
        }
    }

    function Submit(){

        let valueCheck = true;

        for(let i = 0; i < ${menuListCount}; i++){
            if(document.querySelector('#count_input_' + i).value > 0){
                valueCheck = false;
            }
        }

        if(valueCheck){
            alert('주문한 메뉴가 없습니다.');
            return false;
        }
        document.querySelector('#menuForm').submit();
    }
</script>

