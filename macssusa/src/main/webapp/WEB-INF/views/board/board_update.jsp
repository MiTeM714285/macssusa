<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="row">
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" readonly="readonly" value="${view.memberid }"/><br />
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 작성하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="100%"><input type="text" class="form-control"  name="title" placeholder="글 제목" maxlength="50" value="${view.title }"/><br /></td>
					</tr>
					<tr>
						<td colspan="100%"><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style=" resize: none;  height: 350px;">${view.content }</textarea></td>
					</tr>
					<tr>
						<td><label for="file">파일1</label></td>
						<td>
							<c:choose>
								<c:when test="${empty view.filename1}">
									<input type="file" id="uploadFile1" name="uploadFile1"><br>
								</c:when>
								<c:otherwise>
									<div class="oldFileArea1">
										${view.filename1 }
										<span class="btnDelFile1">X</span>
									</div>
									<input type="hidden" id="uploadFile1" value="${view.filename1 }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><label for="file">파일2</label></td>
						<td>
							<c:choose>
								<c:when test="${empty view.filename2}">
									<input type="file" id="uploadFile2" name="uploadFile2"><br>
								</c:when>
								<c:otherwise>
									<div class="oldFileArea2">
										${view.filename2 }
										<span class="btnDelFile2">X</span>
									</div>
									<input type="hidden" id="uploadFile2" value="${view.filename2 }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><label for="file">파일3</label></td>
						<td>
							<c:choose>
								<c:when test="${empty view.filename3}">
									<input type="file" id="uploadFile3" name="uploadFile3"><br>
								</c:when>
								<c:otherwise>
									<div class="oldFileArea3">
										${view.filename3 }
										<span class="btnDelFile3">X</span>
									</div>
									<input type="hidden" id="uploadFile3" value="${view.filename3 }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><label for="file">파일4</label></td>
						<td>
							<c:choose>
								<c:when test="${empty view.filename4}">
									<input type="file" id="uploadFile4" name="uploadFile4"><br>
								</c:when>
								<c:otherwise>
									<div class="oldFileArea4">
										${view.filename4 }
										<span class="btnDelFile4">X</span>
									</div>
									<input type="hidden" id="uploadFile4" value="${view.filename4 }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><label for="file">파일5</label></td>
						<td>
							<c:choose>
								<c:when test="${empty view.filename5}">
									<input type="file" id="uploadFile5" name="uploadFile5"><br>
								</c:when>
								<c:otherwise>
									<div class="oldFileArea5">
										${view.filename5 }
										<span class="btnDelFile5">X</span>
									</div>
									<input type="hidden" id="uploadFile5" value="${view.filename5 }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			<button type="submit">완료</button>
			<a onclick="return confirm('수정을 취소하시겠습니까?')" href="/board/board_view?num=${param.num }&bnum=${param.bnum }&btype=${param.btype }">뒤로</a>
		</form>
	</div>
</div>
<script>
	$('span.btnDelFile1').click(function () {
		$(this).closest('div').next().prop('name','delFilename1');
		$(this).closest('td').prepend('<input type="file" id="uploadFile1" name="uploadFile1">');
		$(this).closest('div').remove();
	});
	$('span.btnDelFile2').click(function () {
		$(this).closest('div').next().prop('name','delFilename2');
		$(this).closest('td').prepend('<input type="file" id="uploadFile2" name="uploadFile2">');
		$(this).closest('div').remove();
	});
	$('span.btnDelFile3').click(function () {
		$(this).closest('div').next().prop('name','delFilename3');
		$(this).closest('td').prepend('<input type="file" id="uploadFile3" name="uploadFile3">');
		$(this).closest('div').remove();
	});
	$('span.btnDelFile4').click(function () {
		$(this).closest('div').next().prop('name','delFilename4');
		$(this).closest('td').prepend('<input type="file" id="uploadFile4" name="uploadFile4">');
		$(this).closest('div').remove();
	});
	$('span.btnDelFile5').click(function () {
		$(this).closest('div').next().prop('name','delFilename5');
		$(this).closest('td').prepend('<input type="file" id="uploadFile5" name="uploadFile5">');
		$(this).closest('div').remove();
	});
</script>
</body>
</html>