<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>

<style type="text/css">
* {
	font-family: Gamja Flower;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 200px;
	height: 100px;
	border: 1px solid black;
	width: 800px;
}

div.layout div.menu {
	position: absolute;
	top: 150px;
	left: 150px;
	height: 100px;
}

div.layout div.info {
	position: absolute;
	top: 250px;
	left: 30px;
	height: 200px;
}

div.layout div.main {
	position: absolute;
	top: 300px;
	left: 200px;
	height: 400px;
	width: 800px;
}
</style>
</head>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title" />
			<!-- definition에서 설정해줬던 name으로 가져오기 -->
		</div>

		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>

		<div class="info">
			<tiles:insertAttribute name="info" />
		</div>
		
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>