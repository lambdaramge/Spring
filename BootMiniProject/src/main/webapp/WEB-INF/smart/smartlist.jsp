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

<h4 class="alert alert-info">${totalCount }개의 상품이 등록되었습니다.</h4>

<button type="button" onclick="location.href='form'">상품추가</button>

<table class="table table-bordered">
<tr>
<td>번호</td>
<td>상품명</td>
<td>색상</td>
<td>가격</td>
<td>입고일</td>
</tr>
<c:forEach var="dto" items="${list }">
<tr>
<td>${no }</td>
<c:set var="no" value="${no-1 }"/>
<td><a href='detail?num=${dto.num}&currentPage=${currentPage}'>${dto.sangname }</a></td>
<td>${dto.color }<div style="width: 10px; height:10px;border-radius:100%; background-color: ${dto.color};" ></div></td>
<td>${dto.price }</td>
<td>${dto.ipgoday }</td>
</tr>
</c:forEach>
</table>

<c:if test="${totalCount>0 }">
         <div style="width: 800px; text-align: center;" class="container">
            <ul class="pagination"> 
            
               <!-- 이전 -->
               <c:if test="${startPage>1 }">
               <li>
               <a href="list?currentPage=${startPage-1 }">이전</a>
               </li>
               </c:if>
               
               <c:forEach var="pp" begin="${startPage }" end="${endPage }">
                  <c:if test="${pp==currentPage }">
                  <li class="active">
                  <a href="list?currentPage=${pp }">${pp }</a>
                  </li>
                  </c:if>
                  
                  <c:if test="${currentPage!=pp }">
                  <li>
                  <a href="list?currentPage=${pp }">${pp }</a>
                  </li>
                  </c:if>
               </c:forEach>
               
               <!-- 다음  -->
               <c:if test="${endPage<totalPage }">
               <li>
               <a href="list?currentPage=${endPage+1 }">다음</a>
               </li>
               </c:if>
            
            </ul>
         
         </div>
      
      </c:if>
​
</body>
</html>