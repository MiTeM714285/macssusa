<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width">
<!-- 스타일시트 참조  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- jQuery 선언 -->

<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<div class="container">
	<h3>삭제된 댓글 관리</h3>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">댓글이 있었던 해당 게시글</th>
						<th style="background-color: #eeeeee; text-align: center;">댓글내용</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자 ID</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">IP주소</th>
						<th style="background-color: #eeeeee; text-align: center;">실행버튼(신중히 선택)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
					 <tr>
					  <td>${list.cnum}</td>
					  <td>
					  	<c:choose>
					  		<c:when test="${list.btype[0] == 1 }">
								[맥 리뷰게시판]
							</c:when>
							<c:when test="${list.btype[0] == 2 }">
								[주변기기 리뷰게시판]
							</c:when>
							<c:when test="${list.btype[0] == 3 }">
								[맥 질문게시판]
							</c:when>
							<c:otherwise>
								[주변기기 질문게시판]
							</c:otherwise>
					  	</c:choose>
					  		<a href="deletedBoardCheck?bnum=${list.bnum}&btype=${list.btype[0]}" onclick="window.open(this.href,'_blank','width=600, height=400'); return false">${list.title[0]} <c:if test="${list.boardAvailable[0] == 0}"> [삭제됨]</c:if></a>
					  </td>
					  <td><a onclick="window.open(this.href,'_blank','width=600, height=200'); return false" href="deletedCommentCheck?cnum=${list.cnum }">내용보기</a></td>
					  <td>${list.memberid}</td>
					  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
					  <td>${list.ip}</td>
					  <td><a onclick="return confirm('해당 댓글을 완전히 삭제하시겠습니까?')" href="/board/completelyDeleteComment?cnum=${list.cnum}" class="btn btn-primary">완전삭제</a></td>
					 </tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>