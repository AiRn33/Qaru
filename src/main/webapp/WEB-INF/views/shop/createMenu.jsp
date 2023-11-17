<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                        <span>${shopData.shop_name}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 설명</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shop_comment}</span>
                    </div>
                    <div class="col-4">
                        <span>가게 종류</span>
                        <hr style="margin: 0.4rem;">
                        <span>${shopData.shop_type}</span>
                    </div>
                </div>
            </div>
            <form id="menuForm">
                <div id="menuArea">
                    <input type="hidden" id="menu_count" value="1">
                    <input type="hidden" id="img_count" value="">
                    <input type="file" name="file" id="file_1" onchange="returnImg(this);" style="display: none;">
                    <div class="col">
                        <div class="card" style="padding:8px; margin-top: 10px; height: auto;">
                            <span>1번 메뉴</span>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-4">
                            <div class="card" style="padding:8px; height: 271px;">
                                <span>이미지</span>
                                <hr style="margin: 0.4rem;">
                                <div id="img_area_1">
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="card" style="padding:8px">
                                <div class="form-floating mb-1" id="menuName_1Area">
                                    <input type="text" class="form-control" id="menuName_1" name="menuName_1"
                                           placeholder=""
                                           value="">
                                    <label for="menuName_1">메뉴 이름 <i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" id="menuComment_1Area">
                                    <input type="text" class="form-control" id="menuComment_1" name="menuComment_1"
                                           placeholder=""
                                           value="">
                                    <label for="menuComment_1">메뉴 설명 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>
                                <div class="form-floating mb-1" id="menuPrice_1Area">
                                    <input type="text" class="form-control" id="menuPrice_1" name="menuPrice_1"
                                           placeholder=""
                                           value="">
                                    <label for="menuPrice_1">메뉴 가격 &nbsp;<i class="bi bi-mouse"></i></label>
                                </div>

                                <div id="imgArea"></div>

                                <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick(1)">
                                    <i class="bi bi-card-image fs-7" style="color: white;">
                                        파일 추가
                                    </i>
                                </button>
                                <div style="text-align: right; margin-right: 10px; margin-bottom: 5px;"><label style="font-size: 12px; color: red;">파일은 하나만 등록 가능합니다.</label></div>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    window.onload = function () {
        //실행될 코드
        errors();
        errorsImg();
    }


    function Submit() {

        let menuData = [];
        let fileData = new FormData();

        for(let i = 1; i <= document.querySelector('#menu_count').value; i++){
             menuData.push(
                {
                menuName : document.querySelector('#menuName_' + i).value,
                menuComment : document.querySelector('#menuComment_' + i).value,
                menuPrice : document.querySelector('#menuPrice_' + i).value
                });

            fileData.append('file', document.querySelector('#file_' + i).files[0]);
        }

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/menuImage",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: fileData,
            contentType: false,               // * 중요 *
            processData: false,               // * 중요 *
            enctype : 'multipart/form-data',  // * 중요 *
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                if(res){
                    menuDataSubmit(menuData);
                }

            },
            error: function () { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.

            }
        });
    }

    function menuDataSubmit(input){

        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/menuData",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: new Blob([JSON.stringify(input)], {type: "application/json"}),
            contentType: false,               // * 중요 *
            processData: false,               // * 중요 *
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                if(res){

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

    function menuAdd(menuCount) {
        document.querySelector('#menu_count').value = parseInt(menuCount) + 1;

        ++menuCount;
        let html = '';

        html += '<input type="file" name="file" id="file_' + menuCount + '" onchange="returnImg(this);" style="display: none;">';
        html += '<div class="col">';
        html += '    <div class="card" style="padding:8px; margin-top: 10px; height: auto;">';
        html += '        <span>' + menuCount + '번 메뉴</span>';
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
        html += '            <input type="text" class="form-control" id="menuPrice_' + menuCount + '" name="menuPrice_' + menuCount + '" placeholder="" value="">';
        html += '                <label for="menuPrice_' + menuCount + '">메뉴 가격 &nbsp;<i class="bi bi-mouse"></i></label>';
        html += '        </div>';
        html += '        <div id="imgArea"></div>';
        html += '                            <button type="button" id="file_btn" class="btn btn-mint" onclick="imgClick(' + menuCount + ')">';
        html += '            <i class="bi bi-card-image fs-7" style="color: white;">파일 추가</i>';
        html += '        </button>';
        html += '        <div style="text-align: right; margin-right: 10px; margin-bottom: 5px;"><label style="font-size: 12px; color: red;">파일은 하나만 등록 가능합니다.</label></div>';
        html += '        </div>';
        html += '    </div>';
        html += ' </div>';

        document.querySelector('#menuForm').insertAdjacentHTML('beforeend', html);
        return false;
    }



</script>

