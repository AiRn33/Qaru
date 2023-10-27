<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>회원가입</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="form-floating mb-1">
                            <input type="text" class="form-control" id="floatingInput" placeholder="">
                            <label for="floatingInput">아이디 &nbsp <i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="">
                            <label for="floatingPassword" >비밀번호 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control" id="floatingPasswordCheck" placeholder="">
                            <label for="floatingPasswordCheck" >비밀번호 확인 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" class="form-control" id="nickname" placeholder="">
                            <label for="nickname" >닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="email" class="form-control" id="email" placeholder="">
                            <label for="nickname" >이메일 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>

                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid">
                                <input type="text" class="form-control" id="nickname1" placeholder="">
                                <label for="nickname1" >닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="invalid-feedback" style="text-align: left; font-size: 11px; color: #ff6b81">
                                &nbsp;&nbsp;닉네임을 다시 입력해주세요
                            </div>
                        </div>
                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid">
                            </div>
                            <div class="invalid-feedback" style="text-align: right; font-size: 11px; color: #ff6b81">
                                특수문자는 사용 불가능합니다
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;회원가입
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="javascript:history.back()">
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