<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.myproject.trytri.voes.*" %>
<%
	String member_id = (String)session.getAttribute("member_id");
	System.out.println("(board_notice_detail.jsp)member_id: " + member_id);
	NoticeVO noticeVO = (NoticeVO)request.getAttribute("noticeVO");
	System.out.println("(board_notice_detail.jsp)notice_num: " + noticeVO.getNotice_num());
%>
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
	
	<script>
	$(document).ready(function(){
		showReplyList();
	});
	
	// 댓글 리스트
	function showReplyList(){
		let url = "getNoticeReply.do";
		let paramData = {"notice_num" : "${noticeVO.notice_num}"};

		$.ajax({
	        type: 'POST',
	        url: url,
	        contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	        data: paramData,
	        dataType: 'json',

	        success: function(result) {
	           	let htmls = "";
	           	console.log('success로 넘어왔네');
				if(result == null){
					htmls.push("등록된 댓글이 없습니다.");
				} else {
		            $(result).each(function(){
		            	htmls += '<li>';
		            	htmls += '<div>';
		            	htmls += '<span>';
		            	htmls += this.member_id;
		            	htmls += '</span>';
		            	
		            	htmls += '<span>';
		            	htmls += '<a href="javascript:void(0)" onclick="">수정</a>';
		            	htmls += '</span>';
		            	htmls += '<span>';
		            	htmls += '<a href="javascript:void(0)" onclick="">삭제</a>';
		            	htmls += '</span>';
		            	
		            	htmls += '<span>';
		            	htmls += this.reply_reg_date;
		            	htmls += '</span>';
		            	htmls += '<p>';
		            	htmls += this.reply_content;
		            	htmls += '</p>';
		            	
		            	htmls += '</div>';
		            	htmls += '</li>';
		    			$("#replyList").html(htmls);
		            });	//each end
				}
	        },	   // Ajax success end
			error: function(){
				console.log('error로 넘어왔네');
				alert('현재 서버와의 통신이 원할하지 않습니다.(댓글리스트)');
			}
		});	// Ajax end
	}
	
	// 댓글 저장 이벤트
	$(document).on('click', '.write_btn', function(e){
		let reply_content = $('#reply_content').val();
		console.log('reply_content: ' + reply_content);
		let member_id = $('#member_id').val();
		console.log('member_id: ' + member_id);
		
		if(!login_chk(member_id)){return;}
		if(!content_chk(reply_content)){return;}
		
		let paramData = $(reply_write_form).serialize();
		// form name
		
/* 		let paramData = 
			JSON.stringify({
				"reply_content": reply_content,
				"member_id": member_id,
				"notice_num":'${noticeVO.notice_num}'
			});
		 */
/* 		let headers = {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"}; */
		
		$.ajax({
			url:"insertNoticeReply.do",
			// headers: headers,
			data: paramData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				if(result.status == "댓글 등록 성공"){
					showReplyList();
				}else{
					alert('댓글 등록에 실패했습니다.');
				}
			},
			error: function(error){
				console.log("(Error/board.js): " + error);
				alert('현재 서버와의 통신이 원활하지 않습니다.(댓글저장)')
			}
		});
		$('#reply_content').val("");
		e.preventDefault();
	});
	
	function login_chk(member_id){
		if(member_id == "null" || member_id == ""){
			alert('로그인 후 이용해주세요.');
			return false;
		}
		return true;
	}
	
	function content_chk(comment_content){
		if(comment_content == ""){
			alert('댓글 내용을 입력해주세요.');
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
	
<section id="container">
	<header id="header"></header>
	
	<div id="wrapper">
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
                        <button class="upload_btn" onClick="location.href='./notice_list.do'">목록</button>
                        <button class="upload_btn" onClick="location.href='./notice_update_page.do?notice_num=${noticeVO.notice_num}'">수정</button>
                        <button class="upload_btn" onClick="location.href='./notice_delete.do'">삭제</button>
                    </div>
                </div>
				<%
					if(member_id != null){
				%>
				<form name="reply_write_form" method="post">
                <!--댓글부분-->
                <div class="row2">
                	<div class="cell">
	                 	<input type="hidden" name="member_id" id="member_id" value="<%=member_id %>">
	                 	<input type="hidden" name="notice_num" id="notice_num" value="<%=noticeVO.getNotice_num() %>">
	                    <textarea class="content_textarea" name="reply_content" id="reply_content" placeholder="댓글을 입력해주세요."></textarea>
                	</div>
            	</div>


                <!--버튼부분-->
                <div class="row2 reply_button_row">
                    <div class="cell reply_button_cell">
                        <input type="button" class="notice_btn write_btn" value="댓글">
                    </div>
                </div>
                </form>
                <%
					}
                %>
                <!-- 댓글 표시 부분 -->
                <div class="row2">
                	<ul id="replyList">
<!--                 		<li>
                			<div>
                				<span>member_id</span>
                				<span>
                					<a href="javascript:void(0)" onclick="">수정</a>
                					<a href="javascript:void(0)" onclick="">삭제</a>
                				</span>
                				<span>댓글작성날짜</span>
                				<p>댓글 내용</p>
                			</div>
                		</li> -->
                	</ul>
                </div>
                
            </div>
        </article>
        </div>
        
<!--     <footer id="footer"></footer> -->
</section>
    

</body>
</html>