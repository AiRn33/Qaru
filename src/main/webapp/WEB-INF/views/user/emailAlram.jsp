<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<input type="hidden" id="errorScript" value="${errorScript}">

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-3"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>회원가입</h1>
            </div>
            <form action="/user/emailCheck" method="post">
                <input type="hidden" name="email" id="email" value="${userData.userEmail}">
                <input type="hidden" name="userId" id="userId" value="${userData.userId}">
                <input type="hidden" name="userPw" id="userPw" value="${userData.userPw}">
                <input type="hidden" name="userNickname" id="userNickname" value="${userData.userNickname}">
                <input type="hidden" name="userEmail" id="userEmail" value="${userData.userEmail}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1">
                                <div style="text-align: center; font-size: 17px">
                                    입력 해주신 Email : <span style="color: #ff7675">${userData.userEmail}</span><br>
                                    로 인증링크를 전송하였습니다<br><br>
                                    인증 하신 뒤 로그인이 가능합니다
                                </div>
                            </div>
                            <div class="form-floating mb-1" id="authNumArea">
                                <input type="text" class="form-control" id="authNum" name="authNum"
                                       placeholder="" style="text-align: center">
                                <label for="authNum">인증번호 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-people-fill fs-5" style="color: white;">
                                    &nbsp;인증하기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="location.href='/'">
                            <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                &nbsp;취소하기
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</div>
<script>
    window.onload = function () {
        //실행될 코드
        errors();
    }
</script>
