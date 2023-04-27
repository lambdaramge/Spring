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

	ul.menu{
		list-style: none;
	}
	
	ul.menu li{
		width: 120px;
		float: left;
		height: 60px;
		line-height: 60px;
		margin-right: 10px;
		text-align: center;
		font-size: 25px;
		background-color: #fdc;
		cursor: pointer;
	}
	
	li>a{
		color: black;
		text-decoration: none;
	}

</style>

<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<ul class="menu">
		<li>
		  <a href="${root }">home</a>
		</li>
		<li>
		  <a href="${root }/ipgo/form">상품등록</a>
		</li>
		<li>
		  <a href="${root }/ipgo/list">상품목록</a>
		</li>
		<li>
		  <a href="${root }/board/list">게시판</a>
		</li>
		<li>
		  <a href="${root }/smart/list">스마트게시판</a>
		</li>
		<li>
		  <a href="${root }/reboard/list">답변형게시판</a>
		</li>
		<c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
		<li>
		  <a href="${root }/member/list">회원목록</a>
		</li>
		</c:if>
		<li>
		  <a href="${root }/login/main">로그인</a>
		</li>
		<li>
		  <a href="${root }/member/form">회원가입</a>
		</li>
		<c:if test="${sessionScope.loginok!=null}">
		<li>
		  <a href="${root }/member/myinfo">나의정보</a>
		</li>
		</c:if>
		<li>
		  <a href="${root }/road/map">오시는길</a>
		</li>
	</ul>

</body>
</html>