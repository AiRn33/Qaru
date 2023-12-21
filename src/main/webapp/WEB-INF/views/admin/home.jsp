<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-md" style="height: 70%!important; margin-top: 90px;">

    <div class="row d-flex justify-content-center align-items-center h-100">
        <h2 style="text-align: center;">
            <i class="bi bi-person-square"></i>
             사장 페이지
        </h2>
        <span style="color: red; text-align: center; font-size: 12px; margin-top: 8px;">사장페이지에서는 사장 등록/수정, 가게메뉴 등록/수정, 가게주문 확인이 가능합니다. </span>
        <span style="color: blue; text-align: center; font-size: 12px; margin-top: 8px;">가게 메뉴 등록 시 가게 노출을 설정할 수 있습니다.</span>
        <hr style="margin: 2.4rem;">
        <c:choose>
            <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'USER'}">
                <div class="col-4"></div>
                <div class="col-4" style="margin-top: 50px;">
                    <div style="text-align: center; margin-bottom: 10px; color: red;">
                        <span>아직 사장 유저로 등록되지 않았습니다.</span>
                    </div>
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-bluemint" onclick="location.href='/admin/change-admin'"
                                style="height: 300px;">
                            <i class="bi bi-person-square fs-5">
                                &nbsp;사장 전환하기
                            </i>
                        </button>
                    </div>
                </div>
                <div class="col-4"></div>
            </c:when>
            <c:otherwise>
                <div class="col-3" style="margin-top: 50px;">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit"  class="btn btn-outline-bluemint" onclick="location.href='/admin/change-admin-modify'"
                                style="height: 300px;">
                            <i class="bi bi-person-square fs-5">
                                &nbsp;가게정보 수정하기
                            </i>
                        </button>
                    </div>
                </div>
                <div class="col-3" style="margin-top: 50px;">
                    <div class="card" style="--bs-card-border-color: none;">
                        <c:choose>
                            <c:when test="${shopData.menuViewCheck}">
                                <button type="submit"  class="btn btn-outline-mint" onclick="location.href='/shop/menu/${shopData.shopId}'"
                                        style="height: 300px;">
                                    <i class="bi bi-basket2-fill fs-5">
                                        &nbsp;메뉴 수정하기
                                    </i>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit"  class="btn btn-outline-mint" onclick="location.href='/shop/menu'"
                                        style="height: 300px;">
                                    <i class="bi bi-basket2-fill fs-5">
                                        &nbsp;메뉴 등록하기
                                    </i>
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-3" style="margin-top: 50px;">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-pink"
                                style="height: 300px;" onclick="location.href='/admin/orders'">
                            <i class="bi bi-shop fs-5">
                                &nbsp;주문 확인하기
                            </i>
                        </button>
                    </div>
                </div>
                <div class="col-3" style="margin-top: 50px;">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-yellow"
                                style="height: 300px;">
                            <i class="bi bi-shop fs-5">
                                &nbsp;가게 통계보기
                            </i>
                        </button>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    console.log('${shopData}');
</script>