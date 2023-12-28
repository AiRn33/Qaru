<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
    swiper-container {
        width: 100%;
        height: 100%;
    }

    swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
</style>
<div class="container-md" style="height: 105%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <%--        <div class="col-2"></div>--%>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h2><i class="bi bi-cart"></i>&nbsp;&nbsp;${shopData.shopName}</h2>
                <hr style="margin: 0.4rem;">
                <div class="card" style="padding:8px">
                    <div class="row g-0">
                        <div class="col-4">
                            <span>가게 설명</span>
                            <hr style="margin: 0.4rem;">
                            <span>${shopData.shopComment}</span>
                        </div>
                        <div class="col-4">
                            <span>가게 종류</span>
                            <hr style="margin: 0.4rem;">
                            <span>${shopData.shopType}</span>
                        </div>
                        <div class="col-4">
                            <span>가게 영업 정보</span>
                            <hr style="margin: 0.4rem;">
                            <span>
                                <span style="font-size: 13px; color: dimgray;">영업일 :</span>
                                <span style="font-size: 13px; color: red;">
                                    <c:if test="${shopData.mon == 'true'}">월</c:if>
                                    <c:if test="${shopData.tues == 'true'}">화</c:if>
                                    <c:if test="${shopData.wed == 'true'}">수</c:if>
                                    <c:if test="${shopData.thur == 'true'}">목</c:if>
                                    <c:if test="${shopData.fri == 'true'}">금</c:if>
                                    <c:if test="${shopData.sat == 'true'}">토</c:if>
                                    <c:if test="${shopData.sun == 'true'}">일</c:if>
                                </span>
                                <span style="font-size: 13px; color: dimgray;">&nbsp;&nbsp;&nbsp; 휴일 :</span>
                                <span style="font-size: 13px; color: red;">
                                    <c:if test="${shopData.mon == 'false'}">월</c:if>
                                    <c:if test="${shopData.tues == 'false'}">화</c:if>
                                    <c:if test="${shopData.wed == 'false'}">수</c:if>
                                    <c:if test="${shopData.thur == 'false'}">목</c:if>
                                    <c:if test="${shopData.fri == 'false'}">금</c:if>
                                    <c:if test="${shopData.sat == 'false'}">토</c:if>
                                    <c:if test="${shopData.sun == 'false'}">일</c:if>
                                </span>
                            </span>
                            <br>
                            <span>
                                <span style="font-size: 13px; color: dimgray;">
                                    영업 시간 :
                                    ${shopData.openTime}시${shopData.openMinute}분 ~ ${shopData.closeTime}시${shopData.closeMinute}분
                                </span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-2"></div>
                <div class="col-8" style="margin-top: 10px;">
                    <div class="card"  style="width: auto; height: 500px;">
                    <swiper-container class="mySwiper" pagination="true">
                        <c:forEach items="${menuList}" var="item">
                            <swiper-slide>
                                <div>
                                    <img src="/img/${item.storedFileName}" style="width: 450px; height: 300px;">
                                    <hr style="margin: 0.4rem;">
                                    <div style="font-size: 17px;">${item.menuName}</div>
                                    <hr style="margin: 0.4rem;">
                                    <div style="font-size: 13px;">${item.menuComment}</div>
                                    <hr style="margin: 0.4rem;">
                                    <div style="font-size: 13px;">${item.menuPrice}원</div>
                                </div>
                            </swiper-slide>
                        </c:forEach>
                    </swiper-container>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row g-0">
                <div class="col-3"></div>
                <div class="col-6" style="margin-top: 10px;">
                    <div class="card">
                        <button class="btn btn-outline-bluemint" onclick="location.href='/order/menu/${shopData.shopId}?order=site'">
                            <i class="bi bi-shop"></i>
                            &nbsp;&nbsp;매장 식사 주문 하기
                        </button>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row g-0">
                <div class="col-3"></div>
                <div class="col-3" style="margin-top: 10px;">
                    <div class="card">
                        <button class="btn btn-outline-pink" onclick="location.href='/order/menu/${shopData.shopId}?order=take'">
                            <i class="bi bi-basket"></i>
                            &nbsp;&nbsp;포장 하기
                        </button>
                    </div>
                </div>
                <div class="col-3" style="margin-top: 10px;">
                    <div class="card">
                        <button class="btn btn-outline-light_green" onclick="location.href='/shop/reservation/${shopData.shopId}'">
                            <i class="bi bi-calendar-check"></i>
                            &nbsp;&nbsp;예약 하기
                        </button>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
