<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<label>파일</label>
	<c:if test="${!empty view.filename1 }"><img src="/resources/img/${view.filename1 }" width=400 height=200 /><br></c:if>
	<c:if test="${!empty view.filename2 }"><img src="/resources/img/${view.filename2 }" width=400 height=200 /><br></c:if>
	<c:if test="${!empty view.filename3 }"><img src="/resources/img/${view.filename3 }" width=400 height=200 /><br></c:if>
	<c:if test="${!empty view.filename4 }"><img src="/resources/img/${view.filename4 }" width=400 height=200 /><br></c:if>
	<c:if test="${!empty view.filename5 }"><img src="/resources/img/${view.filename5 }" width=400 height=200 /><br></c:if>
<hr>

<ul>
 <c:forEach items="${comment }" var="comment">
 	<li>
        <div>
            <p>${comment.memberid } / <fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd" /> <c:if test="${ sessionScope.sessId == comment.memberid || sessionScope.isAdmin == true}"><a onclick="return confirm('댓글을 삭제하시겠습니까?')" href="/comment/comment_delete?cnum=${comment.cnum }&bnum=${view.bnum }&btype=${param.btype}">삭제하기</a></c:if></p>
            <p>${comment.content }</p>
        </div>
    </li>
 </c:forEach>
</ul>
<input type="button" value="닫기" onclick="closeButton()">
<script>
	function closeButton() {
		close();
	}
</script>
</body>
</html>