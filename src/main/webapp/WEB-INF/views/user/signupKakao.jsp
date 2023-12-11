<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>카카오 회원가입</h1>
            </div>
            <input type="hidden" id="validCk" value="${validCk}">

            <form action="/user/signup-kakao" method="post" id="signupForm">
                <input type="hidden" id="kakaoId" name="kakaoId" value="${kakaoId}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="userIdArea">
                                <input type="text" class="form-control" id="userId" name="userId" placeholder="" value="카카오" disabled>
                                <label for="userId">아이디 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userNicknameArea" >
                                <input type="text" class="form-control" id="userNickname" name="userNickname" value="${userData.userNickname}"
                                       placeholder="">
                                <label for="userNickname">닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userEmailArea">
                                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="" value="${userData.userEmail}">
                                <label for="userEmail">이메일 &nbsp;<i class="bi bi-mouse"></i></label>
<%--                                <spring:hasBindErrors name="userSignUpRequest">--%>
<%--                                    <c:if test="${errors.hasFieldErrors('userEmail')}">--%>
<%--                                        <div class="input-group has-validation">--%>
<%--                                            <div class="form-floating is-invalid">--%>
<%--                                            </div>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                &nbsp;&nbsp;${errors.getFieldError('userEmail').defaultMessage}--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </c:if>--%>
<%--                                </spring:hasBindErrors>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-primary" id="submitBtn" onclick="Submit()">
                                <i class="bi bi-people-fill fs-5" style="color: white;">
                                    &nbsp;회원가입
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
    window.onload = function(){
        //실행될 코드
        errors();
        if(document.querySelector('#validCk').value == ''){
            alert('등록 된 회원이 없습니다. 회원가입을 진행합니다.');
        }
    }

    document.getElementById('body').addEventListener('keydown', (e) => {
        if (e.key == "Enter" || e.keyCode == "13") {
            // 실행할 코드
            Submit();
        }
    });

    function Submit(){
        document.querySelector('#submitBtn').disabled = true;
        document.querySelector('#signupForm').submit();
    }

</script>
