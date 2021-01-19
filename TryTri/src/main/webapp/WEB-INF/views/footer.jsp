<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("member_id");
	// System.out.println("header.jsp / member_id : " + id);
	String certificate = (String)session.getAttribute("member_certificate");
	String is_admin = (String)session.getAttribute("member_isadmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>TryTri 예약 시스템</title>
    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
</head>
<body>
	<!-- 
	<section id="container">
	 -->
    <div class="inner">
        <div class="message">
        	이 홈페이지는 개인 포트폴리오 용도로 만들었습니다.<br>
            Copyright 2021. Misun. All rights reserved.<br>
            chicmsl@gmail.com
        </div>
    </div>
	<!-- 
	</section>
	 -->
</body>
</html>