<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md" style="height: 105%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <%--        <div class="col-2"></div>--%>
        <div class="col-8 text-center">
            <div class="col-12 row g-0">
                <div class="col-6"></div>
                <div class="col-6" style="justify-content: right; margin-bottom: 10px;">
                    <div class="d-flex">
                        <select class="form-select me-2" id="searchType" style="width: 100px;">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input class="form-control me-1" type="search" id="searchContent" name="searchContent"
                               placeholder="Search"
                               aria-label="Search" onkeyup="if(window.event.keyCode==13){search();}">
                        <button class="btn btn-outline-success" id="searchBtn" type="button" style="width: 100px;"
                                onclick="search()">검 색
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-12 row g-0">
                <c:choose>
                    <c:when test="${order=='none'}">
                        <input type="hidden" value="0" id="likesCk">
                        <input type="hidden" value="0" id="commentsCk">
                    </c:when>
                    <c:when test="${order == 'likes'}">
                        <input type="hidden" value="1" id="likesCk">
                        <input type="hidden" value="0" id="commentsCk">
                    </c:when>
                    <c:when test="${order == 'comments'}">
                        <input type="hidden" value="0" id="likesCk">
                        <input type="hidden" value="1" id="commentsCk">
                    </c:when>
                </c:choose>
                <input type="hidden" value="${pages}" id="pageNum">

                <div class="col-6"></div>
                <div class="col-6" style="justify-content: right; margin-bottom: 10px;">
                    <div class="d-flex" style="float: right;">
                        <div>
                            <button type="button" class="btn btn-outline-pink" id="like_on_btn" style="color: red; height: 30px;
                                    font-size: 12px; margin-bottom: 7px;" onclick="ordersCheck('likes')">
                                <i class="bi bi-chat-heart" style="color: red; font-size: 13px; "></i>
                                좋아요 순
                            </button>
                        </div>
                        <button type="button" class="btn btn-outline-bluemint" id="comment_on_btn"
                                style="color: blue; height: 30px; font-size: 12px; margin-bottom: 7px;" onclick="ordersCheck('comments')">
                            <i class="bi bi-chat-dots" style="color: blue;"></i>
                            댓글 순
                        </button>
                    </div>
                </div>
            </div>
            <div class="card" style="padding:8px">
                <h2>사람들과 당신의 여행 코스를 공유해보세요</h2>
            </div>
            <div class="row g-0" id="tourList">
                <c:if test="${tourListCount < 1}">
                    <div class="col-12">
                        <div class="card" style="padding:8px">
                            <h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 15px; font-weight: lighter;">등록 된 게시글이 없습니다.</label>
                        </div>
                    </div>
                </c:if>
                <c:forEach items="${tourList}" var="item" varStatus="status">
                    <div class="col-4">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-outline-bluemint"
                                    onclick="location.href='/tour/${item.tourId}'">
                                <img src="/img/${item.storedFileName}" class="img-thumbnail" alt="..."
                                     style="width: 200px; height: 200px;">
                            </button>
                            <h8 style="padding-top: 10px;">${item.tourTitle}</h8>
                            <span style="font-size: 10px;">${fn:split(item.tourDate,'T')[0]} / ${item.userNickname}</span>
                            <span style="font-size: 10px; color: red;">좋아요 : ${item.likesCount} / 댓글 수 : ${item.commentCount == null ? 0 : item.commentCount}</span>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 12px; font-weight: lighter;">${fn:length(item.tourContent) > 40 ?
                                    fn:substring(item.tourContent,0,40) : item.tourContent}
                                <c:if test="${fn:length(item.tourContent) > 40}">
                                    <span style="color: #e74c3c; font-size: 10px; font-weight: bold;">...(생략)</span>
                                </c:if>
                            </label>
                        </div>
                    </div>
                </c:forEach>
                <div class="row g-0">
                    <div class="col-8"></div>
                    <div class="col-4" style="text-align: right; margin-top: 10px;">
                        <button class="btn btn-pink" onclick="location.href='/tour'"><span
                                style="color: white;">등록</span></button>
                    </div>
                </div>

                <%-- =============== paging ============== --%>
                <c:if test="${tourListCount > 0}">
                    <div class="col-4"></div>
                    <div class="col-4" style="margin-top: 20px;">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="justify-content: center;">
                                <c:choose>
                                    <c:when test="${pageNum < 4}">
                                        <li class="page-item">
                                            <a class="page-link" onclick="pageMove(${pageNum})"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}" end="${endPageNum}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   onclick="pageMove(${status.index})">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" onclick="pageMove(${endPageNum})"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" onclick="pageMove(${pageNum})"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                   end="${pageNum + 4}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   onclick="pageMove(${status.index})">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" onclick="pageMove(${pageNum + 4})"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>

                    <div class="col-4"></div>
                </c:if>

            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function(){
        settingBtn();
    }

    function settingBtn(){
        let set = '${order}';
        if(set == 'likes'){
            document.querySelector('#like_on_btn').classList.remove('btn-outline-pink');
            document.querySelector('#like_on_btn').classList.add('btn-pink');
        }else if(set == 'comments'){
            document.querySelector('#comment_on_btn').classList.remove('btn-outline-bluemint');
            document.querySelector('#comment_on_btn').classList.add('btn-bluemint');
        }
    }

    function ordersCheck(order){

        if(order == 'likes'){
            if(document.querySelector('#likesCk').value == 1){
                document.querySelector('#likesCk').value = 0;
                document.querySelector('#commentsCk').value = 0;
                btnLikes(1);

            }else if(document.querySelector('#likesCk').value == 0){
                document.querySelector('#likesCk').value = 1;
                document.querySelector('#commentsCk').value = 0;
                btnLikes(2);
            }
        }else if(order == 'comments'){
            if(document.querySelector('#commentsCk').value == 1){
                document.querySelector('#likesCk').value = 0;
                document.querySelector('#commentsCk').value = 0;
                btnLikes(3);
            }else if(document.querySelector('#commentsCk').value == 0){
                document.querySelector('#likesCk').value = 0;
                document.querySelector('#commentsCk').value = 1;
                btnLikes(4);
            }
        }

        pageMove(document.querySelector('#pageNum').value);
    }

    function btnLikes(value){
        if(value == 1){
            // 좋아요 순인 경우
            document.querySelector('#like_on_btn').classList.remove('btn-pink');
            document.querySelector('#like_on_btn').classList.add('btn-outline-pink');

            if (document.querySelector('#comment_on_btn').classList.contains('btn-bluemint')){
                document.querySelector('#comment_on_btn').classList.remove('btn-bluemint');
                document.querySelector('#comment_on_btn').classList.add('btn-outline-bluemint');
            }
        }else if(value == 2){
            // 좋아요 순이 아닌경우
            document.querySelector('#like_on_btn').classList.remove('btn-outline-pink');
            document.querySelector('#like_on_btn').classList.add('btn-pink');

            if (document.querySelector('#comment_on_btn').classList.contains('btn-bluemint')){
                document.querySelector('#comment_on_btn').classList.remove('btn-bluemint');
                document.querySelector('#comment_on_btn').classList.add('btn-outline-bluemint');
            }
        }else if(value == 3){
            // 댓글 순인 경우
            document.querySelector('#comment_on_btn').classList.remove('btn-bluemint');
            document.querySelector('#comment_on_btn').classList.add('btn-outline-bluemint');

            if (document.querySelector('#like_on_btn').classList.contains('btn-pink')){
                document.querySelector('#like_on_btn').classList.remove('btn-pink');
                document.querySelector('#like_on_btn').classList.add('btn-outline-pink');
            }
        }else if(value == 4){
            // 댓글 순 아닌 경우
            document.querySelector('#comment_on_btn').classList.remove('btn-outline-bluemint');
            document.querySelector('#comment_on_btn').classList.add('btn-bluemint');

            if (document.querySelector('#like_on_btn').classList.contains('btn-pink')){
                document.querySelector('#like_on_btn').classList.remove('btn-pink');
                document.querySelector('#like_on_btn').classList.add('btn-outline-pink');
            }
        }
    }
    function pageMove(pageNum){

        let num = pageNum;
        let size = 9;
        let check = 'none';

        if(document.querySelector('#commentsCk').value == 1){
            check = 'comments';
        }else if(document.querySelector('#likesCk').value == 1){
            check = 'likes';
        }

        location.href='/tour/tourList?page='+ num +'&size=' + size + '&order=' + check;
    }

    function search() {
        let check = 'none';
        if(document.querySelector('#commentsCk').value == 1){
            check = 'comments';
        }else if(document.querySelector('#likesCk').value == 1){
            check = 'likes';
        }

        // json 형식으로 데이터 set
        var tourSearchRequest = {
            searchType: document.querySelector('#searchType').value.trim()
            , searchContent: document.querySelector('#searchContent').value.trim()
            , order: check
        }
        // ajax 통신
        $.ajax({
            type: "GET",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/search",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: tourSearchRequest,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
                let html = '';
                if (res.length < 1) {
                    html += '<div class="col-12">';
                    html += '<div class="card" style="padding:8px">';
                    html += '<h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>';
                    html += '<hr style="margin: 0.4rem;">';
                    html += '<label style="font-size: 15px; font-weight: lighter;">검색 결과가 없습니다.</label>';
                    html += '</div>';
                    html += '</div>';
                }
                for (let i = 0; i < res.length; i++) {
                    console.log(res[i]);
                    html += '<div class="col-4">';
                    html += '   <div class="card" style="padding:8px">';
                    html += '   <button type="button" class="btn btn-outline-bluemint" onclick="locationTour(' + res[i].tourId + ')">';
                    html += '       <img src="/img/' + res[i].storedFileName + '" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;"">';
                    html += '   </button>';
                    html += '       <h8 style="padding-top: 10px;">' + res[i].tourTitle + '</h8>';
                    html += '       <span style="font-size: 10px;">' + res[i].tourDate.split('T')[0] + '/' + res[i].userNickname + '</span>';
                    html += '       <span style="font-size: 10px; color: red;">좋아요 : ' + res[i].likesCount + ' / 댓글 수 : '+res[i].commentCount+'</span>';
                    html += '       <hr style="margin: 0.4rem;">'
                    html += '       <label style="font-size: 12px; font-weight: lighter;">' + res[i].tourContent.length > 40 ? res[i].tourContent.substring(0, 40) : res[i].tourContent;
                    if (res[i].tourContent.length > 40) {
                        html += '<span style="color: #e74c3c; font-size: 10px; font-weight: bold;">...(생략)</span>';
                    }
                    html += '       </label>'
                    html += '   </div>';
                    html += '</div>';
                }


                if (tourSearchRequest.searchContent != '') {
                    document.querySelector('#tourList').innerHTML = html;
                } else {
                    window.location.href = "/tour/tourList?page=0&size=9&order=" + check;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
    }

    function locationTour(id) {
        window.location.href = '/tour/' + id;
    }
</script>
