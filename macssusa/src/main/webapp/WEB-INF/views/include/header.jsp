<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="/">Logo</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
	  <c:choose>
	  	<c:when test="${empty sessionScope.sessId }">
	  		<li class="nav-item">
		      <a class="nav-link" href="/member/registration">회원가입</a>
		    </li>
		        <li class="nav-item">
		      <a class="nav-link" href="/member/login">로그인</a>
		    </li>
	  	</c:when>
	  	<c:otherwise>
		    <li class="nav-item">
		      <a class="nav-link" href="/member/memberUpdate">회원변경</a>
		    </li>
		        <li class="nav-item">
		      <a class="nav-link" href="/member/logout">로그아웃</a>
		    </li>
	  	</c:otherwise>
	  </c:choose>
  </ul>
<!-- 
  	<form style="position:fixed; right:25px;" class="form-inline" action="/action_page.php">
    	<input class="form-control mr-sm-2" type="text" placeholder="Search">
    	<button class="btn btn-success" type="submit">Search</button>
	</form>
-->
</nav>
</body>
</html>