<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>로그인</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">아이디 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword" >비밀번호 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-light_green">
                            <i class="bi bi-box-arrow-in-right fs-5" style="color: white;">
                                &nbsp;로그인
                            </i>
                        </button>
                    </div>
                </div>
            </div>
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
                        <button type="button" class="btn btn-outline-secondary"  onclick="location.href='/user/findId'">
                            아이디 찾기
                        </button>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-secondary"  onclick="location.href='/user/findPassword'">
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
