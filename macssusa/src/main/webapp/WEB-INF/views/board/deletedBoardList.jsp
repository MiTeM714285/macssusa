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

<h3>회원관리</h3>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">게시판 타입</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">IP주소</th>
						<th style="background-color: #eeeeee; text-align: center;">실행버튼(신중히 선택)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
					 <tr>
					  <td>${list.bnum}</td>
					  <td>
					 	<c:choose>
							<c:when test="${list.btype == 1}">맥 리뷰 게시판</c:when>
							<c:when test="${list.btype == 1}">주변기기 리뷰 게시판</c:when>
							<c:when test="${list.btype == 1}">맥 질문 게시판</c:when>
							<c:otherwise>주변기기 질문 게시판</c:otherwise>
						</c:choose>
					  </td>
					  <td><a href="deletedBoardCheck?bnum=${list.bnum}&btype=${list.btype}" onclick="window.open(this.href,'_blank','width=600, height=400'); return false">${list.title}</a></td>
					  <td>${list.memberid}</td>
					  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
					  <td>${list.ip}</td>
					  <td><a onclick="return confirm('해당 게시글을 완전히 삭제하시겠습니까? 해당 게시글의 댓글까지 모두 자동으로 완전삭제됩니다.')" href="/board/completelyDeleteBoard?bnum=${list.bnum}" class="btn btn-primary">완전삭제</a></td>
					 </tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>