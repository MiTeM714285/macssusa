<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입</h2>
<form action="registration" method="post" id="frm">
	<table>
	 <tbody>
		<tr>
			<td><input type="text" class="form-control" id="id" name="id" readonly="readonly"></td>
			<td><button type="button" id="idcheckBtn">ID 등록하기</button></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control" id="password" placeholder="Enter your password" name="password"></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control" id="passwordCheck" placeholder="패스워드 재입력" name="passwordCheck"></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" id="nickname" placeholder="Enter your nickname" name="nickname"></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" id="email" placeholder="Enter your email" name="email"></td>
		</tr>
	 </tbody>
	</table>
</form>
<button type="button" id="send" class="btn btn-primary">가입</button>

<script>
$("#idcheckBtn").on("click",function() {
	window.open("idCheck","","width=700 height=250");
});

$("#send").click(function() { // 이름을 submit으로 할시 충돌문제로 다른이름지정
	if($("#id").val()=="") {
		alert("아이디를 입력하세요");
		return false;
	}
	if($("#password").val()=="") {
		alert("비밀번호를 입력하세요");
		return false;
	}
	if($("#password").val()!=$("#passwordCheck").val()) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
	$("#frm").submit();
})

</script>

</body>
</html>