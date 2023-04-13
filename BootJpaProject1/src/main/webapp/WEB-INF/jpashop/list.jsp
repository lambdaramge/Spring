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

	<button type="button" onclick="location.href='add'">등록</button>

	<table class="table table-bordered" style="width: 600px;">
	<tr>
	<td>번호</td>
	<td>상품명</td>
	<td>가격</td>
	<td>입고일</td>
	<td>작성일</td>
	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
	<tr>
	<td>${i.count }</td>
	<td><a href="content?num=${dto.num }">${dto.sangpum } <img src="/photo/${dto.photo }" style="width: 30px;"></a></td>
	<td><fmt:formatNumber value="${dto.price }"/></td>
	<td>${dto.ipgoday }</td>
	<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> </td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>