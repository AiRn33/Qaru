<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>메뉴 등록</h1>
            </div>
            <div class="card" style="padding:8px">
                <div class="row g-0">
                    <div class="col-4">
                        <span>가게 이름</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shopName}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 설명</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shopComment}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 종류</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shopType}</span>
                    </div>
                </div>
            </div>
            <form id="menuForm">
                <input type="hidden" id="menu_count" value="${menuListCount}">
                <input type="hidden" id="img_count" value="">
                <c:forEach items="${menuList}" varStatus="status" var="item">
                <div id="menuArea_${status.index + 1}">
                    <input type="file" name="${item.imageGroupId}" id="file_${status.index + 1}" onchange="returnImg(this);" style="display: none;">
                    <div class="col">
                        <div class="card" style="padding:8px; margin-top: 10px; height: auto;">
                            <span>메뉴</span>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-4">
                            <div class="card" style="padding:8px; height: 271px;">
                                <span>이미지</span>
                                <hr style="margin: 0.4rem;">
                                <div id="img_area_${status.index + 1}">
                                    <img src="/img/${item.storedFileName}" id="preview_${status.index + 1}_0" class="img-thumbnail" alt="..." style="width: 150px; height: 150px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="card" style="padding:8px">
                                <div class="form-floating mb-1" id="menuName_${status.index + 1}Area">
                                    <input type="text" class="form-control" id="menuName_${status.index + 1}" name="menuName_${status.index + 1}"
                                           placeholder=""
                                           value="${item.menuName}">
                                    <label for="menuName_${status.index + 1}">메뉴 이름 <i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" id="menuComment_${status.index + 1}Area">
                                    <input type="text" class="form-control" id="menuComment_${status.index + 1}" name="menuComment_${status.index + 1}"
                                           placeholder=""
                                           value="${item.menuComment}">
                                    <label for="menuComment_${status.index + 1}">메뉴 설명 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" id="menuPrice_${status.index + 1}Area">
                                    <input type="number" class="form-control" id="menuPrice_${status.index + 1}" name="menuPrice_${status.index + 1}"
                                           placeholder=""
                                           value="${item.menuPrice}">
                                    <label for="menuPrice_${status.index + 1}">메뉴 가격 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>

                                <div id="img_${status.index + 1}Area"></div>

                                <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick(${status.index + 1})">
                                    <i class="bi bi-card-image fs-7" style="color: white;">
                                        파일 추가
                                    </i>
                                </button>
                                <div style="text-align: right; margin-right: 10px; margin-bottom: 5px;"><label
                                        style="font-size: 12px; color: red;">파일은 하나만 등록 가능합니다.</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-8"></div>
                        <div class="col-4" style="text-align: right; margin-bottom: 10px;  margin-top: 5px;">
                            <button class="btn btn-bluemint" type="button" onclick="menuRemove(${status.index + 1});">
                                <span style="color: white;">메뉴 삭제</span>
                            </button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </form>
            <div class="row g-0">
                <div class="col-8"></div>
                <div class="col-4" style="text-align: right; margin-bottom: 10px;  margin-top: 5px;">
                    <button class="btn btn-pink" onclick="menuAdd(document.querySelector('#menu_count').value);">
                        <span style="color: white;">메뉴 추가</span>
                    </button>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-8"></div>
                <div class="col-4" style="text-align: right; margin-bottom: 10px;  margin-top: 5px;">
                    <div class="form-check" style="float: right;">
                        <input class="form-check-input" type="checkbox" id="menuViewCheck" <c:if test="${shopData.menuView}">checked</c:if>>
                        <label class="form-check-label" for="menuViewCheck" style="color: red; font-size: 14px;">
                            가게를 리스트에 출력하겠습니까 ?
                        </label>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="Submit()">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;여행 등록
                            </i>
                        </button>
                    </div>
                </div>
            </div>
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
<script>
    window.onload = function () {
        //실행될 코드
        errors();
        errorsImg();
    }

    function Valid() {

        document.querySelectorAll(".input-group").forEach(e => e.remove());

        let validCheck = false;
        let validMsg = '[';
        for (let i = 1; i <= document.querySelector('#menu_count').value; i++) {
            if(document.querySelector('#menuArea_' + i) != null){
                if (document.querySelector('#menuName_' + i).value.trim() == "") {
                    validMsg += '메뉴 이름을 입력해주세요., menuName_' + i + ',';
                    validCheck = true;
                }
                if (document.querySelector('#menuComment_' + i).value.trim() == "") {
                    validMsg += '메뉴 설명을 입력해주세요., menuComment_' + i + ',';
                    validCheck = true;
                }
                if (document.querySelector('#menuPrice_' + i).value.trim() == "") {
                    validMsg += '메뉴 가격을 입력해주세요., menuPrice_' + i + ',';
                    validCheck = true;
                }
                if (document.querySelector('#img_area_' + i).childElementCount < 1) {
                    validMsg += '메뉴 사진을 넣어주세요., img_' + i + ',';
                    validCheck = true;
                }
            }
        }
        validMsg += ']';
        document.querySelector('#errorScript').value = validMsg;

        return validCheck;
    }

    function Submit() {

        if (Valid()) {
            errors();
            return false;
        }

        let menuData = [];
        let fileData = new FormData();

        for (let i = 1; i <= document.querySelector('#menu_count').value; i++) {
            if(document.querySelector('#menuArea_' + i) != null) {
                if (document.querySelector('#file_' + i).files[0] == undefined) {
                    const file = new File(["dummy"], " /" + document.querySelector('#file_' + i).name, {
                        type: "image/jpeg",
                    });
                    fileData.append('file', file);
                } else {
                    const oldFile = document.querySelector('#file_' + i).files[0];
                    const newFile = new File([oldFile], oldFile.name + '/' + document.querySelector('#file_' + i).name, {type: oldFile.type});
                    fileData.append('file', newFile);
                }
            }
        }

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/menuImage/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: fileData,
            contentType: false,               // * 중요 *
            processData: false,               // * 중요 *
            enctype: 'multipart/form-data',  // * 중요 *
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.

                let resCount = 0;
                for (let i = 1; i <= document.querySelector('#menu_count').value; i++) {
                    if(document.querySelector('#menuArea_' + i) != null) {
                        menuData.push(
                            {
                                menuName: document.querySelector('#menuName_' + i).value,
                                menuComment: document.querySelector('#menuComment_' + i).value,
                                menuPrice: document.querySelector('#menuPrice_' + i).value,
                                imageGroupId: (String(res[resCount])),
                                menuViewCheck: document.querySelector('#menuViewCheck').checked
                            });
                        resCount++;
                    }
                }
                menuDataSubmit(menuData);
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
    }

    function menuDataSubmit(input) {
        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/menuData/${shopData.shopId}",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: new Blob([JSON.stringify(input)], {type: "application/json"}),
            contentType: false,               // * 중요 *
            processData: false,               // * 중요 *
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                if (res > 0) {
                    location.href = '/shop/modifyMenuAlert';
                }
            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
    }

    function returnImg(input) {
        let html = '';
        let imageCount = document.querySelector('#img_count').value;
        document.querySelector('#img_area_' + imageCount).innerHTML = html;

        for (let i = 0; i < input.files.length; i++) {
            html += '<img src="" id="preview_' + imageCount + '_' + i + '" class="img-thumbnail" alt="..."style="width: 150px; height: 150px;">';
        }
        document.querySelector('#img_area_' + imageCount).innerHTML += html;

        for (let i = 0; i < input.files.length; i++) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.querySelector('#preview_' + imageCount + '_' + i).src = e.target.result;
            };
            reader.readAsDataURL(input.files[i]);
        }


    }

    function imgClick(imgCount) {
        document.querySelector('#file_' + imgCount).click();
        document.querySelector('#img_count').value = imgCount;
    }

    function menuRemove(menuCount) {
        document.querySelector('#menuArea_' + menuCount).remove();
    }

    function menuAdd(menuCount) {

        document.querySelector('#menu_count').value = parseInt(menuCount) + 1;

        ++menuCount;
        let html = '';

        html += '<div id="menuArea_' + menuCount + '">';
        html += '<input type="file" name="0" id="file_' + menuCount + '" onchange="returnImg(this);" style="display: none;">';
        html += '<div class="col">';
        html += '    <div class="card" style="padding:8px; margin-top: 10px; height: auto;">';
        html += '        <span>메뉴</span>';
        html += '    </div>';
        html += '</div>';
        html += '<div class="row g-0">';
        html += '    <div class="col-4">';
        html += '        <div class="card" style="padding:8px; height: 271px;">';
        html += '            <span>이미지</span>';
        html += '        <hr style="margin: 0.4rem;">';
        html += '            <div id="img_area_' + menuCount + '">';

        html += '            </div>';
        html += '    </div>';
        html += '</div>';
        html += '<div class="col-8">';
        html += '      <div class="card" style="padding:8px">';
        html += ' <div class="form-floating mb-1" id="menuName_' + menuCount + 'Area">';
        html += '     <input type="text" class="form-control" id="menuName_' + menuCount + '" name="menuName_' + menuCount + '" placeholder="" value="">';
        html += '                <label for="menuName_' + menuCount + '">메뉴 이름 <i class="bi bi-mouse"></i></label>';
        html += '        </div>';
        html += '        <div class="form-floating mb-1" id="menuComment_' + menuCount + 'Area">';
        html += '            <input type="text" class="form-control" id="menuComment_' + menuCount + '" name="menuComment_' + menuCount + '" placeholder="" value="">';
        html += '                <label for="menuComment_' + menuCount + '">메뉴 설명 &nbsp;<i class="bi bi-mouse"></i></label>';
        html += '        </div>';
        html += '        <div class="form-floating mb-1" id="menuPrice_' + menuCount + 'Area">';
        html += '            <input type="number" class="form-control" id="menuPrice_' + menuCount + '" name="menuPrice_' + menuCount + '" placeholder="" value="">';
        html += '                <label for="menuPrice_' + menuCount + '">메뉴 가격 &nbsp;<i class="bi bi-mouse"></i></label>';
        html += '        </div>';
        html += '        <div id="img_' + menuCount + 'Area"></div>';
        html += '                            <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick(' + menuCount + ')">';
        html += '            <i class="bi bi-card-image fs-7" style="color: white;">파일 추가</i>';
        html += '        </button>';
        html += '        <div style="text-align: right; margin-right: 10px; margin-bottom: 5px;"><label style="font-size: 12px; color: red;">파일은 하나만 등록 가능합니다.</label></div>';
        html += '        </div>';
        html += '    </div>';
        html += ' </div>';
        html += '<div class="row g-0">';
        html += '<div class="col-8"></div>';
        html += '    <div class="col-4" style="text-align: right; margin-bottom: 10px;  margin-top: 5px;">';
        html += '        <button class="btn btn-bluemint" type="button" onClick="menuRemove(' + menuCount + ' )">';
        html += '            <span style="color: white;">메뉴 삭제</span>';
        html += '        </button>'
        html += '    </div>';
        html += '</div>';
        html += '</div>';
        document.querySelector('#menuForm').insertAdjacentHTML('beforeend', html);
        return false;
    }


</script>

