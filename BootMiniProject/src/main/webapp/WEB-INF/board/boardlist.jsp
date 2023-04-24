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

<c:if test="${sessionScope.loginok!=null }">
<button type="button" onclick="location.href='form'">글쓰기</button>
</c:if>

<br><br>

<table class="table table-bordered" style="width: 1000px">
<tr bgcolor="#fdcfdc">
<th width="60">번호</th>
<th width="160">작성자</th>
<th width="460">제목</th>
<th width="60">조회</th>
<th width="160">등록일</th>
</tr>

<c:if test="${totalCount==0 }">
	<tr>
	<td colspan="5" align="center">
	<h3><b>등록된 게시글이 없습니다.</b></h3>
	</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${list }" varStatus="i">
<tr>
<td>${i.count }</td>
<td>${dto.name } ( ${dto.myid} )</td>
<td>
<a href="content?num=${dto.num }&currentPage=${currentPage}">
${dto.subject }
</a>
</td>
<td>${dto.readcount }</td>
<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> </td>
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