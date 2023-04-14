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
	
	<div style="margin: 50px; 200px;">
		<form action="update" method="post" enctype="multipart/form-data">
			<table class="table table-border" style="width: 500px;">
				<caption><b>수정하기</b></caption>
				<input type="hidden" name="num" value="${dto.num }">
				
				<tr>
				<th width="120" bgcolor="lightgreen">작성자</th>
				<td>
				<input type="text" name="writer" required="required" class="form-control" style="width: 150px;"
				value="${dto.writer }">
				</td>
				</tr>
				
				<tr>
				<th width="120" bgcolor="lightgreen">제목</th>
				<td>
				<input type="text" name="subject" required="required" class="form-control" style="width: 150px;"
				value="${dto.subject }">
				</td>
				</tr>
				
				<tr>
				<th width="120" bgcolor="lightgreen">사진</th>
				<td>
				<input type="file" name="upload" class="form-control" style="width: 250px;"
				value="${dto.photo }">
				</td>
				</tr>
				
				<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;" name="content" required>${dto.content }</textarea>
				</td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<button type="submit">수정</button>
				<button type="button" onclick="location.href='list'">목록</button>
				</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>