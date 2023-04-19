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
<h3>총 ${totalCount }개</h3>
<br>

<table class="table table-borderless">

<tr style="background-color: #ddd">
<td>번호</td>
<td>이름</td>
<td>아이디</td>
<td>전화</td>
<td>이메일</td>
<td>주소</td>
<td>
삭제<input type="checkbox" id="allcheck">
</td>
</tr>

<c:forEach var="dto" items="${list }" varStatus="i">
<tr>
<td>${i.count }</td>
<td>
<img src="../photo/${dto.photo }" style="width:20px;">&nbsp;
${dto.name }</td>
<td>${dto.id }</td>
<td>${dto.hp }</td>
<td>${dto.email }</td>
<td>${dto.addr }</td>
<td><input type="checkbox" class="eachcheck" num=${dto.num }></td>
</tr>
</c:forEach>

<tr>
<td colspan="7" align="right">
<button type="button" class="btn btn-danger" id="btnalldel">전체삭제</button>
</td>
</tr>
</table>

</body>

<script type="text/javascript">

$("#allcheck").click(function(){
	$(".eachcheck").prop("checked",true);
	
	$("input:checkbox[id='eachcheck']")
})

</script>

</html>