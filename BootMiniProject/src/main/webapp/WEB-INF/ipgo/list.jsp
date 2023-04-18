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
<div class="alert alert-info" style="width: 800px"> 
<b>${totalCount }개</b>
</div>

<table class="table table-bordered" style="width: 800px;">
<caption>
<span style="float: right;">
<button type="button" class="btn btn-default" onclick="location.href='form'">상품추가</button>
</span>
</caption>

<c:forEach var="dto" items="${list }">

<tr>
<td width="400" rowspan="4">
<c:if test="${dto.photoname!='no' }">
	<%-- <c:forTokens var="pp" items="${dto.photoname }" delims=",">
		<a href="../photo/${pp }">
		</a>
	</c:forTokens> --%>
  <img src="../photo/${dto.dimage }" style="width:100px;">
</c:if>
<c:if test="${dto.photoname=='no' }">
	<img src="/image/NO_Image_Available.jpg" style="width:100px;">
</c:if>	

</td>
</tr>
<tr>
<td>상품명: ${dto.sangpum }</td>
</tr>
<tr>
<td>단가: <fmt:formatNumber value="${dto.price }" type="currency"/> </td>
</tr>
<tr>
<td>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
<tr>
<td>
<button type="button" class="btn btn-info" onclick="location.href=''">수정</button>
<button type="button" class="btn btn-warning" onclick="location.href=''">삭제</button>
</td>
</tr>

</c:forEach>

</table>

</body>
</html>