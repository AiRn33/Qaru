<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>${tour.tourTitle}</h1>
            </div>
            <form action="/tour" method="post" id="tourForm" enctype="multipart/form-data">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" style="height: 200px" id="tourContentArea">

                                <textarea class="form-control" id="tourContent" name="tourContent" placeholder=""
                                          style="height: 200px; resize: none;" disabled>${tour.tourContent}</textarea>
                            </div>
                            <div id="img_area">
                                <c:forEach items="${images}" var="item">
                                    <img src="/img/${item.storedFileName}" class="img-thumbnail" alt="..."
                                         style="width: 150px; height: 150px;" onclick="thumbnailImg(this)">
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <span style="text-align: left; font-size: 15px;">
                            <input type="hidden" id="like_check" value="${like}">
                            <c:if test="${like < 1}">
                                <button type="button" class="btn btn-outline-pink-like" id="like_on_btn" style="color: red; height: 30px;
                                    font-size: 12px; margin-bottom: 7px;" onclick="like_add_delete(0)">
                                    <i class="bi bi-chat-heart" style="color: red; font-size: 13px; "></i>
                                좋아요
                                </button>
                            </c:if>
                            <c:if test="${like > 0}">
                                <button type="button" class="btn btn-pink" id="like_on_btn" style="color: red; height: 30px;
                                    font-size: 12px; margin-bottom: 7px;" onclick="like_add_delete(0)">
                                    <i class="bi bi-chat-heart" style="color: red; font-size: 13px; "></i>
                                <span>좋아요</span>
                                </button>
                            </c:if>
                            <button type="button" class="btn btn-outline-bluemint-map" style="color: #74b9ff; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="kakao_map()">
                                <i class="bi bi-map-fill"style="color: #74b9ff; font-size: 13px;"></i>
                                <span>지도 보기</span>
                            </button>
                        </span>
                    </div>
                    <div class="input-group has-validation" id="map_address" style="display: none;">
                        <div class="form-floating is-invalid"></div>
                        <div class="invalid-feedback" style="text-align: right; font-size: 11px; color: #ff6b81">
                            여행지 주소 : ${tour.city} : ${tour.street}
                        </div>
                    </div>
                    <div class="card" style="padding:8px; width:736px;height:400px; display: none;" id="map">

                    </div>
                    <div class="card" style="padding:8px">
                        <label style="font-size: 12px; text-align: left;">
                            <span style="margin-top: 10px;" id="comment_count">
                                &nbsp;&nbsp;댓글 ( ${tour.commentCount} )
                            </span>

                            <br><br>
                            <div>
                                <div class="form-floating mb-1" id="comment_write_div">
                                    <input type="text" class="form-control" id="comment_write" name="comment"
                                           value="" placeholder="">
                                    <label for="comment_write" style="font-size: 13px;"><i
                                            class="bi bi-person-fill"></i>&nbsp;댓글 쓰기</label>
                                </div>
                            </div>
                            <button type="button" class="btn btn-mint"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;"
                                    onclick="comment_register()">댓글 등록
                            </button>
                            <button type="button" class="btn btn-bluemint" id="comment_open"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;"
                                    onclick="comment_view()">댓글 보기
                            </button>
                            <button type="button" class="btn btn-bluemint" id="comment_close"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px; display: none;"
                                    onclick="comment_close()">댓글 닫기
                            </button>
                        </label>
                    </div>
                    <div class="card" style="padding:8px; display: none;" id="comment_area">

                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName == tour.userNickname}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-primary"
                                    onclick="location.href='/tour/${tour.tourId}/update'">
                                <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                    &nbsp;수정하기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-mint"
                                    onclick="confirm('게시글을 삭제하시겠습니까?', location.href='/tour/${tour.tourId}/delete')">
                                <i class="bi bi-arrow-bar-right fs-5" style="color: white">
                                    &nbsp;삭제하기
                                </i>
                            </button>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink"
                                onclick="location.href='/tour/tourList?page=0&size=9'">
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffd8231a733ced626bd8084d26ebae3c&libraries=services"></script>

<script>

    function kakao_map(){

        if(document.querySelector('#map').style.display == 'none'){
            document.querySelector('#map').style.display = '';
            document.querySelector('#map_address').style.display = '';
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch('${tour.city}', function(result, status) {

                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">여행지</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        }else{
            document.querySelector('#map').style.display = 'none'
            document.querySelector('#map_address').style.display = 'none'
        }
    }

    let userNickname = '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName}';

    function thumbnailImg(input) {

    }

    function comment_view() {
        var commentData = {
            tourId: ${tour.tourId}
        }
        $.ajax({
            type: "get",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/comment",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
        document.querySelector('#comment_area').style.display = '';
        document.querySelector('#comment_open').style.display = 'none';
        document.querySelector('#comment_close').style.display = '';
    }

    function comment_close() {
        document.querySelector('#comment_area').innerHTML = '';
        document.querySelector('#comment_area').style.display = 'none';
        document.querySelector('#comment_open').style.display = '';
        document.querySelector('#comment_close').style.display = 'none';
    }

    function comment_register() {

        // json 형식으로 데이터 set
        var commentData = {
            comment: document.querySelector('#comment_write').value.trim()
            , tourId: ${tour.tourId}
        }

        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/comment",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
        document.querySelector('#comment_write').value = '';
    }

    function recomment_register(commentId) {

        // json 형식으로 데이터 set
        var commentData = {
            comment: document.querySelector('#recomment_write_' + commentId).value.trim()
            , tourId: ${tour.tourId}
            , commentId: commentId
        }

        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/recomment",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) {// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
        document.querySelector('#recomment_write_' + commentId).value = '';
    }

    function recommentForm(commentId) {

        let html = '';

        html += '<div>';
        html += '<div class="form-floating mb-1" id="recomment_write_div">';
        html += '<input type="text" class="form-control" id="recomment_write_' + commentId + '" name="comment" value="" placeholder="">';
        html += '<label for="recomment_write" style="font-size: 13px;"><i class="bi bi-person-fill"></i>&nbsp 대댓글 쓰기</label>';
        html += '</div>';
        html += '<button type="button" class="btn btn-outline-bluemint" style="float: left; color: #0984e3; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="recomment_register(' + commentId + ')">대댓글 등록 </button>';
        html += '</div>';

        document.querySelector('#recomment_' + commentId).innerHTML = html;
    }

    function createCommentForm(res) {

        let html = '';

        if(res.length < 2){
            html += '<span style="text-align: left; font-size: 12px;"> &nbsp; 댓글이 없습니다</span>';
        }
        for (let i = 0; i < res.length - 1; i++) {
            let width = 220;

            if (res[i].comment.length > 15) {
                width = 220 + (7 * (res[i].comment.length - 14));
            }
            if (!res[i].recommentCheck) {
                html += '<div>';
                html += '<div>';
                html += '   <div class="form-floating mb-1" id="comment_div" style="float: left;">';
                html += '   <input type="text" class="form-control"  id="comment_' + res[i].commentId + '" name="comment" ' +
                    '               value="' + res[i].comment + ' " placeholder="" style="width: ' + width + 'px; background-color: #55efc4; color: white;" disabled>';
                html += '   <label for="comment" style="font-size: 13px;"><i class="bi bi-person-fill"></i> &nbsp;' + res[i].userNickname + '</label>';
                html += '   </div>';
                html += '</div>';
                html += '<div style="float: left;">';
                html += '   <button class="btn btn-outline-light_green" onClick="recommentForm(' + res[i].commentId + ')"><i class="bi bi-chat-dots"></i></button>';
                html += '</div>';
                html += '<input type="hidden" id="like_check_' + res[i].commentId + '" value="' + res[i].likeCount + '">';
                html += '<div style="float: left;">';
                if(res[i].likeCount > 0){
                    html += '   <button id="comment_like_btn_' + res[i].commentId + '" class="btn btn-pink" ' +
                        'onClick="like_add_delete(' + res[i].commentId + ')"><i class="bi bi-chat-heart" style="color: red;"></i> </button>';
                }else{
                    html += '   <button id="comment_like_btn_' + res[i].commentId + '" class="btn btn-outline-pink" ' +
                        'onClick="like_add_delete(' + res[i].commentId + ')"><i class="bi bi-chat-heart" style="color: red;"></i> </button>';
                }
                html += '</div>';
                if (userNickname == res[i].userNickname) {
                    html += '<div style="float: left;" id="comment_updateBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentUpdate(' + res[i].commentId + ')"><i class="bi bi-pencil-square"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left;" id="comment_deleteBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentDelete(' + res[i].commentId + ')"><i class="bi bi-x-circle"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left; display: none;" id="comment_successBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentSuccess(' + res[i].commentId + ')"><i class="bi bi-check-all"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left; display: none;" id="comment_cancelBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentCancel(' + res[i].commentId + ', false)"><i class="bi bi-box-arrow-right"></i></button>';
                    html += '</div>';
                }
                html += '</div>';
                html += '<div id="recomment_' + res[i].commentId + '">';
                html += '</div>';
            } else {
                html += '<div>';
                html += '<div>';
                html += '<div class="form-floating mb-1" id="recomment_div" style="margin-left: 30px; float: left;">';
                html += '<input type="text" class="form-control" id="comment_' + res[i].commentId + '" name="recomment" ' +
                    'value="' + res[i].comment + '" placeholder="" style="width: ' + width + 'px; background-color: skyblue; color: white;" disabled>';
                html += '<label for="recomment" style="font-size: 13px;"><i class="bi bi-people-fill"></i> &nbsp;' + res[i].userNickname + '</label>';
                html += '</div>';
                html += '</div>';
                html += '<input type="hidden" id="like_check_' + res[i].commentId + '" value="' + res[i].likeCount + '">';
                html += '<div style="float: left;">';
                if(res[i].likeCount > 0){
                    html += '   <button id="comment_like_btn_' + res[i].commentId + '" class="btn btn-pink" ' +
                        'onClick="like_add_delete(' + res[i].commentId + ')"><i class="bi bi-chat-heart" style="color: red;"></i> </button>';
                }else{
                    html += '   <button id="comment_like_btn_' + res[i].commentId + '" class="btn btn-outline-pink" ' +
                        'onClick="like_add_delete(' + res[i].commentId + ')"><i class="bi bi-chat-heart" style="color: red;"></i> </button>';
                }
                html += '</div>';
                if (userNickname == res[i].userNickname) {
                    html += '<div style="float: left;" id="comment_updateBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentUpdate(' + res[i].commentId + ')"><i class="bi bi-pencil-square"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left;" id="comment_deleteBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentDelete(' + res[i].commentId + ')"><i class="bi bi-x-circle"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left; display: none;" id="comment_successBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentSuccess(' + res[i].commentId + ')"><i class="bi bi-check-all"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left; display: none;" id="comment_cancelBtn_' + res[i].commentId + '">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentCancel(' + res[i].commentId + ', true)"><i class="bi bi-box-arrow-right"></i></button>';
                    html += '</div>';
                }
                html += '</div>';
            }
        }

        document.querySelector('#comment_area').innerHTML = html;
        document.querySelector('#comment_count').innerHTML = '댓글 ( ' + res[res.length - 1].commentCount + ')';
        document.querySelector('#comment_area').style.display = '';
    }

    function commentUpdate(commentId) {

        document.querySelector('#comment_' + commentId).disabled = false;
        document.querySelector('#comment_' + commentId).focus();
        document.querySelector('#comment_' + commentId).style.backgroundColor = '#ff7675';
        document.querySelector('#comment_updateBtn_' + commentId).style.display = 'none';
        document.querySelector('#comment_deleteBtn_' + commentId).style.display = 'none';
        document.querySelector('#comment_successBtn_' + commentId).style.display = '';
        document.querySelector('#comment_cancelBtn_' + commentId).style.display = '';
    }

    function commentDelete(commentId) {

        if (!confirm("댓글을 삭제하시겠습니까 ?")) {
            return false;
        }
        // json 형식으로 데이터 set
        var commentData = {
            commentId: commentId
            , tourId: ${tour.tourId}
        }

        $.ajax({
            type: "delete",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/comment/" + commentId,      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) {// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }

    function commentSuccess(commentId) {

        // json 형식으로 데이터 set
        var commentData = {
            comment: document.querySelector('#comment_' + commentId).value.trim()
            , tourId: ${tour.tourId}
        }

        $.ajax({
            type: "put",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/comment/" + commentId,      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) {// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }

    function commentCancel(commentId, recommentCheck) {
        document.querySelector('#comment_' + commentId).disabled = true;
        if (recommentCheck) {
            document.querySelector('#comment_' + commentId).style.backgroundColor = 'skyblue';
        } else {
            document.querySelector('#comment_' + commentId).style.backgroundColor = '#55efc4';
        }
        document.querySelector('#comment_updateBtn_' + commentId).style.display = '';
        document.querySelector('#comment_deleteBtn_' + commentId).style.display = '';
        document.querySelector('#comment_successBtn_' + commentId).style.display = 'none';
        document.querySelector('#comment_cancelBtn_' + commentId).style.display = 'none';
    }

    function like_add_delete(tour_comment_check){

        let like_check = '';
        let tourCommentCheck = '';
        let id = '';

        // tour
        if(tour_comment_check < 1){
            like_check = document.querySelector('#like_check').value;
            tourCommentCheck = 'tour';
            id = ${tour.tourId};
        }else{
            // comment
            like_check = document.querySelector('#like_check_' + tour_comment_check).value;
            tourCommentCheck = 'comment';
            id = tour_comment_check;
        }

        var likeData = {
            likeCheck : like_check,
            tourCommentCheck : tourCommentCheck,
            tourId : ${tour.tourId}
        }
        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/like/" + id,      // 컨트롤러에서 대기중인 URL 주소이다.
            data: likeData,
            success: function (res) {// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.

                console.log(res);
                if(tour_comment_check < 1){
                    // tour
                    document.querySelector('#like_check').value = res[res.length - 1].likeCount;

                    if(res[0].tourCount > 0){
                        document.querySelector('#like_on_btn').classList.add("btn-pink");
                        document.querySelector('#like_on_btn').classList.remove("btn-outline-pink-like");
                    }else{
                        document.querySelector('#like_on_btn').classList.remove("btn-pink");
                        document.querySelector('#like_on_btn').classList.add("btn-outline-pink-like");
                    }

                }else{
                    // comment
                    createCommentForm(res);
                    if(document.querySelector('#like_check_' + tour_comment_check).value > 0){
                        document.querySelector('#comment_like_btn_' + tour_comment_check).classList.remove("btn-outline-pink");
                        document.querySelector('#comment_like_btn_' + tour_comment_check).classList.add("btn-pink");
                    }else{
                        document.querySelector('#comment_like_btn_' + tour_comment_check).classList.add("btn-outline-pink");
                        document.querySelector('#comment_like_btn_' + tour_comment_check).classList.remove("btn-pink");
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }

</script>