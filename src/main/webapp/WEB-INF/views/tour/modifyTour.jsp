<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>여행 소개 수정</h1>
            </div>

            <form action="/tour/${tour.tourId}/update" method="post" id="tourForm" enctype="multipart/form-data">
                <input type="hidden" id="zipcode" name="zipcode" value="${tour.zipcode}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="tourTitleArea">
                                <input type="text" class="form-control" id="tourTitle" name="tourTitle" placeholder=""
                                       value="${tour.tourTitle}">
                                <label for="tourTitle">타이틀 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" style="height: 200px" id="tourContentArea">
                                <textarea class="form-control" id="tourContent" name="tourContent" placeholder=""
                                          style="height: 200px; resize: none;">${tour.tourContent}</textarea>
                                <label for="tourContent">내용 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>

                            <div id="imgArea"></div>
                            <input multiple="multiple" type="file" name="file" id="file" onchange="returnImg(this);"
                                   style="display: none;">
                            <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick()">
                                <i class="bi bi-card-image fs-7" style="color: white;">
                                    파일 추가
                                </i>
                            </button>
                            <div style="text-align: right; margin-right: 10px; margin-bottom: 5px;"><label
                                    style="font-size: 12px; color: red;">파일은 5개까지 등록 가능합니다. / 파일을 재등록시 전부 다시 등록해주세요. / 썸네일은 첫번째사진으로 등록됩니다.</label></div>

                            <div id="img_area">
                                <c:forEach items="${images}" var="item">
                                    <img src="/img/${item.storedFileName}" class="img-thumbnail" alt="..." style="width: 120px; height: 120px;" onclick="thumbnailImg(this)">
                                </c:forEach>
                            </div>

                            <div class="form-floating mb-1" id="cityArea">
                                <input type="text" class="form-control" id="city" name="city" placeholder=""
                                       value="${tour.city}" disabled>
                                <label for="city">주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="streetArea">
                                <input type="text" class="form-control" id="street" name="street" placeholder=""
                                       value="${tour.street}">
                                <label for="street">상세 주소 &nbsp;<i class="bi bi-mouse"></i></label>
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
                            <button type="submit" class="btn btn-primary" onclick="Submit()">
                                <i class="bi bi-people-fill fs-5" style="color: white;">
                                    &nbsp;정보 수정
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
        <div class="col-2"></div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    window.onload = function () {
        //실행될 코드
        errors();
        errorsImg();
    }

    document.getElementById("address_search").addEventListener("click", function () { //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function (data) { //선택시 입력값 세팅
                document.querySelector('#streetArea').focus();
                document.querySelector('#street').disabled = false;
                document.querySelector('#city').value = data.address;
                document.querySelector('#street').value = '';
                document.querySelector('#zipcode').value = data.zonecode;
            }
        }).open();
    });


    function Submit() {
        document.querySelector('#city').disabled = false;
        document.querySelector('#street').disabled = false;
        document.querySelector('#tourForm').submit();
    }

    function returnImg(input) {
        let html = '';
        document.querySelector('#img_area').innerHTML = html;

        for(let i = 0; i < input.files.length; i++){
            html += '<img src="" id="preview' + i + '" class="img-thumbnail" alt="..."style="width: 120px; height: 120px;">';
        }
        document.querySelector('#img_area').innerHTML += html;

        for(let i = 0; i < input.files.length; i++){
            var reader = new FileReader();
            reader.onload = function (e) {
                document.querySelector('#preview' + i).src = e.target.result;
            };
            reader.readAsDataURL(input.files[i]);
        }


    }

    function imgClick() {
        document.querySelector('#file').click();
    }
</script>

