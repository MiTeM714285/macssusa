<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p><a href="/board/board?btype=1">맥 리뷰 임시 게시판 가기</a>
<p><a href="/board/board?btype=2">주변기기 리뷰 임시 게시판 가기</a>
<p><a href="/board/board?btype=3">맥 질문 임시 게시판 가기</a>
<p><a href="/board/board?btype=4">주변기기 질문 임시 게시판 가기</a>
</body>
</html>
