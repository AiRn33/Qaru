<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>비밀번호 변경</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid"></div>
                            <div class="invalid-feedback" style="text-align: right; font-size: 11px; color: #ff6b81">
                                변경하실 비밀번호를 동일하게 입력해주세요.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="userPassword" placeholder="name@example.com">
                            <label for="userPassword">비밀번호 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="userPasswordCheck" placeholder="userid">
                            <label for="userPasswordCheck">비밀번호 확인칸&nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="Submit()">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;비밀번호 찾기
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
<script>
    function Submit(){

        let pw = document.querySelector('#userPassword').value;
        let pwCheck = document.querySelector('#userPasswordCheck').value;
        let pwTest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;

        if(pw == '' || pwCheck == ''){
            alert('비밀번호를 입력되지 않았습니다.');
            return false;
        }
        if(pw != pwCheck){
            alert('비밀번호가 일치하지 않습니다.');
            return false;
        }
        if(!pwTest.test(pw)){
            alert('비밀번호는 영문자와 숫자/특수기호가 적어도 1개 이상 포함된 6 ~ 15글자까지의 비밀번호여야 합니다.');
            return false;
        }

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/user/password/${userId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {password : pw},
            success: function (res) {
                if(res > 0){
                    alert('비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.');
                    location.href='/user/login';
                }else{
                    alert('에러 발생');
                }
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert('에러 발생');
            }
        });
    }
</script>
