<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h1>${tour.tour_title}</h1>
            </div>
            <form action="/tour" method="post" id="tourForm" enctype="multipart/form-data">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <div class="form-floating mb-1" style="height: 200px" id="tourContentArea">

                                <textarea class="form-control" id="tourContent" name="tourContent" placeholder=""
                                          style="height: 200px; resize: none;" disabled>${tour.tour_content}</textarea>
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
                        <label style="font-size: 12px; text-align: left;">
                            &nbsp;&nbsp;댓글 ( 3 )
                            <br><br>
                            <div>
                                <div class="form-floating mb-1" id="comment_write_div">
                                    <input type="text" class="form-control" id="comment_write" name="comment"
                                           value="" placeholder="">
                                    <label for="comment_write" style="font-size: 13px;"><i class="bi bi-person-fill"></i>&nbsp;댓글 쓰기</label>
                                </div>
                            </div>
                            <button type="button" class="btn btn-mint"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;"
                                    onclick="comment_register()">댓글 등록
                            </button>
                            <button type="button" class="btn btn-bluemint" id="comment_open"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="comment_view()">댓글 보기
                            </button>
                            <button type="button" class="btn btn-bluemint" id="comment_close"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px; display: none;" onclick="comment_close()">댓글 닫기
                            </button>
                        </label>
                    </div>
                    <div class="card" style="padding:8px" id="comment_area">

                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName == tour.userNickname}">
                <div class="row g-0">
                    <div class="col">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-primary"
                                    onclick="location.href='/tour/${tour.tour_id}/update'">
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
                                    onclick="confirm('게시글을 삭제하시겠습니까?', location.href='/tour/${tour.tour_id}/delete')">
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

<script>

    let userNickname = '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userNickName}';

    function thumbnailImg(input) {

    }

    function comment_view(){
        var commentData = {
            tourId: ${tour.tour_id}
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
        document.querySelector('#comment_open').style.display = 'none';
        document.querySelector('#comment_close').style.display = '';
    }

    function comment_close(){
        document.querySelector('#comment_area').innerHTML = ''
        document.querySelector('#comment_open').style.display = '';
        document.querySelector('#comment_close').style.display = 'none';
    }

    function comment_register() {

        // json 형식으로 데이터 set
        var commentData = {
            comment: document.querySelector('#comment_write').value.trim()
            , tourId: ${tour.tour_id}
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
    }

    function recomment_register(commentId){

        // json 형식으로 데이터 set
        var commentData = {
            comment: document.querySelector('#recomment_write_' + commentId).value.trim()
            , tourId: ${tour.tour_id}
            , commentId: commentId
        }

        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/recomment",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: commentData,
            success: function (res) {// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                console.log(res);
                createCommentForm(res);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }

    function recommentForm(commentId){

        let html = '';

        html += '<div>';
        html += '<div class="form-floating mb-1" id="recomment_write_div">';
        html += '<input type="text" class="form-control" id="recomment_write_' + commentId + '" name="comment" value="" placeholder="">';
        html += '<label for="recomment_write" style="font-size: 13px;"><i class="bi bi-person-fill"></i>&nbsp 대댓글 쓰기</label>';
        html += '</div>';
        html += '<button type="button" class="btn btn-outline-bluemint" style="float: left; color: #0984e3; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="recomment_register(' + commentId + ')">대댓글 등록 </button>';
        html += '</div>';

        document.querySelector('#comment_' + commentId).innerHTML = html;
    }
    function createCommentForm(res) {

        let html = '';

        for (let i = 0; i < res.length; i++) {
            let width = 220;

            if(res[i].comment.length > 15){
                width = 220 + (7 * (res[i].comment.length - 14));
            }
            if (!res[i].recommentCheck) {
                html += '<div>';
                html += '<div>';
                html += '   <div class="form-floating mb-1" id="comment_div" style="float: left;">';
                html += '   <input type="text" class="form-control"  id="comment" name="comment" ' +
                    '               value="' + res[i].comment + ' " placeholder="" style="width: ' + width + 'px; background-color: #55efc4; color: white;" disabled>';
                html += '   <label for="comment" style="font-size: 13px;"><i class="bi bi-person-fill"></i> &nbsp;' + res[i].userNickname + '</label>';
                html += '   </div>';
                html += '</div>';
                html += '<div style="float: left;">';
                html += '   <button class="btn btn-outline-light_green" onClick="recommentForm(' +res[i].comment_id + ')"><i class="bi bi-chat-dots"></i></button>';
                html += '</div>';
                if(userNickname == res[i].userNickname) {
                    html += '<div style="float: left;">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentUpdate(' + res[i].comment_id + ')"><i class="bi bi-pencil-square"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left;">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentDelete(' + res[i].comment_id + ')"><i class="bi bi-x-circle"></i></button>';
                    html += '</div>';
                }
                html += '</div>';
                html += '<div id="comment_' + res[i].comment_id + '">';
                html += '</div>';
            } else {
                html += '<div>';
                html += '<div>';
                html += '<div class="form-floating mb-1" id="recomment_div" style="margin-left: 30px; float: left;">';
                html += '<input type="text" class="form-control" id="recomment" name="recomment" ' +
                            'value="' + res[i].comment + '" placeholder="" style="width: ' + width + 'px; background-color: skyblue; color: white;" disabled>';
                html += '<label for="recomment" style="font-size: 13px;"><i class="bi bi-people-fill"></i> &nbsp;' + res[i].userNickname + '</label>';
                html += '</div>';
                html += '</div>';
                if(userNickname == res[i].userNickname) {
                    html += '<div style="float: left;">';
                    html += '   <button class="btn btn-outline-bluemint" onClick="commentUpdate(' + res[i].comment_id + ')"><i class="bi bi-pencil-square"></i></button>';
                    html += '</div>';
                    html += '<div style="float: left;">';
                    html += '   <button class="btn btn-outline-pink" onClick="commentDelete(' + res[i].comment_id + ')"><i class="bi bi-x-circle"></i></button>';
                    html += '</div>';
                }
                html += '</div>';

            }
        }

        document.querySelector('#comment_area').innerHTML = html;
    }

    function commentUpdate(commentId){

    }

    function commentDelete(commentId){

    }
</script>