<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="errorScript" value="${errorScript}">
<input type="hidden" id="errorScriptImg" value="${errorScriptImg}">

<nav class="navbar navbar-expand-lg" style="left: 10px">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <i class="bi bi-qr-code-scan" style="color: black"></i>&nbsp;
            Qaru
        </a>
        <div>
            <c:choose>
                <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName == null}">
                    <button type="button" class="btn btn-outline-light_green"
                            onclick="location.href='/user/login'" style="--bs-btn-padding-x: 2.75rem">
                        <i class="bi bi-box-arrow-in-right fs-4"></i>
                    </button>
                    <button type="button" class="btn btn-outline-info"
                            onclick="location.href='/user/signup'"
                            style="--bs-btn-hover-color: white; --bs-btn-active-color: white; --bs-btn-padding-x: 2.75rem">
                        <i class="bi bi-person-circle fs-4"></i>
                    </button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn btn-outline-pink"
                            onclick="location.href='/user/logout'" style="--bs-btn-padding-x: 2.75rem">
                        <i class="bi bi-box-arrow-in-right fs-4"></i>
                    </button>
                    <button type="button" class="btn btn-outline-mint"
                            onclick="location.href='/user/mypage'"
                            style="--bs-btn-hover-color: white; --bs-btn-active-color: white; --bs-btn-padding-x: 2.75rem">
                        <i class="bi bi-person-circle fs-4"></i>
                    </button>
                    <button type="button" class="btn btn-outline-bluemint"
                            onclick="location.href='/user/orders'"
                            style="--bs-btn-hover-color: white; --bs-btn-active-color: white; --bs-btn-padding-x: 2.75rem">
                        <i class="bi bi-bag-check fs-4"></i>
                    </button>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>
