<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.btype == 1 }">
		<h2>맥 리뷰 임시게시판</h2>
	</c:when>
	<c:when test="${param.btype == 2 }">
		<h2>주변기기 리뷰 임시게시판</h2>
	</c:when>
	<c:when test="${param.btype == 3 }">
		<h2>맥 질문 임시게시판</h2>
	</c:when>
	<c:otherwise>
		<h2>주변기기 질문 임시게시판</h2>
	</c:otherwise>
</c:choose>
<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 <tbody>
	<c:forEach items="${list}" var="list">
	 <tr>
	  <td>${list.bnum}</td>
	  <td><a href="/board/board_view?bnum=${list.bnum}&btype=${list.btype}">${list.title}</a></td>
	  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
	  <td>${list.memberid}</td>
	  <td>${list.hitcount}</td>
	 </tr>
	</c:forEach>
 </tbody>
</table>

<c:if test="${!empty sessionScope.sessId }">
	<a href="/board/board_write?btype=${param.btype}">게시글작성</a>
</c:if>

</body>
</html>