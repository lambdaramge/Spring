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

<style type="text/css">

.box{
	width: 40px;
	height: 40px;
	border-radius: 100%;
}

</style>

<title>Insert title here</title>
</head>
<body>

	<button type="button" onclick="location.href='carform'">차정보추가</button>
	<h3>총 ${tCount }대의 자동차 정보가 있습니다.</h3>
	
	<table class="table table-bordered" style="width: 800px;">
	<caption>자동차 목록</caption>
	<tr bgcolor="#ddd">
	<th width="60">번호</th>
	<th width="150">이름</th>
	<th width="100">가격</th>
	<th width="50">색상</th>
	<th width="100">구입일</th>
	<th width="130">등록일</th>
	<th width="100">편집</th>
	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
	<tr>
	<td>${i.count }</td>
	<td>${dto.carname }</td>
	<td>${dto.carprice }</td>
	<td><div class="box" style="background-color:${dto.carcolor}"></div></td>
	<td>${dto.carguip }</td>
	<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm"/></td>
	<td>
	<button type="button" class="btn btn-success btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
	<button type="button" class="btn btn-danger btn-xs" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>