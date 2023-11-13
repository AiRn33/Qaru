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
                                    <label for="comment" style="font-size: 13px;"><i class="bi bi-person-fill"></i>
                                        &nbsp;댓글 쓰기</label>
                                </div>
                            </div>
                            <button type="button" class="btn btn-mint"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="comment_register()">댓글 등록
                            </button>
                            <button type="button" class="btn btn-bluemint"
                                    style="color: white; height: 30px; font-size: 12px; margin-bottom: 7px;">댓글 보기
                            </button>
                        </label>
                        <div>
                            <div class="form-floating mb-1" id="comment_div">
                                <input type="text" class="form-control" id="comment" name="comment"
                                       value="댓글입니다!" placeholder=""
                                       style="width: auto; background-color: #55efc4; color: white;" disabled>
                                <label for="comment" style="font-size: 13px;"><i class="bi bi-person-fill"></i> &nbsp;댓글
                                    주인</label>
                            </div>
                        </div>
                        <div>
                            <div class="form-floating mb-1" id="recomment_div" style="margin-left: 30px;">
                                <input type="text" class="form-control" id="recomment" name="recomment"
                                       value="대댓글입니다!" placeholder=""
                                       style="width: auto; background-color: skyblue; color: white;" disabled>
                                <label for="recomment" style="font-size: 13px;"><i class="bi bi-people-fill"></i> &nbsp;대댓글
                                    주인</label>
                            </div>
                        </div>
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
    function thumbnailImg(input) {

    }

    function comment_register(){

        // json 형식으로 데이터 set
        var commentData = {
            comment : document.querySelector('#comment_write').value.trim()
            , tourId : ${tour.tour_id}
        }

        $.ajax({
            type: "post",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/comment",      // 컨트롤러에서 대기중인 URL 주소이다.
            data:  commentData,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            }
        });
    }
</script>