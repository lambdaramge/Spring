<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style type="text/css">
* {
	font-family: Gamja Flower;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 500px;
	height: 100px;
	border: 1px solid black;
	width: 800px;
}

div.layout div.menu {
	position: absolute;
	top: 350px;
	left: 150px;
	height: 100px;
}

div.layout div.main {
	position: absolute;
	top: 300px;
	left: 200px;
	height: 400px;
	width: 800px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title2" />
		</div>

		<div class="menu">
			<tiles:insertAttribute name="menu2" />
		</div>

		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>