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
<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${view.btype == 1 }">
					<h2>맥 리뷰게시판</h2>
				</c:when>
				<c:when test="${view.btype == 2 }">
					<h2>주변기기 리뷰게시판</h2>
				</c:when>
				<c:when test="${view.btype == 3 }">
					<h2>맥 질문게시판</h2>
				</c:when>
				<c:otherwise>
					<h2>주변기기 질문게시판</h2>
				</c:otherwise>
			</c:choose>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- <label>제목</label> -->
						<th colspan="100%" style="background-color: #eeeeee; text-align: center;">${view.title}</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<!-- <td><label>작성자</label><td> -->
					<td colspan="50%" align="left">작성자 : ${view.nickname[0]}</td>
					<td colspan="50%" align="right">작성일 : <fmt:formatDate value="${view.regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>	
				<tr>
					<!-- <label>내용</label> -->
					<td colspan="100%"><textarea name="content" readonly="readonly"  style="width: 100%; height: 350px; outline: none; resize: none; border: 0px solid #dddddd">${view.content}</textarea></td>
				</tr>
				<c:if test="${!empty view.filename1 || !empty view.filename2 || !empty view.filename3 || !empty view.filename4 || !empty view.filename5}">
					<tr>
						<td colspan="100%">
							<table class="table" style="text-align: center;">
								<tr>
									<td><c:if test="${!empty view.filename1 }"><a onclick="window.open(this.href,'_blank','width=640, height=480'); return false" href="/resources/img/${view.filename1 }"><img src="/resources/img/${view.filename1 }" width=200 height=120 /></a><br></c:if></td>
									<td><c:if test="${!empty view.filename2 }"><a onclick="window.open(this.href,'_blank','width=640, height=480'); return false" href="/resources/img/${view.filename2 }"><img src="/resources/img/${view.filename2 }" width=200 height=120 /></a><br></c:if></td>
									<td><c:if test="${!empty view.filename3 }"><a onclick="window.open(this.href,'_blank','width=640, height=480'); return false" href="/resources/img/${view.filename3 }"><img src="/resources/img/${view.filename3 }" width=200 height=120 /></a><br></c:if></td>
									<td><c:if test="${!empty view.filename4 }"><a onclick="window.open(this.href,'_blank','width=640, height=480'); return false" href="/resources/img/${view.filename4 }"><img src="/resources/img/${view.filename4 }" width=200 height=120 /></a><br></c:if></td>
									<td><c:if test="${!empty view.filename5 }"><a onclick="window.open(this.href,'_blank','width=640, height=480'); return false" href="/resources/img/${view.filename5 }"><img src="/resources/img/${view.filename5 }" width=200 height=120 /></a><br></c:if></td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
			<c:if test="${!empty sessionScope.sessId && sessionScope.sessId == view.memberid}">
				<input type="button" class="btn btn-primary" onclick="location.href='/board/board_update?num=${param.num }&bnum=${view.bnum }&btype=${param.btype}';" value="수정"/>
			</c:if>
			<c:if test="${!empty sessionScope.sessId && (sessionScope.sessId == view.memberid || sessionScope.isAdmin == true) }">
				<input type="button" class="btn btn-primary" onclick="if(confirm('게시글을 삭제하시겠습니까?'))location.href='/board/board_delete?bnum=${view.bnum }&btype=${param.btype}';" value="삭제"/>
			</c:if>
			<input type="button" class="btn btn-primary" onclick="location.href='/board/board_page_search?num=${param.num }&btype=${param.btype }';" value="목록으로"/>
		</div>
	</div>
<hr>
<div class="container">
	<h4>총 댓글수: ${view.replycnt }</h4>
	<ul>
	 <c:forEach items="${comment }" var="comment">
	 	<li>
	        <div>
	            <p>${comment.memberid } / <fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd" /> <c:if test="${ sessionScope.sessId == comment.memberid || sessionScope.isAdmin == true}"><a onclick="return confirm('댓글을 삭제하시겠습니까?')" href="/comment/comment_delete?num=${param.num}&cnum=${comment.cnum }&bnum=${view.bnum }&btype=${param.btype}">삭제하기</a></c:if></p>
	            <textarea rows="5" cols="50" style="width: 100%; height: 88px; resize: none; outline: none; border: 0px solid #dddddd" readonly="readonly" maxlength="512" name="content">${comment.content }</textarea>
	        </div>
	    </li>
	 </c:forEach>
	</ul>
</div>
<c:if test="${!empty sessionScope.sessId }">
<div>
    <form method="post" action="/comment/writeComment">
    	<div class="container">
	        <label for="commentContent">댓글 작성하기</label>
	        <textarea rows="5" cols="50" style="width: 100%; height: 88px; resize: none; outline: none; border: 1px solid #dddddd" maxlength="512" name="content"></textarea>
			<input type="hidden" name="num" value="${param.num }">
	        <input type="hidden" name="bnum" value="${view.bnum }">
	        <input type="hidden" name="btype" value="${param.btype }">
	        <button type="submit" class="btn btn-primary" >댓글 작성</button>
        </div>
    </form>
</div>
</c:if>
</body>
</html>