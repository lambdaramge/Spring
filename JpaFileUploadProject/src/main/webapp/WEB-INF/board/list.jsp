<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
	
	<div style="margin: 50px 50px;">
		<button type="button" onclick="location.href='writeform'">글쓰기</button><br>
		<h2 class="alert alert-info">총 ${totalCount }개의 게시글이 있습니다.</h2>
	
	<table class="table table-bordered" style="width: 500px;">
	<tr>
	<td>번호</td>
	<td>작성자</td>
	<td>제목</td>
	<td>작성일</td>
	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
	<tr>
	<td>${i.count}</td>
	<td>${dto.writer }</td>
	<td>
	<a href="detail?num=${dto.num }">
	${dto.subject }
	<c:if test="${dto.photo!='no' }"><span class="glyphicon glyphicon-picture" style="color: gray"></span></c:if>
	</a>
	</td>
	<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
	</c:forEach>
	</table>
	
	</div>
</body>
</html>