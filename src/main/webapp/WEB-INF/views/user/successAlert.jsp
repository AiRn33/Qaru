<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    if(${successAlert == 1}){
        alert("회원가입을 축하드립니다!");
        window.location.href="/";
    }else if(${successAlert == 2}){
        alert("가게 등록 완료!");
        window.location.href="/";
    }else if(${successAlert == 3}){
        alert("가게 수정 완료!");
        window.location.href="/";
    }
</script>
