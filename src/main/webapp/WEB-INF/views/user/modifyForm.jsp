<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>내 정보 수정</h1>
            </div>
            <form action="/user/modify" method="post" id="signupForm">
                <input type="hidden" id="userZipcode" name="userZipcode" value="${userData.userZipcode}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="userIdArea">
                                <input type="text" class="form-control" id="userId" name="userId" placeholder="" value="${userData.userId}" disabled>
                                <label for="userId">아이디 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userNicknameArea" >
                                <input type="text" class="form-control" id="userNickname" name="userNickname" value="${userData.userNickname}" placeholder="">
                                <label for="userNickname">닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userEmailArea">
                                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="" value="${userData.userEmail}" disabled>
                                <label for="userEmail">이메일 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userCityArea">
                                <input type="text" class="form-control" id="userCity" name="userCity" placeholder="" value="${userData.userCity}" disabled>
                                <label for="userCity">주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userStreetArea">
                                <input type="text" class="form-control" id="userStreet" name="userStreet" placeholder="" value="${userData.userStreet}" disabled>
                                <label for="userStreet">상세 주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <button type="button" id="address_search" class="btn btn-mint">
                                <i class="bi bi-people-fill fs-7" style="color: white;">
                                    &nbsp; 주소 변경
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-primary" id="submitBtn" onclick="modifySubmit()">
                                <i class="bi bi-people-fill fs-5" style="color: white;">
                                    &nbsp;수정하기
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
        //실행될 코드
        errors();
    }

    document.getElementById("address_search").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.querySelector('#userStreetArea').focus();
                document.querySelector('#userStreet').disabled = false;
                document.querySelector('#userCity').value = data.address;
                document.querySelector('#userStreet').value = '';
                document.querySelector('#userZipcode').value = data.zonecode;
            }
        }).open();
    });

    function modifySubmit(){
        document.querySelector('#userId').disabled = false;
        document.querySelector('#userNickname').disabled = false;
        document.querySelector('#userEmail').disabled = false;
        document.querySelector('#userCity').disabled = false;
        document.querySelector('#userStreet').disabled = false;

        document.querySelector('#signupForm').submit();
    }
</script>

