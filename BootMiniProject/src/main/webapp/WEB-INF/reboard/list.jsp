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

<div class="searcharea" style="width: 800px; margin: 10px 100px;">
<!-- 검색창 -->
<form action="list" method="get">
	<div class="form-inline">
		<select class="form-control" style="width: 150px;" name="searchcolumn">
		  <option value="subject">제목</option>
		  <option value="name">작성자</option>
		  <option value="content">내용</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<input type="text" name="searchword" class="form-control" style="width: 200px;" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
	</div>
</form>
</div>

 <div style="margin: 30px 30px;">
   	총 ${totalCount }개의 글이 있습니다.
   	
   	<table class="table table-bordered" style="width: 800px; margin: 10px 100px;">
   		<caption>Spring 게시판 <span style="float: right;"><button type="button"
   		onclick="location.href='write'">글쓰기</button></span></caption>
   		
   		<tr bgcolor="#ddd" align="center">
   		  <td width="60">번호</td>
   		  <td width="360">제목</td>
   		  <td width="120">작성자</td>
   		  <td width="160">작성일</td>
   		  <td width="100">조회수</td>
   		</tr>
   		
   		<c:if test="${totalCount==0 }">
   		<tr>
   		  <td colspan="5" align="center"><b>등록된 게시글이 없습니다.</b></td>
   		</tr>
   		</c:if>
   		
   		<c:if test="${totalCount>0 }">
   		<c:forEach var="dto" items="${list }">
   		
   		<tr>
   		  <td align="center">${no }</td>
   		    <c:set var="no" value="${no-1 }" /> <!-- 출력후 감소 -->
   		    
   		  <td>
	   		  <!-- 제목, relevel만큼 공백 -->
	   		  <c:forEach begin="1" end="${dto.relevel }">
	   		    &nbsp;&nbsp; <!-- 2칸 ..원글이면 0이므로 안돈다 -->
	   		  </c:forEach>
	   		  
	   		  <!-- 답글이면 re이미지 출력 / restep도 됨 -->
	   		  <c:if test="${dto.relevel>0 }">
	   		    <img src="../photo/re.png">
	   		  </c:if>
   		  	  
   		  	  <!-- 제목..여기 통해서 내용보기로 -->
   		  	  <a href="content?num=${dto.num }&currentPage=${currentPage}" style="color: black;">
   		  	  ${dto.subject }</a>
   		  	  
   		  	  <!-- 이미지 있을 경우 아이콘 표시 -->
   		  	  <c:if test="${dto.photo!='no' }">
   		  	  <span class="glyphicon glyphicon-picture"></span>
   		  	  </c:if>
   		  </td>
   		  <td align="center">${dto.name }</td>
   		  <td align="center"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> </td>
   		  <td align="center">${dto.readcount }</td>
   		</tr>
   		</c:forEach>
   		</c:if>
   		
     	</table>
   		
   		<!-- 페이징 처리 -->
   		<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
					<a href="list?currentPage=${endPage+1}">다음</a>
				</li>
			</c:if>
		</ul>
		</div>
   		</c:if>

   	
   </div>
</body>
</html>