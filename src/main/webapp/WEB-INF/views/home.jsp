<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="#">
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/common.js"></script>
    <title>Qaru</title>
</head>
<body>

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
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>

<div class="container-md" style="height:     55%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-6 text-center">
            <div class="card" style="padding:8px">
                <h2>어서오세요</h2>
                나만의 QR 코드를 만들 수 있는 최고의 사이트 Qaru
            </div>
            <div class="row g-0">
                <div class="col-6">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary">
                            <i class="bi bi-qr-code fs-4" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">QR 코드 생성</h8>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="padding:8px">
                        <c:choose>
                            <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName == null}">
                                <button type="button" class="btn btn-outline-light_green"
                                        onclick="location.href='/user/login'">
                                    <i class="bi bi-box-arrow-in-right fs-4"></i>
                                </button>
                                <h8 style="padding-top: 10px;">로그인</h8>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-outline-pink"
                                        onclick="location.href='/user/logout'">
                                    <i class="bi bi-box-arrow-in-right fs-4"></i>
                                </button>
                                <h8 style="padding-top: 10px;">로그아웃</h8>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="padding:8px">
                        <c:choose>
                            <c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName == null}">
                                <button type="button" class="btn btn-outline-info"
                                        onclick="location.href='/user/signup'"
                                        style="--bs-btn-hover-color: white; --bs-btn-active-color: white">
                                    <i class="bi bi-person-circle fs-4"></i>
                                </button>
                                <h8 style="padding-top: 10px;">회원가입</h8>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-outline-mint"
                                        onclick="location.href='/user/mypage'"
                                        style="--bs-btn-hover-color: white; --bs-btn-active-color: white">
                                    <i class="bi bi-person-circle fs-4"></i>
                                </button>
                                <h8 style="padding-top: 10px;">마이페이지</h8>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<%-- ---------------------------- --%>

<div class="container-md">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-6 text-center">
            <div class="row g-0">
                <div class="card" style="padding:8px">
                    <h3><i class="bi bi-list"></i>&nbsp;MENU</h3>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink"
                                onclick="location.href='/tour/tourList?page=0&size=9'">
                            <i class="bi bi-bus-front-fill fs-3" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">여행</h8>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-pink">
                            <i class="bi bi-clipboard-heart fs-3"></i>
                        </button>
                        <h8 style="padding-top: 10px;">식당</h8>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink">
                            <i class="bi bi-card-checklist fs-3" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">일정</h8>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>
</body>
</html>

