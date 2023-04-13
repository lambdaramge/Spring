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
	<form action="insert" method="post">
	<table class="table table-bordered" style="width: 500px;">
	<tr>
	<td>상품명</td><td><input type="text" name="sangpum"></td>
	</tr>
	<tr>
	<td>가격</td><td><input type="text" name="price"></td>
	</tr>
	<tr>
	<td>사진</td>
	<td>
	<select name="photo">
	<option value="내가해냄.jpg">내가해냄</option>
	<option value="둥둥.jpg">둥둥</option>
	<option value="빙고.jpg">빙고</option>
	<option value="월요일.jpg">월요일</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>입고일</td><td><input type="text" name="ipgoday"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<button type="submit">저장</button>
	</td>
	</tr>
	</table>
	</form>

</body>
</html>