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
	
	<table class="table table-bordered" style="margin: 100px 20px; width: 500px;">
		<caption><b>회원전용게시판</b></caption>
		<tr>
		<td width="120" bgcolor="#ddd">제목</td>
		<td>
		<input type="text" name="subject" class="form-control" required autofocus>
		</td>
		</tr>
		
		<tr>
		<td width="120" bgcolor="#ddd">업로드</td>
		<td>
		<input type="file" name="upload" class="form-control">
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
		<textarea name="content" style="width: 490px; height: 150px;" class="form-control" required></textarea>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
		<button type="submit" class="btn btn-default">등록</button>
		<button type="button" class="btn btn-default" onclick="location.href='list'">목록</button>
		</td>
		</tr>
	</table>
	
	</form>
</body>
</html>