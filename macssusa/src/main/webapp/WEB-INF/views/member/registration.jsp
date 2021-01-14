<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
  table {
    width: 100%;
  }
  th, td {
    padding: 10px;
  }
</style>
<body>

<form action="memberUpdate" method="post" id="frm">
	<div class="container">
		<h2>회원가입</h2>
		<h4>모든 기입정보들은 필수사항입니다.</h4>
			<div class="form-group">
      			<table> 
      				<tr>
      					<td>
      						<div class="form-group">
      							<label for="id">ID (등록후 변경불가):</label>
      							<input type="text" class="form-control" id="id" name="id" readonly="readonly">
      						</div>
      					</td>
      					<td>
      						<button type="button" id="idcheckBtn" class="btn btn-primary">ID 등록하기</button>
      					</td>
      				<tr>
      			</table>
   			</div>
   				<table> 
      				<tr>
      					<td>
							<div class="form-group">
							     <label for="password">Password:</label>
							     <input type="password" class="form-control" id="password" placeholder="패스워드 입력" name="password">
							</div>
      					</td>
      					<td>
							<div class="form-group">
							     <label for="passwordCheck">Password 재입력:</label>
							     <input type="password" class="form-control" id="passwordCheck" placeholder="패스워드 재입력" name="passwordCheck">
							</div>
      					</td>
      				<tr>
      			</table>
   				<table> 
      				<tr>
      					<td>
							<div class="form-group">
								<label for="nickname">닉네임:</label>
								<input type="text" class="form-control" id="nickname" placeholder="닉네임 입력" name="nickname">
							</div>
      					</td>
      					<td>
							<div class="form-group">
								<label for="nickname">E-mail:</label>
								<input type="text" class="form-control" id="email" placeholder="이메일 입력" name="email">
							</div>
      					</td>
      				<tr>
      			</table>
			<input type="button" class="btn btn-primary pull-left" onclick="if(confirm('작성을 취소하시겠습니까? 작성중인 내용이 모두 사라집니다.'))location.href='/';" value="취소"/>
			<button type="button" id="send" class="btn btn-primary pull-right">가입</button>
	</div>
</form>



<script>
$("#idcheckBtn").on("click",function() {
	window.open("idCheck","","width=700 height=250");
});

$("#send").click(function() { // 이름을 submit으로 할시 충돌문제로 다른이름지정
	if($("#id").val()=="") {
		alert("아이디를 입력하세요. 'ID 등록하기' 버튼을 사용해주세요");
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
	if($("#nickname").val()=="") {
		alert("닉네임을 입력하세요");
		return false;
	}
	if($("#email").val()=="") {
		alert("이메일을 입력하세요");
		return false;
	}
	$("#frm").submit();
})

</script>

</body>
</html>