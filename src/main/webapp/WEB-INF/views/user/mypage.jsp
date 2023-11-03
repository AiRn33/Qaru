<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>마이페이지</h1>
            </div>
            <div class="has-validation admin_check" style="position: relative;flex-wrap: wrap;align-items: stretch;width: 100%;">
                <div class="form-floating is-invalid"></div>
                <div class="invalid-feedback"></div>
                <div class="invalid-feedback-common" style="text-align: right;font-size: 11px;color: #ff6b81;">&nbsp;&nbsp; 사장 유저입니다.</div>
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
                                    &nbsp;수정하기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0 user_check">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="submit" class="btn btn-mint" onclick="location.href='/user/change-admin'">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;사장으로 전환하기
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
        if(${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'USER'}){
            document.querySelector('.admin_check').innerHTML = '';
        }else{
            document.querySelector('.user_check').innerHTML = '';
        }
    }
</script>
