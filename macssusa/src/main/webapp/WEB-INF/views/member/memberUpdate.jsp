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
	<form action="memberUpdate" method="post" id="frm" >
		<div class="container">
		<h2>회원정보 수정</h2>
			<input type="hidden" class="form-control" id="id" name="id" value="${view.id }">
			<table> 
      				<tr>
      					<td>
							<div class="form-group">
							     <label for="password">Password:</label>
							     <input type="password" class="form-control" id="password" placeholder="비밀번호 수정" name="password" value="${view.password }">
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
								<input type="text" class="form-control" id="nickname" placeholder="닉네임 수정" name="nickname" value="${view.nickname }">
							</div>
      					</td>
      					<td>
							<div class="form-group">
								<label for="nickname">E-mail:</label>
								<input type="text" class="form-control" id="email" placeholder="이메일 수정" name="email" value="${view.email }">
							</div>
      					</td>
      				<tr>
      			</table>
      			<table>
      				<tr>
      					<td>
      						<input type="button" class="btn btn-primary pull-left" onclick="location.href='/';" value="취소"/>
      					</td>
      					<td>
      						<c:if test="${!empty sessionScope.sessId && sessionScope.isAdmin == false}">
      							<input type="button" class="btn btn-primary pull-right" onclick="if(confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.'))location.href='memberDelete';" value="회원탈퇴"/>
      						</c:if>
      						<button type="button" id="send" class="btn btn-primary pull-right">수정</button>
      					</td>
      				</tr>
      			</table>
		</div>
	</form>
	
<script>
$("#send").click(function() { // 이름을 submit으로 할시 충돌문제로 다른이름지정
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