<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-md" style="height: 70%!important; margin-top: 90px;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <h2 style="text-align: center;">
            <i class="bi bi-bar-chart-fill"></i>
            통계 페이지
        </h2>
        <span style="color: red; text-align: center; font-size: 12px; margin-top: 8px;">통계 페이지에서는 지역 통계, 주문 통계를 확인 할 수 있습니다. </span>
        <hr style="margin: 2.4rem;">
        <div class="col-3" style="margin-top: 50px;">
            <div class="card" style="--bs-card-border-color: none;">
                <button type="submit" class="btn btn-outline-pink"
                        style="height: 300px;" onclick="location.href='/admin/home'">
                    <i class="bi bi-person-square fs-5">
                        &nbsp;사장페이지 돌아가기
                    </i>
                </button>
            </div>
        </div>
        <div class="col-3" style="margin-top: 50px;">
            <div class="card" style="--bs-card-border-color: none;">
                <button type="submit" class="btn btn-outline-light_green"
                        style="height: 300px;" onclick="location.href='/admin/order-statistics'">
                    <i class="bi bi-list fs-5">
                        &nbsp;주문 통계보기
                    </i>
                </button>
            </div>
        </div>
        <div class="col-3" style="margin-top: 50px;">
            <div class="card" style="--bs-card-border-color: none;">
                <button type="submit" class="btn btn-outline-bluemint"
                        style="height: 300px;" onclick="location.href='/admin/city-statistics'">
                    <i class="bi bi-map-fill fs-5">
                        &nbsp;지역 통계보기
                    </i>
                </button>
            </div>
        </div>
    </div>
</div>
