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
<script>
$(document).ready(function() {
	  var domEleArray1 = [$('#uploadFile1').clone()]; // 원본 복사
	  var domEleArray2 = [$('#uploadFile2').clone()]; // 원본 복사
	  var domEleArray3 = [$('#uploadFile3').clone()]; // 원본 복사
	  var domEleArray4 = [$('#uploadFile4').clone()]; // 원본 복사
	  var domEleArray5 = [$('#uploadFile5').clone()]; // 원본 복사
	  $('#btn_delAttach1').click(function() {
		  domEleArray1[1] = domEleArray1[0].clone(true); // 쌔거(0번) -> 복사(1번)
		   	$('#uploadFile1').replaceWith(domEleArray1[1]);
	  });
	  $('#btn_delAttach2').click(function() {
		  domEleArray2[1] = domEleArray2[0].clone(true); // 쌔거(0번) -> 복사(1번)
		    $('#uploadFile2').replaceWith(domEleArray2[1]);
		  });
	  $('#btn_delAttach3').click(function() {
		  domEleArray3[1] = domEleArray3[0].clone(true); // 쌔거(0번) -> 복사(1번)
		    $('#uploadFile3').replaceWith(domEleArray3[1]);
		  });
	  $('#btn_delAttach4').click(function() {
		  domEleArray4[1] = domEleArray4[0].clone(true); // 쌔거(0번) -> 복사(1번)
		    $('#uploadFile4').replaceWith(domEleArray4[1]);
		  });
	  $('#btn_delAttach5').click(function() {
		  domEleArray5[1] = domEleArray5[0].clone(true); // 쌔거(0번) -> 복사(1번)
		    $('#uploadFile5').replaceWith(domEleArray5[1]);
		  });
	});
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<form method="post" id = "frm" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 작성하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="100%"><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"/></td>
						</tr>
						<tr>
							<td colspan="100%"><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style=" resize: none;  height: 350px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="100%">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<thead>
									  <tr>
									   	<th style="background-color: #eeeeee; text-align: center;">이미지1</th>
										<th style="background-color: #eeeeee; text-align: center;">이미지2</th>
										<th style="background-color: #eeeeee; text-align: center;">이미지3</th>
										<th style="background-color: #eeeeee; text-align: center;">이미지4</th>
										<th style="background-color: #eeeeee; text-align: center;">이미지5</th>
									  </tr>
									 </thead>
									 <tbody>
										 <tr>
										 	<td><input type="file" accept=".jpg,.png,.bmp" id="uploadFile1" name="uploadFile1" style="width:205px;"><br></td>
										 	<td><input type="file" accept=".jpg,.png,.bmp" id="uploadFile2" name="uploadFile2" style="width:205px;"><br></td>
										 	<td><input type="file" accept=".jpg,.png,.bmp" id="uploadFile3" name="uploadFile3" style="width:205px;"><br></td>
										 	<td><input type="file" accept=".jpg,.png,.bmp" id="uploadFile4" name="uploadFile4" style="width:205px;"><br></td>
										 	<td><input type="file" accept=".jpg,.png,.bmp" id="uploadFile5" name="uploadFile5" style="width:205px;"><br></td>
										 </tr>
										 <tr>
										 	<td><button type="button" id="btn_delAttach1" class="btn btn-primary">첨부파일 삭제</button></td>	
										 	<td><button type="button" id="btn_delAttach2" class="btn btn-primary">첨부파일 삭제</button></td>	
										 	<td><button type="button" id="btn_delAttach3" class="btn btn-primary">첨부파일 삭제</button></td>
										 	<td><button type="button" id="btn_delAttach4" class="btn btn-primary">첨부파일 삭제</button></td>
										 	<td><button type="button" id="btn_delAttach5" class="btn btn-primary">첨부파일 삭제</button></td>
										 </tr>
									 </tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>	

				<input type="button" class="btn btn-primary pull-left" onclick="if(confirm('작성을 취소하시겠습니까? 작성중인 내용이 모두 사라집니다.'))location.href='/board/board_page_search?num=${param.num }&btype=${param.btype }';" value="뒤로"/>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>
		</div>
	</div>
</body>
</html>