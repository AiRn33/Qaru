<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>로그인</h1>
            </div>
            <form action="/login" method="post">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-3" id="userIdArea">
                                <input type="text" class="form-control" id="userId" name="userId">
                                <label for="userId">아이디 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating" id="userPwArea">
                                <input type="password" class="form-control" id="userPw" name="userPw">
                                <label for="userPw">비밀번호 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-6">
                        <div class="card" style="padding:8px">
                            <button type="submit" class="btn btn-light_green">
                                <i class="bi bi-box-arrow-in-right fs-5" style="color: white;">
                                    &nbsp;로그인
                                </i>
                            </button>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card" style="padding:8px; height: 62px;">
                            <button type="button" class="btn btn-warning" onclick="kakao_login()">
                                <i class="bi bi-chat-fill fs-5"style="color: white;">
                                    &nbsp;카카오 로그인
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="location.href='/user/signup'">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;회원가입
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-6">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/find-id'">
                            아이디 찾기
                        </button>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-secondary" onclick="location.href='/user/find-password'">
                            비밀번호 찾기
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
        document.querySelector('#errorScript').value = '${param.errorMsg}';

        //실행될 코드
        errors();
    }

    function kakao_login(){
        location.href='https://kauth.kakao.com/oauth/authorize?client_id=285edf31cf273aca2e93002d8b046c66&redirect_uri=http://localhost:8080/kakao/login&response_type=code';
    }
</script>