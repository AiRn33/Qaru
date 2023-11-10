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
                                    <img src="../img/${item.storedFileName}" class="img-thumbnail" alt="..." style="width: 150px; height: 150px;" onclick="thumbnailImg(this)">
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary" onclick="location.href='/tour/${tour.tour_id}/update'">
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
                        <button type="button" class="btn btn-pink" onclick="location.href='/tour/tourList?page=0&size=9'">
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
    function thumbnailImg(input){

    }
</script>