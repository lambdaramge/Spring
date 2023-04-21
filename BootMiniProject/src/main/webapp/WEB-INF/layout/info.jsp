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
<c:set var="root" value="<%=request.getContextPath() %>"/>

<c:if test="${sessionScope.loginok==null }">
	<img src="../image/No_Image_Available.jpg" style="width: 50px; border-radius: 50px;"><br>
</c:if>

<c:if test="${sessionScope.loginok!=null}">
	<img src="../photo/${sessionScope.loginphoto}" style="width: 100px; border-radius: 50px;"><br>
	${sessionScope.loginname}님 로그인중<br>
</c:if>
<span class="glyphicon glyphicon-envelope">email</span> &nbsp; sist@gmail.com<br>
<span class=""></span> &nbsp; 쌍용교육센터<br>
<a href="#">
	<img src="../image/월요일.jpg" style="width:20px;">인스타
</a>
<img alt="" src="../image/#" style="width: 200px;">
</body>
</html>