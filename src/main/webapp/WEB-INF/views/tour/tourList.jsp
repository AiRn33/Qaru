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
                        <select class="form-select me-2" style="width: 100px;">
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                        </select>
                        <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit" style="width: 100px;">검 색</button>
                    </form>
                </div>
            </div>
            <div class="card" style="padding:8px">
                <h2>사람들과 당신의 여행 코스를 공유해보세요</h2>
            </div>
            <div class="row g-0">
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
                        <button class="btn btn-pink" onclick="location.href='/tour'"><span style="color: white;">등록</span></button>
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
                                        <a class="page-link" href="/tour/tourList?page=${pageNum}&size=9" aria-label="Previous">
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
                                        <a class="page-link" href="/tour/tourList?page=${endPageNum}&size=9" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="/tour/tourList?page=${pageNum}&size=9" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach var="item" varStatus="status" begin="${pageNum}" end="${pageNum + 4}">
                                        <li class="page-item">
                                            <a class="page-link"
                                               href="/tour/tourList?page=${status.index}&size=9">${status.index + 1}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="/tour/tourList?page=${pageNum + 4}&size=9" aria-label="Next">
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
