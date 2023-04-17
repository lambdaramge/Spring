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
	
	<form action="update" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 500px;">
		<caption><b>상품정보 수정</b></caption>
		<input type="hidden" name="num" value="${dto.num }">
		<tr>
		<td bgcolor="#dfd">상품명</td>
		<td><input type="text" name="sang" class="form-control" style="width: 200px;" required
		value="${dto.sang }"></td>
		</tr>
		<tr>
		<td bgcolor="#dfd">단가</td>
		<td><input type="text" name="dan" class="form-control" style="width: 200px;" required
		value="${dto.dan }"></td>
		</tr>
		<tr>
		<td bgcolor="#dfd">사진</td>
		<td>
		<input type="file" name="photo" class="form-control" style="width: 350px;">
		<c:if test="${dto.photoname!=null }">
		현재 저장된 사진 <a href="/upload/${dto.photoname }"><img src="/upload/${dto.photoname }" style="width:30px;"></a>
		</c:if>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='list'">목록</button>
		</td>
		</tr>
		
	</table>
	</form>
	
</body>
</html>