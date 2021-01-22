<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>

</head>
<body>
<section id="container">
	<header id="header"></header>
	
	<div id="wrapper">
	    <div class="login_outline">
	        <div class="login_area">
	            <h3 class="login_title">LOGIN</h3>
	            <form action="login_process.do" name="login_form" method="post">
	                <div class="login_data">
	                    <div class="id_section">
	                        <!-- <span class="id"></span><label>아이디</label> -->
	                        <input type="text" name="member_id" class="input_login" ime-mode="disable" placeholder="아이디">
	                    </div>
	                    <div class="pw_section">
	                        <!-- <span class="pw"></span><label>비밀번호</label> -->
	                        <input type="password" name="member_pw" class="input_login" placeholder="비밀번호">
	                    </div>
	                    <div class="login_underline">
	                        <div class="auto_login">
	                            <input type="checkbox" id="remember_login">
	                            <label for="remember_login">자동로그인</label>
	                        </div>
	                        <div class="find">
	                            <a href="#" class="find_login_data">아이디/비밀번호 찾기</a> 
	                        </div>
	                    </div>
	
	                    <input type="button" id="login_btn" class="login_btn" onclick="onclick_login()" value="로그인">
	
	                    <div class="signup_section">
	                        <a href="./signup_page.do">아직도 회원이 아니신가요?</a>
	                    </div>
	                    
	                </div>
	            </form>
	        </div>
	    </div>
	 </div>
	<footer id="footer"></footer>

</section>
</body>
</html>