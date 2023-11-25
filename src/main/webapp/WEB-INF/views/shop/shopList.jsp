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
<%--                    <div class="d-flex">--%>
<%--                        <select class="form-select me-2" id="searchType" style="width: 100px;">--%>
<%--                            <option value="name">이름</option>--%>
<%--                            <option value="city">지역</option>--%>
<%--                        </select>--%>
<%--                        <input class="form-control me-1" type="search" id="searchContent" name="searchContent"--%>
<%--                               placeholder="Search"--%>
<%--                               aria-label="Search" onkeyup="if(window.event.keyCode==13){search();}">--%>
<%--                        <button class="btn btn-outline-success" id="searchBtn" type="button" style="width: 100px;"--%>
<%--                                onclick="search()">검 색--%>
<%--                        </button>--%>
<%--                    </div>--%>
                </div>
            </div>
            <div class="card" style="padding:8px">
                <h2>여행지의 가게를 소개합니다</h2>
            </div>
            <div class="row g-0" id="tourList">
                <c:if test="${shopListCount < 1}">
                    <div class="col-12">
                        <div class="card" style="padding:8px">
                            <h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 15px; font-weight: lighter;">등록 된 게시글이 없습니다.</label>
                        </div>
                    </div>
                </c:if>
                <c:forEach items="${shopList}" var="item">
                    <div class="col-4">
                        <div class="card" style="padding:8px">
                            <button type="button" class="btn btn-outline-skyblue"
                                    onclick="location.href='/menu/${item.shopId}'">
                                <img src="../img/${item.storedFileName}" alt="..." style="width:200px; height: 200px;">
                            </button>
                            <h8 style="padding-top: 10px;">${item.shopName}</h8>
                            <span style="font-size: 10px;">${item.shopCity}&nbsp;${item.shopStreet}</span>
                            <span style="font-size: 10px;">${item.shopType}</span>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 12px; font-weight: lighter;">
                                <span style="color: #e74c3c; font-size: 10px; font-weight: bold;">${item.shopComment}</span>
                            </label>
                        </div>
                    </div>
                </c:forEach>
                <%-- =============== paging ============== --%>
            </div>

            <div class="row g-0">
                <c:if test="${shopListCount > 0}">
                    <div class="col-4"></div>
                    <div class="col-4" style="margin-top: 20px;">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="justify-content: center;">
                                <c:choose>
                                    <c:when test="${pageNum < 4}">
                                        <li class="page-item">
                                            <a class="page-link" href="/shop/shopList?page=${pageNum}&size=6"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}" end="${endPageNum}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/shop/shopList?page=${status.index}&size=6">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="/shop/shopList?page=${endPageNum}&size=6"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/shop/shopList?page=${pageNum}&size=6"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                   end="${pageNum + 4}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/shop/shopList?page=${status.index}&size=6">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="/shop/shopList?page=${pageNum + 4}&size=6"
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
