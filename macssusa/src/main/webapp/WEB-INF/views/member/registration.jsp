<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td><input type="text" class="form-control" id="id" name="id"></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control" id="password" placeholder="Enter your password" name="password"></td>
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
$("#send").click(function() {
	$("#frm").submit();
})

</script>

</body>
</html>