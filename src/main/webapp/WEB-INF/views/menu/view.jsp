<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md" style="height: 105%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <%--        <div class="col-2"></div>--%>
        <div class="col-8 text-center">
            <div class="card" style="padding:8px">
                <h2>가게 이름</h2>
                <hr style="margin: 0.4rem;">
                <h7>가게 설명</h7>
            </div>
            <div class="row g-0" id="tourList">
                    <c:forEach items="${shopList}" var="item">
                        <div class="col-4">
                            <div class="card" style="padding:8px">
                                <button type="button" class="btn btn-outline-skyblue">
                                    <img src="../img/test.jpg" alt="..." style="width:200px; height: 200px;">
                                </button>
                                <h8 style="padding-top: 10px;">${item.shop_name}</h8>
                                <span style="font-size: 10px;">${item.shop_city}&nbsp;${item.shop_street}</span>
                                <span style="font-size: 10px;">${item.shop_type}</span>
                                <hr style="margin: 0.4rem;">
                                <label style="font-size: 12px; font-weight: lighter;">
                                    <span style="color: #e74c3c; font-size: 10px; font-weight: bold;">${item.shop_comment}</span>
                                </label>
                            </div>
                        </div>
                    </c:forEach>
                <%-- =============== paging ============== --%>
            </div>
        </div>
    </div>
</div>
