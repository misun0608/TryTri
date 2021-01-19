<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
	<title>TryTri 예약 시스템</title>
    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
	<header id="header"></header>
	
	<section id="container">
        <article class="board_area">
            <div id="table2">
                <div class="row2 nc_title">
                    <span class="cell nc_part1">${noticeVO.notice_title}</span>
                    <span class="cell nc_part2">${noticeVO.notice_reg_date}</span>
                </div>

                <div class="row2 content">
                    <div class="cell notice_content">
                    	${fn:replace(noticeVO.notice_content,crlf,'<br/>')}
                    </div>
                </div>
                
                <!-- 버튼 -->
                <div class="row2 detail_btn_row">
                    <div class="cell detail_btn_cell">
                        <button class="upload_btn">목록</button>
                        <button class="upload_btn">수정</button>
                        <button class="upload_btn">삭제</button>
                    </div>
                </div>

                <!--댓글부분-->
                <form action="">
                    <div class="row2">
	                    <div class="cell">
	                        <textarea class="content_textarea" name="reply_content" placeholder="댓글을 입력해주세요."></textarea>
	                    </div>
                	</div>
                </form>


                <!--버튼부분-->
                <div class="row2 reply_button_row">
                    <div class="cell reply_button_cell">
                        <button class="notice_btn write_btn">댓글</button>
                        <button class="notice_btn cancel_btn">취소</button>
                    </div>
                </div>
            </div>
        </article>
    </section>
    
    <footer id="footer"></footer>

</body>
</html>