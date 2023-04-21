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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

#btn-info{
	margin: -50px; 200px;
}


</style>

<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<a href="${root}">
<img src="${root}/image/가보자고.jpg" style="width:100px;">
<b>spring boot + mybatis + tiles</b>
</a>

<div class="container">
  <!-- Trigger the modal with a button -->
  <c:if test="${sessionScope.loginok==null }">
  <button type="button" id="btn-login" class="btn btn-info" data-toggle="modal" data-target="#myModal">로그인</button>
  </c:if>
  <c:if test="${sessionScope.loginok=='yes' }">
  <button type="button" id="btn-logout" class="btn btn-info">로그아웃</button>
  </c:if>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인하기</h4>
        </div>
        <div class="modal-body">
			<table class="table table-bordered" style="width: 300px;">
			<tr>
			<td>
			<input type="text" id="loginid" class="form-control" placeholder="아이디입력" 
			required autofocus value="${sessionScope.saveok==null?"":sessionScope.myid }"></td>
			</tr>
			<tr>
			<td><input type="password" id="loginpass" class="form-control" placeholder="비밀번호입력" required autofocus></td>
			</tr>
			<tr>
			<td colspan="2">
			<button type="button" id="btnloginok">회원로그인</button>
			</td> &nbsp;
			</tr>
			</table>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<!-- login ajax -->
<script type="text/javascript">

	//로그인
	$("#btnloginok").click(function(){
		
		//id, pw 읽기
		var id= $("#loginid").val();
		var pass= $("#loginpass").val();
		var root='${root}';
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:root+"/member/login",
			data:{"id":id,"pass":pass},
			success:function(res){
				if(res.result=='fail'){
					alert("아이디나 비번이 맞지 않습니다.");
				}else{
					location.reload();
				}
			}
			
			})
		})
		
		//로그아웃
		$("#btn-logout").click(function(){
			var root='${root}';
			
		$.ajax({
			type:"get",
			url:root+"/member/logout",
			dataType:"text",
			success:function(res){
				location.reload();
			}
		})
		
		})
	
</script>

</body>
</html>