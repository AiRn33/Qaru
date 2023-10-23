<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%--<html lang="en" data-bs-theme="dark">--%>
<head>
    <meta charset="UTF-8">
    <%-- bootstrap setting --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/style.css">

    <title>Qaru</title>
</head>
<body>
<%-- Nav --%>
<nav class="navbar navbar-expand-lg" style="left: 10px">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <i class="bi bi-qr-code-scan" style="color: black"></i>&nbsp;
            Qaru
        </a>
    </div>
</nav>
<%-- Body --%>
<div class="container-md" style="height: 110%!important;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-4"></div>
        <div class="col-4 text-center">
            <div class="card" style="padding:8px">
                <h1>회원가입</h1>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <div class="form-floating mb-1">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">아이디 입력칸 &nbsp <i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword" >비밀번호 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control" id="floatingPasswordCheck" placeholder="Password">
                            <label for="floatingPasswordCheck" >비밀번호 확인 입력칸 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" class="form-control" id="nickname" placeholder="nickname">
                            <label for="nickname" >닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                        </div>
                        <div class="input-group has-validation">
                            <div class="form-floating is-invalid">
                                <input type="text" class="form-control" id="nickname1" placeholder="nickname">
                                <label for="nickname1" >닉네임 &nbsp;<i class="bi bi-mouse"></i></label>
                            </div>
                            <div class="invalid-feedback" style="text-align: left; font-size: 11px; color: #ff6b81">
                                &nbsp;&nbsp;닉네임을 다시 입력해주세요
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-primary">
                            <i class="bi bi-people-fill fs-5" style="color: white;">
                                &nbsp;회원가입
                            </i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col">
                    <div class="card" style="padding:8px">
                        <button type="button" class="btn btn-pink">
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
        <div class="col-4"></div>
    </div>
</div>
</body>
</html>