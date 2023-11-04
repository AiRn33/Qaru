<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>가게 정보 입력</h1>
            </div>
            <form action="/user/change-admin" method="post" id="signupForm" enctype="multipart/form-data">
                <input type="hidden" id="userZipcode" name="userZipcode" value="">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="shopTitleArea">
                                <input type="text" class="form-control" id="shopTitle" name="shopTitle" placeholder=""
                                       value="">
                                <label for="shopTitle">가게 이름 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" style="height: 200px" id="shopCommentArea">
                                <textarea class="form-control" id="shopComment" name="shopComment" placeholder=""
                                          value="" style="height: 200px; resize: none;"></textarea>
                                <label for="shopComment">가게 설명 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>

                            <input type="file" name="file" id="file" style="margin-bottom: 10px; margin-top: 5px;">

                            <div class="form-floating mb-1" id="userCityArea">
                                <input type="text" class="form-control" id="userCity" name="userCity" placeholder=""
                                       value="" disabled>
                                <label for="userCity">주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userStreetArea">
                                <input type="text" class="form-control" id="userStreet" name="userStreet" placeholder=""
                                       value="">
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
                            <button type="button" class="btn btn-primary" onclick="Submit()">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function () {
        //실행될 코드
        errors();
    }

    document.getElementById("address_search").addEventListener("click", function () { //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function (data) { //선택시 입력값 세팅
                document.querySelector('#userStreetArea').focus();
                document.querySelector('#userStreet').disabled = false;
                document.querySelector('#userCity').value = data.address;
                document.querySelector('#userStreet').value = '';
                document.querySelector('#userZipcode').value = data.zonecode;
            }
        }).open();
    });

    function Submit(){

        document.querySelector('#userCity').disabled = false;
        document.querySelector('#userStreet').disabled = false;

        document.querySelector('#signupForm').submit();
    }
</script>

