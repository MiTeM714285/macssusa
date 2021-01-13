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
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">가입날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">활성화여부</th>
						<th style="background-color: #eeeeee; text-align: center;">실행버튼(신중히 선택)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="memberList">
					 <tr>
					  <td>${memberList.id}</td>
					  <td>${memberList.nickname}</td>
					  <td>${memberList.email}</td>
					  <td><fmt:formatDate value="${memberList.regdate}" pattern="yyyy-MM-dd" /></td>
					  <td>
						  <c:choose>
						 	 <c:when test="${memberList.available == 1}">활성화</c:when>
						 	 <c:otherwise>비활성화</c:otherwise>
						  </c:choose>
					  </td>
					  <td><a href="/member/disableMember?id=${memberList.id}" class="btn btn-primary">비활성화</a><a href="/member/enableMember?id=${memberList.id}" class="btn btn-primary">활성화</a><a onclick="return confirm('해당 회원을 완전히 삭제하시겠습니까? 해당 계정의 정보와 게시글, 댓글이 모두 자동으로 완전삭제됩니다.')" href="/member/completelyDeleteMember?id=${memberList.id}" class="btn btn-primary">완전삭제</a></td>
					 </tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>