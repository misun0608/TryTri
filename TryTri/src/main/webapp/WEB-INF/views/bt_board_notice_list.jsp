<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <!-- BootStarp 4.6 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">  
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	
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
                <c:forEach items="${nlist}" var="noticeVO">
	                <div class="row content">
	                    <span class="cell col1">${noticeVO.notice_num}</span>
	                    <span class="cell col2">
	                    	<a href="./notice_detail.do?notice_num=${noticeVO.notice_num}">${noticeVO.notice_title}</a>
	                   	</span>
	                    <span class="cell col3">${noticeVO.notice_reg_date}</span>
	                </div>
                </c:forEach>
            </div>
            
            <div class="write_button">
            	<button onClick="location.href='./notice_write_page.do'">글쓰기</button>
            </div>

            <!-- 페이징 부분-->
            <div class="paging">
				<ul class="pagination modal">
					<c:if test="${page.prev}">
						<li><a href="notice_list.do?num=${page.startPageNum - 1}">이전</a></li>
					</c:if>
					
					<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
						<li>
						<c:if test="${select != num}">
							<a href="notice_list.do?num=${num}">${num}</a>
						</c:if>
						<c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
						</li>
					</c:forEach>

					<c:if test="${page.next}">
						<li><a href="notice_list.do?num=${page.endPageNum + 1}">다음</a></li>
					</c:if>

				</ul>
            </div>
            <!--페이징 부분 끝-->
        </article>
    </section>
	
	<!-- <footer id="footer"></footer> -->
</body>
</html>