<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<h2>맥-리뷰</h2>
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
	  <td>${list.title}</td>
	  <td>${list.regdate}</td>
	  <td>${list.memberid}</td>
	  <td>${list.hitcount}</td>
	 </tr>
	</c:forEach>
 </tbody>
</table>

<c:if test="${!empty sessionScope.sessId }">
	<a href="/board/board_macreview_write">게시글작성</a>
</c:if>

</body>
</html>