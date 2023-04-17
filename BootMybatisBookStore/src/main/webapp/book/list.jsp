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

	<button type="button" onclick="location.href='write'">글쓰기</button>
	
	<c:if test="${tot==0}">
	<h4>등록된 도서가 없습니다.</h4>
	</c:if>
	
	<c:if test="${tot!=0}">
	<h4>${tot}권의 책이 있습니다.</h4>
	
	
	
	<c:forEach var="dto" items="${list }" varStatus="i">
	
	<div>
		<img src="../imagefile/${dto.bookphoto }" style="width: 100px;"><br>
		이름 ${dto.bookname } <br>
		작가 ${dto.bookwriter } <br>
		출판 ${dto.bookcompany } <br>
		가격 ${dto.bookprice} <br>
		입고 ${dto.ipgoday }
	
	<br><br>
	</div>
	
	</c:forEach>
	
	
	</c:if>
</body>
</html>