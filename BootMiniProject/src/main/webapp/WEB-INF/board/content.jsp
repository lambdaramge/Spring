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
<input type="hidden" name="currentPage" value="${currentPage }">
<table class="table" style="width: 600px;">
<tr>
<td>
  <h3>${dto.subject }</h3>
  <span style="color: gray; float: right; font-size: 14px;" >
  <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> | 조회수 ${dto.readcount }
  </span>
  
  <span>작성자: ${dto.name }(${dto.myid })</span>
</td>
</tr>

<tr>
<td>
  <c:if test="${dto.uploadfile!='no' }">
  
  <span style="float:right; ">
  <a href="download?clip=${dto.uploadfile }">
  <span class="glyphicon glyphicon-download-alt"></span>
  
  <b>${dto.uploadfile }</b>
  </a>  
  </span>

  </c:if>
</td>
</tr>

<tr>
<td>
  <c:if test="${bupload==true }">
  <img src="/photo/${dto.uploadfile }" style="max-width: 400px;">
  </c:if>
  <br>
  
  <pre style="background-color: #fff; border: 0px;">
  ${dto.content }
  </pre>
  <br>
  
</td>
</tr>

<tr>
<td>
  <!-- 글쓰기는 로그인 중일때만 -->
  <c:if test="${sessionScope.loginok!=null }">
    <button type="button" class="btn btn-default" onclick="location.href='form'">글쓰기</button>
  </c:if>
  
  <button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'">리스트</button>
    
  <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
    <button type="button" class="btn btn-default" onclick="location.href='modifyform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
    <button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
  </c:if>
</td>
</tr>
</table>

</body>
</html>