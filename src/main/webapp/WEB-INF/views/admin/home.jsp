<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-md" style="height: 110%!important;">
    <h2 style="text-align: center;">어드민 페이지</h2>

    <div class="row d-flex justify-content-center align-items-center h-100">
        <c:choose>
            <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'USER'}">
                <div class="col-4"></div>
                <div class="col-4">
                    <div style="text-align: center; margin-bottom: 10px; color: red;">
                        <span>아직 어드민으로 등록되지 않았습니다.</span>
                    </div>
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-mint" onclick="location.href='/user/change-admin'"
                                style="height: 300px;">
                            <i class="bi bi-people-fill fs-5">
                                &nbsp;사장으로 전환하기
                            </i>
                        </button>
                    </div>
                </div>

                <div class="col-4"></div>
            </c:when>
            <c:otherwise>
                <div class="col-4">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit"  class="btn btn-outline-pink" onclick="location.href='/shop/menu/${shopData.shopId}'"
                                style="height: 300px;">
                            <i class="bi bi-people-fill fs-5">
                                &nbsp;가게메뉴 수정하기
                            </i>
                        </button>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-skyblue" onclick="location.href='/shop/menu'"
                                style="height: 300px;">
                            <i class="bi bi-people-fill fs-5">
                                가게메뉴 등록하기
                            </i>
                        </button>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="--bs-card-border-color: none;">
                        <button type="submit" class="btn btn-outline-skyblue" onclick="location.href='/user/change-admin'"
                                style="height: 300px;">
                            <i class="bi bi-people-fill fs-5">
                                &nbsp;사장으로 전환하기
                            </i>
                        </button>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>