<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-md" style="height: 70%!important; margin-top: 90px;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <h2 style="text-align: center;">
            <i class="bi bi-shop"></i>
            주문 / 예약 페이지
        </h2>
        <span style="color: red; text-align: center; font-size: 12px; margin-top: 8px;">주문 페이지에서는 고객이 결제한 주문 정보를, 예약 페이지에서는 고객의 가게 예약 정보를 확인할 수 있습니다. </span>
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
                        style="height: 300px;" onclick="location.href='/admin/orders'">
                    <i class="bi bi bi-cart-check fs-5">
                        &nbsp;주문 확인하기
                    </i>
                </button>
            </div>
        </div>
        <div class="col-3" style="margin-top: 50px;">
            <div class="card" style="--bs-card-border-color: none;">
                <button type="submit" class="btn btn-outline-bluemint"
                        style="height: 300px;" onclick="location.href='/admin/reservations'">
                    <i class="bi bi-calendar-week fs-5">
                        &nbsp;예약 확인하기
                    </i>
                </button>
            </div>
        </div>
    </div>
</div>

<script>

</script>
