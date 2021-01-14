<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">MACSSUSA</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">MAC 가이드</a></li>
      <li><a href="#">나에게 맞는 맥 찾기</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">맥 리뷰<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/board/board_page_search?num=1&btype=1">MAC 리뷰게시판</a></li>
          <li><a href="/board/board_page_search?num=1&btype=3">MAC 질문게시판</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">주변기기 리뷰<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/board/board_page_search?num=1&btype=2">주변기기 리뷰게시판</a></li>
          <li><a href="/board/board_page_search?num=1&btype=4">주변기기 질문게시판</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><c:if test="${!empty sessionScope.sessId }">${sessionScope.nickName } 님 </c:if><span class="glyphicon glyphicon-user"></span></a>
        <ul class="dropdown-menu">
			<c:choose>
				<c:when test="${empty sessionScope.sessId }">
				    <li><a href="/member/registration">회원가입</a></li>
          			<li><a href="/member/login">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/member/memberUpdate">회원변경</a></li>
					<c:if test="${sessionScope.isAdmin == true }">
          				<li><a href="/member/memberList">회원관리</a></li>
          				<li><a href="/board/deletedBoardList">삭제된 게시글 관리</a></li>
          				<li><a href="/board/deletedCommentList">삭제된 댓글 관리</a></li>
          			</c:if>
          			<li><a href="/member/logout">로그아웃</a></li>

				</c:otherwise>
          	</c:choose>
        </ul>
      </li>
    </ul>
  </div>
</nav>
</body>
</html>

