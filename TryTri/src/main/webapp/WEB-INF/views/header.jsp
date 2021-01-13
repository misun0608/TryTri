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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
</head>
<body>
	<section id="container">
    <header id="header">
        <div class="inner">
            <div class="left">
                <span class="logo">
                    <a href="./index.do"><img src="${pageContext.request.contextPath}/resources/img/logo_white.png" alt="logo"></a>
                </span>
            </div>
            <nav id="nav">
                <ul class="menu">
                    <li>
                        <a href="">
                            <span class="schedule">Schedule</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="gallery">Gallery</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="notice">Notice</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="qa">Q&A</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="right">
                <ul class="topMenu">
                    <li class="signup"><a href="./signup_page.do">회원가입</a></li>
                    <li class="login"><a href="./login_page.do">로그인</a></li>
                </ul>
            </div>
        </div>

    </header>
</section>
</body>
</html>