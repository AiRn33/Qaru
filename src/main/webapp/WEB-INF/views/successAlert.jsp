<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    if(${successAlert == 1}){
        alert("회원가입을 축하드립니다!");
        window.location.href="/";
    }else if(${successAlert == 2}){
        alert("가게 등록 완료! 다시 로그인 해주세요.");
        window.location.href="/user/logout";
    }else if(${successAlert == 3}){
        alert("가게 수정 완료!");
        window.location.href="/";
    }else if(${successAlert == 4}){
        alert("게시글 등록 완료!");
        window.location.href="/tour/tourList?page=0&size=9&order=none";
    }else if(${successAlert == 5}){
        alert("메뉴 등록 완료!");
        window.location.href="/user/mypage";
    }else if(${successAlert == 6}){
        alert("메뉴 수정 완료!");
        window.location.href="/user/mypage";
    }else if(${successAlert == 7}){
        alert("내정보 수정 완료! 다시 로그인 해주세요.!");
        window.location.href="/user/logout";
    }
</script>
