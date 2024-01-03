<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>가게 정보 수정</h1>
            </div>
            <form action="/admin/change-admin-modify" method="post" id="signupForm" enctype="multipart/form-data">
                <input type="hidden" id="userZipcode" name="userZipcode" value="${shopData.userZipcode}">
                <input type="hidden" id="commentCheck" value="${commentCheck}">
                <input type="hidden" id="storedFileName" name="storedFileName" value="${images.storedFileName}">
                <input type="hidden" id="imageUpdateCheck" name="imageUpdateCheck" value="true">
                <input type="hidden" id="shopData" value="${shopData}">
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
                <input type="hidden" id="reservationOpenTimeSet" name="reservationOpenTime">
                <input type="hidden" id="reservationOpenMinuteSet" name="reservationOpenMinute">
                <input type="hidden" id="reservationCloseTimeSet" name="reservationCloseTime">
                <input type="hidden" id="reservationCloseMinuteSet" name="reservationCloseMinute">
                <input type="hidden" id="reservationTimeSet" name="reservationTime">
                <input type="hidden" id="reservationLimitNumSet" name="reservationLimitNum">
                <input type="hidden" id="reservationLimitTeamSet" name="reservationLimitTeam">
                <input type="hidden" id="reservationCheckSet" name="reservationCheck">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" id="shopNameArea">
                                <input type="text" class="form-control" id="shopName" name="shopName" placeholder=""
                                       value="${shopData.shopName}">
                                <label for="shopName">가게 이름 &nbsp <i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="form-floating mb-1" id="shopCommentArea">
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
                            <div id="reservationLimitNumArea">

                            </div>
                            <div id="reservationLimitTeamArea">

                            </div>
                            <span style="text-align: left; font-size: 12px; margin-top: 5px;">&nbsp;&nbsp;대표 사진</span>

                            <input type="file" name="file" id="file" onchange="returnImg(this);"
                                   style="margin-bottom: 10px; display: none;">
                            <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick()">
                                <i class="bi bi-card-image fs-7" style="color: white;">
                                    파일 추가
                                </i>
                            </button>
                            <input type="text" id="imageTitle" value="${images.originalFileName}" disabled
                                   style="text-align: center;">

                            <img src="../img/${images.storedFileName}" id="preview" class="img-thumbnail" alt="..."
                                 style="">

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
<div id="modal-wrap" class="modal-wrap" style="display: none; height: 600px;">
    <div class="container-md" style="height: 100%!important;">
        <div class="row d-flex justify-content-center align-items-center h-100" style="margin-right: 12px;">
            <div class="col-1"></div>
            <div class="col-10 text-center">
                <div class="row g-0">
                    <span style="font-size: 12px;">요일 설정</span>
                    <span style="font-size: 10px; color: red; margin-bottom: 5px;">(선택 시 색이 입력됩니다)</span>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-mon"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-mon" style="font-size: 12px;">월</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-tues"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-tues" style="font-size: 13px;">화</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-wed"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-wed" style="font-size: 13px;">수</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-thur"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-thur" style="font-size: 13px;">목</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-fri"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-fri" style="font-size: 13px;">금</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-sat"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-sat" style="font-size: 13px;">토</label><br>
                    </div>
                    <div class="col-sm">
                        <input type="checkbox" name="check_days" class="btn-check" id="btn-check-sun"
                               autocomplete="off">
                        <label class="btn btn-outline-gray" for="btn-check-sun" style="font-size: 13px;">일</label><br>
                    </div>
                    <br><br>
                    <hr>
                    <span style="font-size: 12px;">영업 시간 설정</span>
                    <span style="font-size: 10px; color: red; margin-bottom: 5px;">(10분 단위로 선택가능합니다)</span>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">오픈 시간</span>
                    </div>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">닫는 시간</span>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="openTime" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('openTime')">
                            <option value="00" selected>0시</option>
                            <option value="01">1시</option>
                            <option value="02">2시</option>
                            <option value="03">3시</option>
                            <option value="04">4시</option>
                            <option value="05">5시</option>
                            <option value="06">6시</option>
                            <option value="07">7시</option>
                            <option value="08">8시</option>
                            <option value="09">9시</option>
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
                        <select class="form-select me-2" id="openMinute" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('openMinute')">
                            <option value="00" selected>0분</option>
                            <option value="30">30분</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="closeTime" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('closeTime')">
                            <option value="00" selected>0시</option>
                            <option value="01">01시</option>
                            <option value="02">02시</option>
                            <option value="03">03시</option>
                            <option value="04">04시</option>
                            <option value="05">05시</option>
                            <option value="06">06시</option>
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
                        <select class="form-select me-2" id="closeMinute" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('closeMinute')">
                            <option value="00" selected>0분</option>
                            <option value="30">30분</option>
                        </select>
                    </div>
                    <br><br>
                    <hr>
                    <span style="font-size: 12px;">예약 가능 시간 설정</span>
                    <span style="font-size: 10px; color: red; margin-bottom: 5px;">(30분 단위로 선택가능합니다)</span>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">예약 시작 시간</span>
                    </div>
                    <div class="col-6" style="text-align: center;">
                        <span style="font-size: 12px;">마지막 예약 시간</span>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="reservationOpenTime" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('reservationOpenTime')">
                            <option value="00" selected>0시</option>
                            <option value="01">01시</option>
                            <option value="02">02시</option>
                            <option value="03">03시</option>
                            <option value="04">04시</option>
                            <option value="05">05시</option>
                            <option value="06">06시</option>
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
                        <select class="form-select me-2" id="reservationOpenMinute"
                                style="width: 92px; font-size: 14px;"
                                onchange="timeSet('reservationOpenMinute')">
                            <option value="00" selected>0분</option>
                            <option value="30">30분</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <select class="form-select me-2" id="reservationCloseTime" style="width: 92px; font-size: 14px;"
                                onchange="timeSet('reservationCloseTime')">
                            <option value="00" selected>0시</option>
                            <option value="01">01시</option>
                            <option value="02">02시</option>
                            <option value="03">03시</option>
                            <option value="04">04시</option>
                            <option value="05">05시</option>
                            <option value="06">06시</option>
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
                        <select class="form-select me-2" id="reservationCloseMinute"
                                style="width: 92px; font-size: 14px;"
                                onchange="timeSet('reservationCloseMinute')">
                            <option value="00" selected>0분</option>
                            <option value="30">30분</option>
                        </select>
                    </div>
                    <div class="col-6">
                        <span style="font-size: 12px;">예약 가능 시간 간격</span>
                    </div>
                    <div class="col-6">
                        <span style="font-size: 12px;">예약당 최대 인원 / 시간당 최대 팀</span>
                    </div>
                    <div class="col-6">
                        <select class="form-select me-2" id="reservationTime" style="width: 180px; font-size: 14px;">
                            <option value="30">30분</option>
                            <option value="60">1시간</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <input type="number" class="form-control" id="reservationLimitNum" name="shopName"
                               placeholder=""
                               style="text-align: right;" maxlength="2" min="0" value="" onchange="numberCheck(this)">
                    </div>
                    <div class="col-3">
                        <input type="number" class="form-control" id="reservationLimitTeam" name="shopName"
                               placeholder=""
                               style="text-align: right;" maxlength="2" min="0" value="" onchange="numberCheck(this)">
                    </div>
                    <div class="col-12" style="text-align: right; line-height:70%;">
                        <span style="font-size: 10px; color: red;">예약당 최대 인원은 한 건의 예약에 대한 최대인원 설정입니다<br>(예 : 4인 설정 시 해당 예약 당 입장 가능 인원은 최대 4인)</span>
                        <br rel="0.4rem">
                        <span style="font-size: 10px; color: red;">시간당 최대 팀은 해당 시간에 예약이 가능한 최대 팀 설정입니다<br>(예 : 3건 설정 시 타임 당 3팀만 예약가능)</span>
                        <br rel="0.4rem">
                        <span style="font-size: 10px; color: red;">예약당 최대 인원 0을 입력 시 제한 없음으로 판단합니다.</span>
                    </div>
                    <hr style="margin: 0.4rem;">
                    <div class="col-4"></div>
                    <div class="col-8" style="text-align: right;">
                        <div class="form-check" style="float: right;">
                            <input class="form-check-input" type="checkbox" id="reservationCheck">
                            <label class="form-check-label" for="reservationCheck" style="color: red; font-size: 10px;">
                                가게 예약 기능을 사용하시겠습니까?
                            </label>
                        </div>
                        <div class="form-check" style="float: right; line-height: 0%;">
                            <span class="form-check-label" style="color: red; font-size: 10px;">
                                (체크 선택 시 가게예약 기능이 활성화 됩니다)
                            </span>
                        </div>
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
        if (document.querySelector('#commentCheck').value) {
            document.querySelector('#file_btn').style.marginTop = '25px';
        } else {
            document.querySelector('#file_btn').style.marginTop = '5px';
        }

        if (${shopData.reservationCheck == true}) {
            document.querySelector('#reservationCheck').checked = true;
        }

        if (${shopData != null}) {

            if (${shopData.mon == 'true'}) {
                document.querySelector('#btn-check-mon').checked = true;
            }

            if (${shopData.tues == 'true'}) {
                document.querySelector('#btn-check-tues').checked = true;
            }

            if (${shopData.wed == 'true'}) {
                document.querySelector('#btn-check-wed').checked = true;
            }

            if (${shopData.thur == 'true'}) {
                document.querySelector('#btn-check-thur').checked = true;
            }

            if (${shopData.fri == 'true'}) {
                document.querySelector('#btn-check-fri').checked = true;
            }

            if (${shopData.sat == 'true'}) {
                document.querySelector('#btn-check-sat').checked = true;
            }

            if (${shopData.sun == 'true'}) {
                document.querySelector('#btn-check-sun').checked = true;
            }

            $('#openTime').val('${shopData.openTime}').prop("selected", true);
            $('#openMinute').val('${shopData.openMinute}').prop("selected", true);
            $('#closeTime').val('${shopData.closeTime}').prop("selected", true);
            $('#closeMinute').val('${shopData.closeMinute}').prop("selected", true);
            $('#reservationOpenTime').val('${shopData.reservationOpenTime}').prop("selected", true);
            $('#reservationOpenMinute').val('${shopData.reservationOpenMinute}').prop("selected", true);
            $('#reservationCloseTime').val('${shopData.reservationCloseTime}').prop("selected", true);
            $('#reservationCloseMinute').val('${shopData.reservationCloseMinute}').prop("selected", true);
            $('#reservationTime').val('${shopData.reservationTime}').prop("selected", true);
            document.querySelector('#reservationLimitNum').value = (Number)('${shopData.reservationLimitNum}');
            document.querySelector('#reservationLimitTeam').value = (Number)('${shopData.reservationLimitTeam}');
            if (${shopData.reservationCheck == true}) {
                document.querySelector('#reservationCheck').checked = true;
            }
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

        document.querySelector('#reservationOpenTimeSet').value = document.querySelector('#reservationOpenTime').value;
        document.querySelector('#reservationOpenMinuteSet').value = document.querySelector('#reservationOpenMinute').value;
        document.querySelector('#reservationCloseTimeSet').value = document.querySelector('#reservationCloseTime').value;
        document.querySelector('#reservationCloseMinuteSet').value = document.querySelector('#reservationCloseMinute').value;
        document.querySelector('#reservationTimeSet').value = document.querySelector('#reservationTime').value;

        document.querySelector('#reservationLimitNumSet').value = document.querySelector('#reservationLimitNum').value;
        document.querySelector('#reservationLimitTeamSet').value = document.querySelector('#reservationLimitTeam').value;
        document.querySelector('#reservationCheckSet').value = document.querySelector('#reservationCheck').value;

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

    function imgClick() {
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

    function numberCheck(target) {

        let check = /[0-9]/g;
        if (target.id == 'reservationLimitTeam') {
            if (target.value < 1) {
                alert('최소 1 ~ 최대 99까지 입력 가능합니다.');
                target.value = 1;
            }
            if (!check.test(target.value)) {
                alert('숫자만 입력 가능합니다.');
                target.value = '';
            }
        } else if (!(target == undefined)) {
            if (target.value > 99) {
                alert('최소 0 ~ 최대 99까지 입력 가능합니다.');
                target.value = 0;
            }
            if (target.value < 0) {
                alert('최소 0 ~ 최대 99까지 입력 가능합니다.');
                target.value = 0;
            }
            if (!check.test(target.value)) {
                alert('숫자만 입력 가능합니다.');
                target.value = '';
            }
        }

    }

    function timeSetHtml(time, type, area, dataType) {
        let html = '';
        let areaTime = Number(document.querySelector('#' + area).value);
        let endTime = 24;
        let endMinute = 60;
        if (Number(dataType) > 1) {
            if (area.indexOf('Minute') != -1) {
                let areaData = area.split("Minute")[0] + 'Time';
                if (Number(document.querySelector('#openTime').value) < Number(document.querySelector('#' + areaData).value)) {
                    time = 0;
                }
            }
            if (area == 'reservationOpenTime') {
                time = Number(document.querySelector('#openTime').value);
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            } else if (area == 'reservationCloseTime') {
                time = Number(document.querySelector('#reservationOpenTime').value);
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            }
        }


        if (type == 'minute') {
            if (Number(dataType) > 3) {
                if (area.indexOf('Minute') != -1) {
                    let areaData = area.split("Minute")[0] + 'Time';
                    if (area == 'reservationOpenMinute' || area == 'reservationCloseMinute') {
                        if (Number(document.querySelector('#closeTime').value) == Number(document.querySelector('#' + areaData).value)) {
                            if (Number(document.querySelector('#closeMinute').value) < 1) {
                                time = 0;
                                endMinute = 1;
                            }
                        }
                    }
                }
            }
        }
        if (dataType == '3') {
            if (area == 'reservationOpenTime' || area == 'reservationCloseTime') {
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            }
        }
        if (dataType == '5') {
            if (area == 'reservationOpenTime') {
                time = Number(document.querySelector('#openTime').value);
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            } else if (area == 'reservationCloseTime') {
                time = Number(document.querySelector('#reservationOpenTime').value);
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            }
        }
        if (dataType == '7') {
            if (area == 'reservationOpenTime') {
                time = Number(document.querySelector('#openTime').value);
                endTime = Number(document.querySelector('#reservationCloseTime').value) + 1;
            } else if (area == 'reservationCloseTime') {
                time = Number(document.querySelector('#reservationOpenTime').value);
                endTime = Number(document.querySelector('#closeTime').value) + 1;
            }
        }

        if (type == 'time') {
            for (let i = time; i < endTime; i++) {
                if (i == areaTime) {
                    html += '<option value="' + i + '" selected>' + i + '시</option>';
                } else {
                    html += '<option value="' + i + '">' + i + '시</option>';
                }
            }
        } else if (type == 'minute') {
            for (let i = time; i < endMinute; i = i + 30) {
                if (i == areaTime) {
                    html += '<option value="' + i + '" selected>' + i + '분</option>';
                } else {
                    html += '<option value="' + i + '">' + i + '분</option>';
                }
            }
        }
        return html;
    }

    function timeSet(input) {

        if (input == 'openTime') {
            basicTimes(Number(document.querySelector('#openTime').value), '1');
            basicMinutes(Number(document.querySelector('#openMinute').value), '1');
        } else if (input == 'openMinute') {
            basicTimes(Number(document.querySelector('#openTime').value), '2');
            basicMinutes(Number(document.querySelector('#openMinute').value), '2');
        } else if (input == 'closeTime') {
            basicTimes(Number(document.querySelector('#openTime').value), '3');
            basicMinutes(Number(document.querySelector('#openMinute').value), '3');
        } else if (input == 'closeMinute') {
            basicTimes(Number(document.querySelector('#openTime').value), '4');
            basicMinutes(Number(document.querySelector('#openMinute').value), '4');
        } else if (input == 'reservationOpenTime') {
            basicTimes(Number(document.querySelector('#openTime').value), '5');
            basicMinutes(Number(document.querySelector('#openMinute').value), '5');
        } else if (input == 'reservationOpenMinute') {
            basicTimes(Number(document.querySelector('#openTime').value), '6');
            basicMinutes(Number(document.querySelector('#openMinute').value), '6');
        } else if (input == 'reservationCloseTime') {
            basicTimes(Number(document.querySelector('#openTime').value), '7');
            basicMinutes(Number(document.querySelector('#openMinute').value), '7');
        } else if (input == 'reservationCloseMinute') {
            basicTimes(Number(document.querySelector('#openTime').value), '8');
            basicMinutes(Number(document.querySelector('#openMinute').value), '8');
        }
    }

    function basicTimes(openTime, value) {
        document.querySelector('#closeTime').innerHTML = timeSetHtml(openTime, 'time', 'closeTime', value);
        document.querySelector('#reservationOpenTime').innerHTML = timeSetHtml(openTime, 'time', 'reservationOpenTime', value);
        document.querySelector('#reservationCloseTime').innerHTML = timeSetHtml(openTime, 'time', 'reservationCloseTime', value);
    }

    function basicMinutes(openMinute, value) {
        document.querySelector('#closeMinute').innerHTML = timeSetHtml(openMinute, 'minute', 'closeMinute', value);
        document.querySelector('#reservationOpenMinute').innerHTML = timeSetHtml(openMinute, 'minute', 'reservationOpenMinute', value);
        document.querySelector('#reservationCloseMinute').innerHTML = timeSetHtml(openMinute, 'minute', 'reservationCloseMinute', value);
    }
</script>

