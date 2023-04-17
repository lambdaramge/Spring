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
	
	<table class="table table-bordered" style="width: 400px;">
	
	<tr>
	<td>
	<h2>${dto.subject }</h2> <br> 
	${dto.writer } | ${dto.writeday }
	</td>
	</tr>
	
	<tr>
	<td>
	<c:if test="${dto.photo!='no' }">
	<img style="max-width: 300px;" src="/save/${dto.photo }"><br>
	</c:if>
	${dto.content }
	</td>
	</tr>
	
	<tr>
	<td>
	<hr>
	<form action="answer/write" method="post">
	작성자<input type="text" name="writer" required> <br>
	내용<input type="text" name="content" required> 
	<button type="submit">작성</button>
	</form>
	</td>
	</tr>
	
	<tr align="right">
	<td><button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
	<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	<button type="button" onclick="location.href='list'">목록</button></td>
	</tr>
	
	</table>
	
	</div>
	
</body>
</html>