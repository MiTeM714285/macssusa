<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p><a href="/board/board_macreview">맥리뷰 임시 게시판 가기</a>
<p><a href="/board/board_addonreview">주변기기 리뷰 임시 게시판 가기</a>
<p><a href="/board/board_macquestion">맥질문 임시 게시판 가기</a>
<p><a href="/board/board_addonquestion">주변기기 리뷰 임시 게시판 가기</a>

<p><a href="/member/registration">임시 회원가입 이동</a>
</body>
</html>
