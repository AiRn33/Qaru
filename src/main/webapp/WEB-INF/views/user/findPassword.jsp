<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>비밀번호 찾기</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid"></div>
                            <div class="invalid-feedback" style="text-align: right; font-size: 11px; color: #ff6b81">
                                회원가입 때 입력한 이메일을 입력해주세요.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="userEmail" placeholder="name@example.com">
                            <label for="userEmail">이메일 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid"></div>
                            <div class="invalid-feedback" style="text-align: right; font-size: 11px; color: #ff6b81">
                                회원가입 때 입력한 아이디를 입력해주세요.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="userId" placeholder="userid">
                            <label for="userId">아이디 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
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

        let email = document.querySelector('#userEmail').value;
        let userId = document.querySelector('#userId').value;

        if(!email_check(email)){
            alert('이메일 형식이 아닙니다.');
            return false;
        }
        if(userId == ''){
            alert('아이디가 입력되지 않았습니다.');
            return false;
        }

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/user/find-password",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {email : email, userId : userId},
            success: function (res) {
                if(res > 0){
                    location.href='/user/password/' + res;
                }else{
                    alert('일치하는 회원이 없습니다.');
                }
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert('에러 발생');
            }
        });
    }
</script>
