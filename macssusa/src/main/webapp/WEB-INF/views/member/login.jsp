<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
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

<div class="container">
  <h2>LOGIN</h2>
  
  <form action="login" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
    </div>
    
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
    </div>
    
    <button type="button" id="loginBtn" name="loginBtn" class="btn btn-primary">Submit</button>
  </form>
</div>
<script>
$("#loginBtn").click(function() {
	if($("#id").val()==""){
		alert("아이디를 입력하세요");
		return false;
		}
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요");
		return false;
		}
	$.ajax({
		type:"post",
		url:"loginCheck",
		data:{"id":$("#id").val(),"password":$("#password").val()}
	})
	.done(function(resp) {
		if(resp=="success") { // 로그인 성공
			alert("환영합니다");
			location.href="/";
		} else if(resp=="fail") { // ID 불일치 -> 회원가입화면으로
			alert("회원이 아닙니다 회원가입 페이지로 안내합니다.");
			location.href="/member/join";
		} else { // ID 일치 비밀번호 불일치
			alert("아이디 또는 비밀번호가 틀립니다");
			$("#password").val("");
		}
	})
	.fail(function(error){
		alert("error : " + error)
	})
})
</script>
</body>
</html>