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

	.day{
		color: gray;
		font-size: 14px;
		float: right;
	}
	
	.box{
		width: 30px;
		height: 30px;
		border: 1px solid gray;
		border-radius: 100px;
		float: right;
	}
	#btns{
		float: right;
	}

</style>


<title>Insert title here</title>
</head>
<body>
	<div style="width: 600px; margin: 100px; 100px;">
		<b style="font-size: 30px;">${dto.sangname }</b> <br>
		<span class="day">입고일: ${dto.ipgoday }</span>
		<br><br>
		<b>
			<fmt:formatNumber value="${dto.price}" type="currency"/>
		</b>
		<br>
		<b>${dto.color }</b>
		<div class="box" style="background-color: ${dto.color}"></div>
		<br><br>
		<hr>
		${dto.content }
		<br><br>
		
		<div id="btns">
		<button type="button" class="btn btn-danger" num="${dto.num}" id="btndel">삭제</button>
		<button type="button" class="btn btn-info" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
		</div>
	</div>
</body>

<script type="text/javascript">

$("img").attr("width","100");

$("#btndel").click(function(){
	var num=$(this).attr("num");
	alert(num);
})

</script>

</html>