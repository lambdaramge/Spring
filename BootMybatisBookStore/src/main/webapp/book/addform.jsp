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
	<form action="insert" method="post" enctype="multipart/form-data">
	
	<table class="table" style="width: 500px;">
	<!-- num bookname bookwriter bookcompany bookprice bookphoto ipgoday-->
	<tr>
	<td>제목</td><td><input type="text" name="bookname"></td>
	</tr>
	<tr>
	<td>작가</td><td><input type="text" name="bookwriter"></td>
	</tr>
	<tr>
	<td>출판사</td><td><input type="text" name="bookcompany"></td>
	</tr>
	<tr>
	<td>가격</td><td><input type="text" name="bookprice"></td>
	</tr>
	<tr>
	<td>사진</td><td><input type="file" multiple name="image"></td>
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