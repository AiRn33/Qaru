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
                    <form class="d-flex" role="search">
                        <select class="form-select me-2" id="searchType" style="width: 100px;">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input class="form-control me-1" type="search" id="searchContent" name="searchContent" placeholder="Search"
                               aria-label="Search">
                        <button class="btn btn-outline-success" type="button" style="width: 100px;" onclick="search()">검 색</button>
                    </form>
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
                            <button type="button" class="btn btn-primary"
                                    onclick="location.href='/tour/${item.tour_id}'">
                                <i class="bi bi-${status.index + 1}-circle fs-4" style="color: white"></i>
                            </button>
                            <h8 style="padding-top: 10px;">${item.tour_title}</h8>
                            <span style="font-size: 10px;">${fn:split(item.tour_date,'T')[0]} / ${item.user_nickname}</span>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 12px; font-weight: lighter;">${fn:length(item.tour_content) > 40 ?
                                    fn:substring(item.tour_content,0,40) : item.tour_content}
                                <c:if test="${fn:length(item.tour_content) > 40}">
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
                                            <a class="page-link" href="/tour/tourList?page=${pageNum}&size=9"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}" end="${endPageNum}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/tour/tourList?page=${status.index}&size=9">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="/tour/tourList?page=${endPageNum}&size=9"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/tour/tourList?page=${pageNum}&size=9"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                   end="${pageNum + 4}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/tour/tourList?page=${status.index}&size=9">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="/tour/tourList?page=${pageNum + 4}&size=9"
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

    function search() {

        // json 형식으로 데이터 set
        var tourSearchRequest = {
            searchType: document.querySelector('#searchType').value.trim()
            , searchContent: document.querySelector('#searchContent').value.trim()
        }
        // ajax 통신
        $.ajax({
            type: "GET",            // HTTP method type(GET, POST) 형식이다.
            url: "/tour/search",      // 컨트롤러에서 대기중인 URL 주소이다.
            data:  tourSearchRequest,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
                let html = '';
                if(res.length < 1){
                    html += '<div class="col-12">';
                    html += '<div class="card" style="padding:8px">';
                    html += '<h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>';
                    html += '<hr style="margin: 0.4rem;">';
                    html += '<label style="font-size: 15px; font-weight: lighter;">검색 결과가 없습니다.</label>';
                    html += '</div>';
                    html += '</div>';
                }

                for(let i = 0; i < res.length; i++){
                    html += '<div class="col-4">';
                    html += '   <div class="card" style="padding:8px">';
                    html += '   <button type="button" class="btn btn-primary" onclick="locationTour(' + res[i].tour_id +')">';
                    html += '       <i class="bi bi-'+ (i+1) +'-circle fs-4" style="color: white"></i>'
                    html += '   </button>';
                    html += '       <h8 style="padding-top: 10px;">' + res[i].tour_title + '</h8>';
                    html += '       <span style="font-size: 10px;">' + res[i].tour_date.split('T')[0] + '/' + res[i].user_nickname +'</span>';
                    html += '       <hr style="margin: 0.4rem;">'
                    html += '       <label style="font-size: 12px; font-weight: lighter;">' + res[i].tour_content.length > 40 ? res[i].tour_content.substring(0, 40) : res[i].tour_content;
                    if(res[i].tour_content.length > 40){
                        html += '<span style="color: #e74c3c; font-size: 10px; font-weight: bold;">...(생략)</span>';
                    }
                    html += '       </label>'
                    html += '   </div>';
                    html += '</div>';
                }
                if(tourSearchRequest.searchContent != ''){
                    document.querySelector('#tourList').innerHTML = html;
                }else{
                    window.location.href="/tour/tourList?page=0&size=9";
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
    }

    function locationTour(id){
        window.location.href = '/tour/' + id;
    }
</script>
