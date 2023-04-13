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
	   <h3 class="alert alert-info" style="width: 400px;">Mycar Form</h3>   
   <form action="update" method="post">
      <table class="table table-bordered" style="width: 400px;">
      <input type="hidden" value="${dto.num }" name="num">
      <caption>자동차 정보 수정</caption>
         <tr>
         <th width="100">자동차명</th>
            <td>
            <input type="text" name="carname" class="form-control" required value="${dto.carname}">
            </td>
         </tr>
         
         <tr>
         <th width="100">단가</th>
            <td>
            <input type="text" name="carprice" class="form-control" value="${dto.carprice }">
            </td>
         </tr>
         
         <tr>
         <th width="100">색상</th>
            <td>
            <input type="color" name="carcolor" class="form-control" value="${dto.carcolor }">
            </td>
         </tr>
         
         <tr>
         <th width="100">구입일</th>
            <td>
            <input type="date" name="carguip" class="form-control" value="${dto.carguip }">
            </td>
         </tr>
         
         <tr>
            <td colspan="2" align="center">
            <button type="submit" class="btn btn-info">수정</button>
            <button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
            </td>
         </tr>
      </table>
   
   </form>

</body>
</html>