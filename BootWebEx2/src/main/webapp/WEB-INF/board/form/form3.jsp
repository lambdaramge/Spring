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
<h1>폼 데이터 map 읽기</h1>
	<form action="read3" method="post">
	<table class="table table-bordered" style="width: 300px;">
	<tr>
	  <th width="100">이름</th>
	  <td><input type="text" name="name" class="form-control"></td>
	</tr>
	<tr>
	  <th width="100">혈액형</th>
	  <td><input type="text" name="blood" class="form-control"></td>
	</tr>
	<tr>
	  <th width="100">핸드폰</th>
	  <td><input type="text" name="hp" class="form-control"></td>
	</tr>
	
	<tr>
	  <Td colspan="2" align="center"><button type="submit">저장</button></Td>
	</tr>
	</table>
	</form>
</body>
</html>