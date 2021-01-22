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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</head>
<body>
	<header id="header"></header>
	
	<section id="container">
        <article class="board_area">
            <form name="notice_form" action="./write_notice.do" method="post">
                <div id="table2">
                    <div class="row2 nc_title">
                        <span class="cell part1">
                            <select class="notice_option" name="notice_type">
                                <option value="">파트 선택</option>
                                <option value="공지">공지</option>
                                <option value="이벤트">이벤트</option>
                            </select>
                        </span>
                        <span class="cell part2">
                            <input type="text" name="notice_title" placeholder="제목을 입력해주세요." />
                        </span>

                    </div>
                    <div class="row2 content">
                        <div id="toolbar-container" class="cell"></div>
                    </div>
                    <div class="row2 content">
                        <div class="cell">
                            <textarea id="editor" class="content_textarea" name="notice_content" placeholder="내용을 입력해주세요."></textarea>
                        </div>
                    </div>
                    <!-- 사진등록 -->
<!--                     <div class="row2 upload">
                        <div class="cell upload_cell">
                            <button class="upload_btn">사진등록</button>
                        </div>
                    </div> -->
                    <!-- 사진등록 끝 -->

                    <!--버튼부분-->
                    <div class="row2 button_row">
                        <div class="cell button_cell">
                            <button class="notice_btn write_btn" onClick=onclick_write()>게시</button>
                            <button class="notice_btn cancel_btn">취소</button>
                        </div>
                    </div>
                    <!-- 버튼부분 끝 -->
                </div>
            </form>
        </article>
    </section>

	<!-- <footer id="footer"></footer> -->
	
		<!-- CKEditor -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor5/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
	
</body>
</html>