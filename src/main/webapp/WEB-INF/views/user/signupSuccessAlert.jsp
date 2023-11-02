<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    if(${signupSuccess}){
        alert("회원가입을 축하드립니다!");
        window.location.href="/";
    }
</script>
