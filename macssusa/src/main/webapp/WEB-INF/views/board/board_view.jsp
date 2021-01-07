<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>제목</label>
	<input type="text" name="title" readonly="readonly" value="${view.title}"/><br />
	
	<label>작성자</label>
	<input type="text" name="writer" readonly="readonly" value="${view.memberid}"/><br />
	
	<label>내용</label>
	<textarea cols="50" rows="5" name="content" readonly="readonly" >${view.content}</textarea><br />
	
	<c:if test="${!empty sessionScope.sessId && sessionScope.sessId == view.memberid}">
		<a href="/board/board_update?bnum=${view.bnum }&btype=${param.btype}">수정</a>
		<a href="/board/board_delete?bnum=${view.bnum }&btype=${param.btype}">삭제</a>
	</c:if>
	<a href="/board/board?btype=${param.btype }">목록으로</a>
</body>
</html>