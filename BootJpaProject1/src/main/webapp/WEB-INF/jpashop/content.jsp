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
	상세페이지
	<table class="table table-borderless" style="width: 400px;">
	<tr>
	<td rowspan="4">
	<img src="/photo/${dto.photo }" style="width: 200px; height: 200px;">
	</td>
	<td>상품명 | ${dto.sangpum }</td>
	</tr>
	<tr>
	<td>가격 |  <fmt:formatNumber value="${dto.price }" /></td>
	</tr>
	<tr>
	<td>입고일 | ${dto.ipgoday }</td>
	</tr>
	<tr>
	<td>등록일 | <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> </td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
	<button type="button" onclick="del()">삭제</button>
	<button type="button" onclick="location.href='list'">목록</button>
	</td>
	</tr>
	
	</table>
	
	<script type="text/javascript">
	
	function del(){
		
		var a=confirm("삭제?");
		
		if(a){
			location.href='delete?num=${dto.num}'
			alert("삭제완료")			
		}else{
			return false;
		}
		
	}
	
	</script>
	
</body>
</html>