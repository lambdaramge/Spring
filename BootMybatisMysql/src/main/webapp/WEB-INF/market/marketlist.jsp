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

	<button type="button" onclick="location.href='form'">입력</button>

	<c:if test="${totalCount==0}">
	<div class="alert alert-warning">
	<b>저장된 상품정보가 없습니다.</b>
	</div>
	</c:if>
	
	<c:if test="${totalCount!=0}">
	<div class="alert alert-warning">
	<b>총 ${totalCount}개의 상품이 있습니다.</b>
	</div>
	
	<br>

	<c:forEach var="dto" items="${list }" varStatus="i">
	
	<table class="table table-bordered" style="width: 300px;">
	<tr>
	<td rowspan="4" width="110">
	
	<c:if test="${dto.photoname!=null }"><img src="/upload/${dto.photoname }" style="width:100px;"> </c:if>
	<c:if test="${dto.photoname==null }"><img src="/upload/No_Image_Available.jpg" style="width:100px;"></c:if>
	
	</td>
	</tr>
	<tr>
	<td>상품명 : ${dto.sang }</td>
	</tr>
	<tr>
	<td><fmt:formatNumber value="${dto.dan }" type="currency"/></td>
	</tr>
	<tr>
	<td><fmt:formatDate value="${dto.ipgo }" pattern="yyyy-MM-dd"/> </td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<button type="button" onclick="location.href='detail?num=${dto.num}'">수정</button>
	<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	</td>
	</tr>
	</table>
	
	</c:forEach>
	
	</c:if>

</body>
</html>