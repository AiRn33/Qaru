<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<input type="hidden" id="errorScript" value="${errorScript}">

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-6 text-center">
            <div class="card" style="padding:8px">
                <h1>회원가입</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="form-floating mb-1" id="userIdArea">
                            <div style="text-align: center; font-size: 17px">
                                입력 해주신 Email : <span style="color: #ff7675">${email}</span><br>
                                로 인증링크를 전송하였습니다<br><br>
                                인증 하신 뒤 로그인이 가능합니다
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="location.href='/'">
                            <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                &nbsp;홈으로 이동
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
    window.onload = function () {
        //실행될 코드
        errors();
    }
</script>
