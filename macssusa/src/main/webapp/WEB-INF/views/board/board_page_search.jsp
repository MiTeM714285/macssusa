<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.btype == 1 }">
		<h2>맥 리뷰 임시게시판</h2>
	</c:when>
	<c:when test="${param.btype == 2 }">
		<h2>주변기기 리뷰 임시게시판</h2>
	</c:when>
	<c:when test="${param.btype == 3 }">
		<h2>맥 질문 임시게시판</h2>
	</c:when>
	<c:otherwise>
		<h2>주변기기 질문 임시게시판</h2>
	</c:otherwise>
</c:choose>
<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 <tbody>
	<c:forEach items="${list}" var="list">
	 <tr>
	  <td>${list.bnum}</td>
	  <td><a href="/board/board_view?bnum=${list.bnum}&btype=${list.btype}">${list.title}</a><c:if test="${list.replycnt != 0}">[${list.replycnt}]</c:if></td>
	  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
	  <td>${list.memberid}</td>
	  <td>${list.hitcount}</td>
	 </tr>
	</c:forEach>
 </tbody>
</table>
<!-- 페이지 -->
<div>
	<c:if test="${page.prev}">
 		<span>[ <a href="/board/board_page_search?num=${page.startPageNum - 1}&btype=${param.btype}${page.searchTypeKeyword}">이전</a>]</span>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
			<c:choose>
				<c:when test="${selected != num}">
					<a href="/board/board_page_search?num=${num}&btype=${param.btype}${page.searchTypeKeyword}">${num}</a>
				</c:when>
				<c:otherwise>
					<b>${num}</b>
				</c:otherwise>
			</c:choose>
		</span>
	</c:forEach>
	<c:if test="${page.next}">
	 	<span>[ <a href="/board/board_page_search?num=${page.endPageNum + 1}&btype=${param.btype}${page.searchTypeKeyword}">다음</a>]</span>
	</c:if>
</div>
<!-- 검색 -->
<div>
	<select name="searchType">
		<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
		<option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
		<option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
		<option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
	</select>
 
	<input type="text" name="keyword" value="${page.keyword}"/>
	<button type="button" id="searchBtn">검색</button>
</div>

<c:if test="${!empty sessionScope.sessId }">
	<a href="/board/board_write?btype=${param.btype}">게시글작성</a>
</c:if>

<script>
// url의 파라미터를 추출하는 함수
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
// 검색 버튼 눌렀을때 함수
 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  let num = getParameterByName('num');
  let btype = getParameterByName('btype');

  console.log(searchType);
  console.log(keyword);
  console.log(num);
  console.log(btype);
  location.href = "/board/board_page_search?num="+ num + "&btype=" + btype + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>

</body>
</html>