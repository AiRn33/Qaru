<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>가게 정보 입력</h1>
            </div>
            <form action="/admin/change-admin" method="post" id="signupForm" enctype="multipart/form-data">
                <input type="hidden" id="userZipcode" name="userZipcode" value="${shopData.userZipcode}">
                <input type="hidden" id="commentCheck" value="${commentCheck}">
                <input type="hidden" id="mon" name="mon">
                <input type="hidden" id="tues" name="tues">
                <input type="hidden" id="wed" name="wed">
                <input type="hidden" id="thur" name="thur">
                <input type="hidden" id="fri" name="fri">
                <input type="hidden" id="sat" name="sat">
                <input type="hidden" id="sun" name="sun">
                <input type="hidden" id="openTimeSet" name="openTime">
                <input type="hidden" id="openMinuteSet" name="openMinute">
                <input type="hidden" id="closeTimeSet" name="closeTime">
                <input type="hidden" id="closeMinuteSet" name="closeMinute">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="shopNameArea">
                                <input type="text" class="form-control" id="shopName" name="shopName" placeholder=""
                                       value="${shopData.shopName}">
                                <label for="shopName">가게 이름 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" style="height: 200px" id="shopCommentArea">
                                <textarea class="form-control" id="shopComment" name="shopComment" placeholder=""
                                          style="height: 200px; resize: none;">${shopData.shopComment}</textarea>
                                <label for="shopComment">가게 설명 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="shopTypeArea">
                                <input type="text" class="form-control" id="shopType" name="shopType" placeholder=""
                                       value="${shopData.shopType}">
                                <label for="shopType">가게 종류 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <span style="text-align: right; font-size: 11px; color: red;">최대 3개까지 등록 가능합니다(복수 등록시 [쉼표 ( , )] 로 구분)</span>
                            <span style="text-align: right; font-size: 11px; color: red;">* 예 : 중식, 한식, 양식</span>
                            <button type="button" class="btn btn-outline-mint" style="margin-top: 5px;"
                                    onclick="popup_on()">
                                <i class="bi bi-alarm fs-7">
                                    &nbsp; 가게 영업 시간/요일 변경
                                </i>
                            </button>

                            <div id="imgArea" style="margin-top: 5px;">

                            </div>
                            <span style="text-align: left; font-size: 12px;">&nbsp;&nbsp;대표 사진</span>
                            <input type="file" name="file" id="file" onchange="returnImg(this);"
                                   style="margin-bottom: 10px; display: none;">
                            <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick()">
                                <i class="bi bi-card-image fs-7" style="color: white;">
                                    파일 추가
                                </i>
                            </button>
                            <input type="text" id="imageTitle" value="${images.originalFileName}" disabled style="text-align: center;">
                            <img src="" id="preview" class="img-thumbnail" alt="..." style="display: none;">

                            <div class="form-floating mb-1" id="userCityArea">
                                <input type="text" class="form-control" id="userCity" name="userCity" placeholder=""
                                       value="${shopData.userCity}" disabled>
                                <label for="userCity">주소 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="userStreetArea">
                                <input type="text" class="form-control" id="userStreet" name="userStreet" placeholder=""
                                       value="${shopData.userStreet}">
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
                                    &nbsp;가게 등록
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="location.href='/admin/home'">
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

<div id="modal-bg" class="modal-bg" style="display: none;">
</div>
<div id="modal-wrap" class="modal-wrap" style="display: none; height: 300px;">
    <div class="container-md" style="height: 110%!important;">
        <div class="row d-flex justify-content-center align-items-center h-100" style="margin-right: 12px;">
            <div class="col-1"></div>
            <div class="col-10 text-center">
                <div class="row g-0">
                    <span style="font-size: 12px;">요일 설정</span>
                    <span style="font-size: 10px; color: red; margin-bottom: 5px;">(선택 시 색이 입력됩니다)</span>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-mon" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-mon" style="font-size: 12px;">월</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-tues" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-tues" style="font-size: 13px;">화</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-wed" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-wed" style="font-size: 13px;">수</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-thur" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-thur" style="font-size: 13px;">목</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-fri" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-fri" style="font-size: 13px;">금</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-sat" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-sat" style="font-size: 13px;">토</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-sun" autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-sun" style="font-size: 13px;">일</label><br>
                    </div>
                    <br><br>
                    <span style="font-size: 12px;">영업 시간 설정</span>
                    <span style="font-size: 10px; color: red; margin-bottom: 5px;">(30분 단위로 선택가능합니다)</span>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">오픈 시간</span>
                    </div>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">닫는 시간</span>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="openTime" style="width: 92px; font-size: 14px;">
                            <option value="00">00시</option>
                            <option value="01">01시</option>
                            <option value="02">02시</option>
                            <option value="03">03시</option>
                            <option value="04">04시</option>
                            <option value="04">05시</option>
                            <option value="04">06시</option>
                            <option value="07">07시</option>
                            <option value="08">08시</option>
                            <option value="09">09시</option>
                            <option value="10">10시</option>
                            <option value="11">11시</option>
                            <option value="12">12시</option>
                            <option value="13">13시</option>
                            <option value="14">14시</option>
                            <option value="15">15시</option>
                            <option value="16">16시</option>
                            <option value="17">17시</option>
                            <option value="18">18시</option>
                            <option value="19">19시</option>
                            <option value="20">20시</option>
                            <option value="21">21시</option>
                            <option value="22">22시</option>
                            <option value="23">23시</option>
                            <option value="24">24시</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="openMinute" style="width: 92px; font-size: 14px;">
                            <option value="00">00분</option>
                            <option value="10">10분</option>
                            <option value="20">20분</option>
                            <option value="30">30분</option>
                            <option value="40">40분</option>
                            <option value="50">50분</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="closeTime" style="width: 92px; font-size: 14px;">
                            <option value="00">00시</option>
                            <option value="01">01시</option>
                            <option value="02">02시</option>
                            <option value="03">03시</option>
                            <option value="04">04시</option>
                            <option value="04">05시</option>
                            <option value="04">06시</option>
                            <option value="07">07시</option>
                            <option value="08">08시</option>
                            <option value="09">09시</option>
                            <option value="10">10시</option>
                            <option value="11">11시</option>
                            <option value="12">12시</option>
                            <option value="13">13시</option>
                            <option value="14">14시</option>
                            <option value="15">15시</option>
                            <option value="16">16시</option>
                            <option value="17">17시</option>
                            <option value="18">18시</option>
                            <option value="19">19시</option>
                            <option value="20">20시</option>
                            <option value="21">21시</option>
                            <option value="22">22시</option>
                            <option value="23">23시</option>
                            <option value="24">24시</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="closeMinute" style="width: 92px; font-size: 14px;">
                            <option value="00">00분</option>
                            <option value="10">10분</option>
                            <option value="20">20분</option>
                            <option value="30">30분</option>
                            <option value="40">40분</option>
                            <option value="50">50분</option>
                        </select>
                    </div>
                </div>
                <div class="row g-0" style="margin-top: 15px;">
                    <div class="col-12 align-self-center">
                        <button type="button" class="btn btn-skyblue" onclick="popup_close()">
                            <i class="bi bi-arrow-right-square fs-7" style="color: white">
                                &nbsp;설정 완료
                            </i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-1"></div>
    </div>
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function () {
        //실행될 코드
        errors();
        errorsImg();

        if (document.querySelector('#commentCheck').value) {
            document.querySelector('#file_btn').style.marginTop = '2px';
        } else {
            document.querySelector('#file_btn').style.marginTop = '5px';
        }

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


    function Submit() {

        document.querySelector('#mon').value = document.querySelector('#btn-check-mon').checked;
        document.querySelector('#tues').value = document.querySelector('#btn-check-tues').checked;
        document.querySelector('#wed').value = document.querySelector('#btn-check-wed').checked;
        document.querySelector('#thur').value = document.querySelector('#btn-check-thur').checked;
        document.querySelector('#fri').value = document.querySelector('#btn-check-fri').checked;
        document.querySelector('#sat').value = document.querySelector('#btn-check-sat').checked;
        document.querySelector('#sun').value = document.querySelector('#btn-check-sun').checked;
        document.querySelector('#openTimeSet').value = document.querySelector('#openTime').value;
        document.querySelector('#openMinuteSet').value = document.querySelector('#openMinute').value;
        document.querySelector('#closeTimeSet').value = document.querySelector('#closeTime').value;
        document.querySelector('#closeMinuteSet').value = document.querySelector('#closeMinute').value;
        document.querySelector('#shopType').value = document.querySelector('#shopType').value.replace(/(\s*)/g, "");
        document.querySelector('#userCity').disabled = false;
        document.querySelector('#userStreet').disabled = false;
        document.querySelector('#signupForm').submit();
    }

    function returnImg(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
                document.querySelector('#preview').style.display = '';

                let imgName = document.querySelector('#file').value.split('\\')[document.querySelector('#file').value.split('\\').length - 1];
                document.querySelector('#imageTitle').value = imgName;

                document.querySelector('#imageUpdateCheck').value = false;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    function imgClick(){
        document.querySelector('#file').click();
    }

    function popup_on() {
        document.querySelector('#modal-bg').style.display = '';
        document.querySelector('#modal-wrap').style.display = '';
    }

    function popup_close() {
        document.querySelector('#modal-bg').style.display = 'none';
        document.querySelector('#modal-wrap').style.display = 'none';
    }
</script>

