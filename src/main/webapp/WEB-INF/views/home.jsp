<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-md" style="height:     55%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-6 text-center">
            <div class="card" style="padding:8px">
                <h2>어서오세요</h2>
                나만의 QR 코드를 만들 수 있는 최고의 사이트 Qaru
            </div>
            <div class="row g-0">
                <div class="col-6">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary">
                            <i class="bi bi-qr-code fs-4" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">QR 코드 생성</h8>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-light_green" onclick="location.href='/user/login'">
                            <i class="bi bi-box-arrow-in-right fs-4"></i>
                        </button>
                        <h8 style="padding-top: 10px;">로그인</h8>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-info" onclick="location.href='/user/signup'"
                                style="--bs-btn-hover-color: white; --bs-btn-active-color: white">
                            <i class="bi bi-person-circle fs-4"></i>
                        </button>
                        <h8 style="padding-top: 10px;">회원가입</h8>
                    </div>
                </div>
            </div>
            <div class="row g-0">
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<%-- ---------------------------- --%>

<div class="container-md">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-6 text-center">
            <div class="row g-0">
                <div class="card" style="padding:8px">
                    <h3><i class="bi bi-list"></i>&nbsp;MENU</h3>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink" onclick="location.href='/tour/tourList'">
                            <i class="bi bi-bus-front-fill fs-3" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">여행</h8>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-outline-pink">
                            <i class="bi bi-clipboard-heart fs-3"></i>
                        </button>
                        <h8 style="padding-top: 10px;">식당</h8>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink">
                            <i class="bi bi-card-checklist fs-3" style="color: white"></i>
                        </button>
                        <h8 style="padding-top: 10px;">일정</h8>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>
