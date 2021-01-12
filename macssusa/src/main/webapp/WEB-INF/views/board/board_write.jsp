<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>게시글 작성</title>
</head>
<body>
	<form method="post" id = "frm" enctype="multipart/form-data">
	
	<label>제목</label>
	<input type="text" name="title" /><br />
	
	<label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br />

	
	<label for="file">파일1</label><input type="file" id="uploadFile1" name="uploadFile1"><br>
	<label for="file">파일2</label><input type="file" id="uploadFile2" name="uploadFile2"><br>
	<label for="file">파일3</label><input type="file" id="uploadFile3" name="uploadFile3"><br>
	<label for="file">파일4</label><input type="file" id="uploadFile4" name="uploadFile4"><br>
	<label for="file">파일5</label><input type="file" id="uploadFile5" name="uploadFile5"><br>

	
	<button type="submit">작성</button>
	
	</form>
</body>
</html>