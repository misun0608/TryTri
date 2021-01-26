<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.myproject.trytri.voes.*" %>
<%
	String member_id = (String)session.getAttribute("member_id");
	NoticeVO noticeVO = (NoticeVO)request.getAttribute("noticeVO");
	//NReplyVO rvo = (NReplyVO)request.getAttribute("NReplyVO");
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
	<!-- momentjs -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

	<script>
	$(document).ready(function(){
		showReplyList();
	});
	
	// 댓글 리스트
	function showReplyList(){
		let url = "getNoticeReply.do";
		let paramData = {"notice_num" : "${noticeVO.notice_num}"};
		//$("#replyList").empty();

		$.ajax({
	        url: url,
	        type: 'POST',
	        contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	        data: paramData,
	        dataType: 'json',

	        success: function(result) {
	           	let htmls = "";
				if(result == null){
					htmls.push("등록된 댓글이 없습니다.");
				} else {
		            $(result).each(function(index, comment){
		            	htmls += '<li>';
		            	htmls += '<div>';
		            	htmls += '<span>';
		            	htmls += comment.member_id;
		            	htmls += '</span>';
		            	
		            	if(comment.member_id == '<%=member_id %>'){
			            	htmls += '<span>';
			            	htmls += '<a href="javascript:void(0)" onclick="update_reply('+ comment.reply_num, comment.member_id, comment.reply_content +')">수정</a>';
			            	htmls += '</span>';
			            	htmls += '<span>';
			            	htmls += '<a href="javascript:void(0)" onclick="delete_reply('+ comment.reply_num +')">삭제</a>';
			            	htmls += '</span>';
		            	}
		            	htmls += '<span>';
		            	htmls += moment(comment.reply_reg_date).format('YYYY-MM-DD');
		            	htmls += '</span>';
		            	htmls += '<p>';
		            	htmls += comment.reply_content;
		            	htmls += '</p>';
		            	
		            	htmls += '</div>';
		            	htmls += '</li>';
		            	htmls += '</form>';
		    			$("#replyList").html(htmls).trigger("create");
		            });	//each end
				}
	        },	   // Ajax success end
			error: function(){
				alert('현재 서버와의 통신이 원할하지 않습니다.(댓글리스트)');
			}
		});	// Ajax end
	}
	
	// 댓글 저장 이벤트
	$(document).on('click', '.write_btn', function(e){
		let reply_content = $('#reply_content').val();
		let member_id = $('#member_id').val();
		
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
	
	// 댓글 삭제
	function delete_reply(rid){
		let params = {"reply_num" : rid};
		
		$.ajax({
			url: 'deleteNoticeReply.do',
			type: 'POST',
			data: params,
			contentType: 'application/x-www-form-urlencoded;charset=utf-8',
			dataType: 'json',
			
			success: function(result){
				showReplyList();	
			},
			error: function(){
				alert('현재 서버와 통신이 원활하지 않습니다.(delete)');
			}
		});
		//e.preventDefault();
	}

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
				<form name="reply_write_form">
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
                	<ul id="replyList"></ul>
                </div>
                
            </div>
        </article>
        </div>
        
<!--     <footer id="footer"></footer> -->
</section>
    

</body>
</html>