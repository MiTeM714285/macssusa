<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
</head>
<style>
body {
	background-color: #000000;
}
.main {
	width: 1000px;
	height: 600px;
	text-align: center;
}
.List {
	text-align: center;
}
th {
	text-align: center; /* 글자 가운데 정렬 */
	  font-weight: bold;
	  vertical-align: top;
	  color: #888888;
	  border-bottom: 2px solid #036;
}
td {
	width : 240px;
	padding: 5px;
	border-bottom: 1px solid #ccc;
    text-align: center; /* 글자 가운데 정렬 */
    vertical-align: top; /* 셀 안의 내용 세로 정렬 : top, middle, bottom */
    color: #888888;
}
</style>
<body>

<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://i.imgur.com/vcvYWXL.png" alt="1" style="width:100%;">
      </div>

      <div class="item">
        <img src="https://i.imgur.com/ZLoofQy.png" alt="2" style="width:100%;">
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<table class="main" style="margin-left: auto; margin-right: auto;">
<tr>
	<td>
		<div class="List">
		  <h3><a href="/board/board_page_search?num=1&btype=1">맥 리뷰게시판</a></h3> 
		  <table >
		    <thead>
		    <c:choose>
		    	<c:when test="${!empty macReviewList}">
			    	<tr>
				        <th>제목</th>
				        <th>작성일</th>
				    </tr>
		    	</c:when>
		    	<c:otherwise>
		    		<p>게시글이 존재하지 않습니다.</p>
		    	</c:otherwise>
		    </c:choose>
		    </thead>
		    <tbody>
		      <c:forEach items="${macReviewList}" var="macReviewList">
		      	<tr>
		      		<td><a href="/board/board_view?num=1&bnum=${macReviewList.bnum}&btype=${macReviewList.btype}">${macReviewList.title}</a></td>
		      		<td><fmt:formatDate value="${macReviewList.regdate}" pattern="yyyy-MM-dd" /></td>
		      	</tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</td>
	<td >
		<div class="List">
		  <h3><a href="/board/board_page_search?num=1&btype=3">맥 질문게시판</a></h3>      
		  <table >
		    <thead>
		    <c:choose>
		    	<c:when test="${!empty macQuestionList}">
			    	<tr>
				        <th>제목</th>
				        <th>작성일</th>
				    </tr>
		    	</c:when>
		    	<c:otherwise>
		    		<p>게시글이 존재하지 않습니다.</p>
		    	</c:otherwise>
		    </c:choose>
		    </thead>
		    <tbody>
		      <c:forEach items="${macQuestionList}" var="macQuestionList">
		      	<tr>
		      		<td><a href="/board/board_view?num=1&bnum=${macQuestionList.bnum}&btype=${macQuestionList.btype}">${macQuestionList.title}</a></td>
		      		<td><fmt:formatDate value="${macQuestionList.regdate}" pattern="yyyy-MM-dd" /></td>
		      	</tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</td>
</tr>
<tr>
	<td >
		<div class="List">
		  <h3><a href="/board/board_page_search?num=1&btype=2">주변기기 리뷰게시판</a></h3>       
		  <table >
		    <thead>
		    <c:choose>
		    	<c:when test="${!empty addonReviewList}">
			    	<tr>
				        <th>제목</th>
				        <th>작성일</th>
				    </tr>
		    	</c:when>
		    	<c:otherwise>
		    		<p>게시글이 존재하지 않습니다.</p>
		    	</c:otherwise>
		    </c:choose>
		    </thead>
		    <tbody>
		      <c:forEach items="${addonReviewList}" var="addonReviewList">
		      	<tr>
		      		<td><a href="/board/board_view?num=1&bnum=${addonReviewList.bnum}&btype=${addonReviewList.btype}">${addonReviewList.title}</a></td>
		      		<td><fmt:formatDate value="${addonReviewList.regdate}" pattern="yyyy-MM-dd" /></td>
		      	</tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</td>
	<td >
		<div class="List">
		  <h3><a href="/board/board_page_search?num=1&btype=4">주변기기 질문게시판</a></h3>         
		  <table >
		    <thead>
		    <c:choose>
		    	<c:when test="${!empty addonQuestioList}">
			    	<tr>
				        <th>제목</th>
				        <th>작성일</th>
				    </tr>
		    	</c:when>
		    	<c:otherwise>
		    		<p>게시글이 존재하지 않습니다.</p>
		    	</c:otherwise>
		    </c:choose>
		    </thead>
		    <tbody>
		      <c:forEach items="${addonQuestioList}" var="addonQuestioList">
		      	<tr>
		      		<td><a href="/board/board_view?num=1&bnum=${addonQuestioList.bnum}&btype=${addonQuestioList.btype}">${addonQuestioList.title}</a></td>
		      		<td><fmt:formatDate value="${addonQuestioList.regdate}" pattern="yyyy-MM-dd" /></td>
		      	</tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</td>
</tr>
</table>

</body>
</html>
