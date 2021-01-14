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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/page.js"></script>
</head>
<body>
	<header id="header"></header>
	
    <section id="container">
        <article class="board_area">
            <div id="table">
                <div class="row title">
                    <span class="cell col1">번호</span>
                    <span class="cell col2">제목</span>
                    <span class="cell col3">등록일</span>
                </div>
                <div class="row content">
                    <span class="cell col1">12</span>
                    <span class="cell col2">1월 정기모임 안내</span>
                    <span class="cell col3">2021.01.14</span>
                </div>
            </div>

            <!-- 페이징 부분-->
            <div class="paging">

            </div>
            <!--페이징 부분 끝-->
        </article>
    </section>

</body>
</html>