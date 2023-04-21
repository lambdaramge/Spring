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
<!-- 로그인 성공시 세션 : myid, loginok : yes, saveok : yes -->

<div>
<form action="loginproc" method="post">
<table class="table table-bordered" style="width: 300px;">
<caption>회원로그인</caption>
<tr>
<td>
<input type="text" name="id" class="form-control" placeholder="아이디입력" 
required autofocus value="${sessionScope.saveok==null?"":sessionScope.myid }"></td>
</tr>
<tr>
<td><input type="password" name="pass" class="form-control" placeholder="비밀번호입력" required autofocus></td>
</tr>
<tr>
<td colspan="2"><input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked" }> 아이디저장
<button type="submit">회원로그인</button>
</td> &nbsp;
</tr>
</table>
</form>
</div>

</body>
</html>