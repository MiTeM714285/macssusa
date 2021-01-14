<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p>${view.memberid } / <fmt:formatDate value="${view.regdate}" pattern="yyyy-MM-dd" /></p>
		<textarea rows="5" cols="50" style="width: 100%; height: 88px; resize: none; outline: none; border: 0px solid #dddddd" readonly="readonly" maxlength="512" name="content">${view.content }</textarea>
	</div>
<input type="button" value="닫기" onclick="closeButton()">
<script>
	function closeButton() {
		close();
	}
</script>
</body>
</html>