<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>마이페이지</h1>
            </div>
            <form action="/user/modify" method="get" id="signupForm">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="userIdArea">
                                <input type="text" class="form-control" id="userId" name="userId" placeholder=""
                                       value="${userData.userId}" disabled>
                                <label for="userId">아이디 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userNicknameArea">
                                <input type="text" class="form-control" id="userNickname" name="userNickname"
                                       value="${userData.userNickname}" placeholder="" disabled>
                                <label for="userNickname">닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userEmailArea">
                                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder=""
                                       value="${userData.userEmail}" disabled>
                                <label for="userEmail">이메일 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userAddressArea">
                                <input type="email" class="form-control" id="userAddress" name="userAddress"
                                       placeholder="" value="${userData.userAddress}" disabled>
                                <label for="userAddress">주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-people-fill fs-5" style="color: white;">
                                    &nbsp;정보 수정하기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0" id="adminChange">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="submit" id="userBtn" class="btn btn-mint"
                                onclick="location.href='/admin/home'">
                            <i class="bi bi-person-square fs-5" style="color: white;">
                                &nbsp;사장 페이지 이동
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
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
        <div class="col-4"></div>
    </div>
</div>
<script>
    window.onload = function () {
        //실행될 코드
        errors();

    }
</script>
