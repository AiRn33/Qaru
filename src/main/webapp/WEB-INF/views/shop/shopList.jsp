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
                            <option value="name">이름</option>
                            <option value="city">지역</option>
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
            <div class="card" style="padding:8px">
                <h2>여행지의 가게를 소개합니다</h2>
            </div>
            <div class="row g-0" id="shopList">
                <c:if test="${shopListCount < 1}">
                    <div class="col-12">
                        <div class="card" style="padding:8px">
                            <h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>
                            <hr style="margin: 0.4rem;">
                            <label style="font-size: 15px; font-weight: lighter;">등록 된 가게가 없습니다.</label>
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

            <div class="row g-0" id="pageArea">
                <c:if test="${shopListCount > 0}">
                    <div class="col-4"></div>
                    <div class="col-4" style="margin-top: 20px;">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="justify-content: center;">
                                <c:choose>
                                    <c:when test="${getPageNum < 4}">
                                        <c:choose>
                                            <c:when test="${getPageNum - 2 > 0}">
                                                <li class="page-item">
                                                    <a class="page-link" href="/shop/shopList?page=${getPageNum-2}&size=6"
                                                       aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="/shop/shopList?page=0&size=6"
                                                       aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                   end="${endPageNum}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/shop/shopList?page=${status.index}&size=6">${status.index + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${getPageNum + 2 > endPageNum}">
                                                <li class="page-item">
                                                    <a class="page-link" href="/shop/shopList?page=${endPageNum}&size=6"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="/shop/shopList?page=${getPageNum + 2}&size=6"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/shop/shopList?page=${getPageNum - 2}&size=6"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:choose>
                                            <c:when test="${pageNum + 4 > endPageNum}">
                                                <c:forEach var="item" varStatus="status" begin="${endPageNum - 4}"
                                                           end="${endPageNum}">
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
                                                <c:forEach var="item" varStatus="status" begin="${pageNum}"
                                                           end="${pageNum + 4}">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                           href="/shop/shopList?page=${status.index}&size=6">${status.index + 1}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item">
                                                    <a class="page-link"
                                                       href="/shop/shopList?page=${pageNum + 4}&size=6"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
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
    function search(){

        // json 형식으로 데이터 set
        var shopSearchRequest = {
            searchType: document.querySelector('#searchType').value.trim()
            , searchContent: document.querySelector('#searchContent').value.trim()
        }
        // ajax 통신
        $.ajax({
            type: "GET",            // HTTP method type(GET, POST) 형식이다.
            url: "/shop/search",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: shopSearchRequest,
            success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                console.log(res);
                let html = '';
                if(res.length > 0){
                    for(let i = 0; i < res.length; i++){

                        html += '<div class="col-4">';
                        html += '  <div class="card" style="padding:8px">';
                        html += '     <button type="button" class="btn btn-outline-skyblue"';
                        html += '           onclick="moveShop(' + res[i].shopId + ')">';
                        html += '       <img src="../img/' + res[i].storedFileName + '" alt="..." style="width:200px; height: 200px;">';
                        html += '     </button>';
                        html += '     <h8 style="padding-top: 10px;">' + res[i].shopName + '</h8>';
                        html += '     <span style="font-size: 10px;">' + res[i].shopCity + ' ' + res[i].shopStreet + '</span>';
                        html += '     <span style="font-size: 10px;">' + res[i].shopType + '</span>';
                        html += '     <hr style="margin: 0.4rem;">';
                        html += '     <label style="font-size: 12px; font-weight: lighter;">';
                        html += '       <span style="color: #e74c3c; font-size: 10px; font-weight: bold;">' + res[i].shopComment + '</span>';
                        html += '     </label>';
                        html += '     </div>';
                        html += '</div>';

                    }
                }else{
                    html += '<div class="col-12">';
                    html +=    '<div class="card" style="padding:8px">';
                    html +=        '<h8 style=""><i class="bi bi-clipboard-x" style="font-size: 30px; "></i></h8>'
                    html +=        '<hr style="margin: 0.4rem;">';
                    html +=            '<label style="font-size: 15px; font-weight: lighter;">등록 된 가게가 없습니다.</label>';
                    html +=    '</div>';
                    html += '</div>';
                }

                document.querySelector('#shopList').innerHTML = html;
                document.querySelector('#pageArea').style.display = 'none';
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
    }

    function moveShop(input){
        location.href = '/menu/' + input;
    }
</script>
