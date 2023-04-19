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

	<c:forEach var="dto" items="${list }">
	<table class="table" style="width:300px;">
	<tr>
	<td rowspan="7 " align="center">
	
	<img src="../photo/${dto.photo}" style="width:200px;">
	<input type="file" id="newphoto" style="display: none;" num=${dto.num }> <!-- 사진 수정시 호출 -->
	<button type="button" onclick="location.href="" id="btnnewphoto">사진수정</button>
	
	</td>
	</tr>
	<tr>
	<td>${dto.name }</td>
	</tr>
	<tr>
	<td>${dto.id }</td>
	</tr>
	<tr>
	<td>${dto.email }</td>
	</tr>
	<tr>
	<td>${dto.hp }</td>
	</tr>
	<tr>
	<td>${dto.addr }</td>
	</tr>
	<tr>
	<td>
	<button type="button" onclick="location.href=''">수정</button>
	<button type="button" onclick="location.href=''">삭제</button>
	</td>
	</tr>
	</table>
	</c:forEach>
</body>
</html>