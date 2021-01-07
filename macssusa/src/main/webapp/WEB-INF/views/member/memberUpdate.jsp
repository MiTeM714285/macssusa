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
<h2>회원정보 수정</h2>
	<form method="post">
		<input type="hidden" class="form-control" id="id" name="id" value="${view.id }">
			<table>
			 <tbody>
				<tr>
					<td><input type="password" class="form-control" id="password" placeholder="비밀번호 수정" name="password" value="${view.password }"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" id="nickname" placeholder="닉네임 수정" name="nickname" value="${view.nickname }"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" id="email" placeholder="이메일 수정" name="email" value="${view.email }"></td>
				</tr>
			 </tbody>
			</table>
		<button type="submit">수정</button>
		<a onclick="return confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.')" href="/member/memberDelete">회원탈퇴</a>
		<a href="/">뒤로</a>
	</form>
</body>
</html>