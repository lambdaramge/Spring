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
	<form action="update" method="post">
	<table class="table table-bordered" style="width: 500px;">
	<input type="hidden" value="${dto.num }" name="num">
	<tr>
	<td>상품명</td><td><input type="text" name="sangpum" value="${dto.sangpum }"></td>
	</tr>
	<tr>
	<td>가격</td><td><input type="text" name="price" value="${dto.price }"></td>
	</tr>
	<tr>
	<td>사진</td>
	<td>
	<select name="photo">
	<option value="내가해냄.jpg" <c:if test="${dto.photo eq '내가해냄.jpg' }">selected="selected"</c:if>>내가해냄</option>
	<option value="둥둥.jpg" <c:if test="${dto.photo eq '둥둥.jpg' }">selected="selected"</c:if>>둥둥</option>
	<option value="빙고.jpg" <c:if test="${dto.photo eq '빙고.jpg' }">selected="selected"</c:if>>빙고</option>
	<option value="월요일.jpg" <c:if test="${dto.photo eq '월요일.jpg' }">selected="selected"</c:if>> 월요일</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>입고일</td><td><input type="text" name="ipgoday" value="${dto.ipgoday }"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<button type="submit">수정</button>
	</td>
	</tr>
	</table>
	</form>

</body>
</html>