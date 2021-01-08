<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	  <form action="idCheck" method="post">
	  	<div class="row">
	      <label for="userid">ID:</label>
	      <input type="text" class="form-control" placeholder="Enter your ID" id="id" name="id">
	    </div>
	    <br>
	    <div class="row">
	      <button type="button" id="checkBtn" name="checkBtn" class="btn btn-primary">중복확인</button>
	    </div>
	  </form>

	</div>
<script>
$("#checkBtn").click(function(){
	if($("#id").val()==""){
		alert("아이디를 입력하세요");
		return false;
		}
	$.ajax({
		type:"post",
		url:"idCheck",
		data:{"id":$("#id").val()}
		})
		.done(function(resp) {
			if(resp=="success"){
				alert("사용가능한 ID입니다.")
				$(opener.document).find("#id").val($("#id").val()); // 입력했던 id 창에 그대로 넣기
				self.close();
			} else {
				alert("이미 사용중인 ID입니다. 다른 ID를 입력하세요")
				$("#id").val("");
			}
		})
		.fail(function(error){
			alert("error : " + error)
			
		})
	})
</script>
</body>
</html>