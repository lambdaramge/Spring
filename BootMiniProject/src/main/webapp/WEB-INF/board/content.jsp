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

	.day{
		color: gray;
		float: right;
		margin-right: 30px;
		font-size: 0.9em;
	}
	
	.amod, .adel{
		float: right;
		margin-right: 10px;
		cursor: pointer;
		font-size: 0.7em;
		color: gray;
	}

</style>


<script type="text/javascript">

	$(function(){
		
		$("#btnanswermod").hide(); 
		list();
		
		//num은 전역변수로 선언
		num=$("#num").val();
		loginok="${sessionScope.loginok}";
		myid="${sessionScope.myid}";
		
		//insert
		$("#btnansweradd").click(function(){

			var content=$("#content").val();
			
			if(content.trim().length==0){ //trim -> 공백도 삭제
				alert("댓글을 입력해주세요");
				return;
			}
			
			$.ajax({
			type:"post",
			url:"insertanswer",
			dataType:"text",
			data:{"num":num,"content":content},
			success:function(){
				alert("성공");
				list();
				
				//입력값지우기
				$("#content").val("");
			}
		})
		})
	})
	
	
	//사용자함수 list
	function list() {
		
		num=$("#num").val();

		$.ajax({
			type:"get",
			url:"alist",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				
				$(".acount").text(res.length);
				
				let s="";
				
				$.each(res,function(i,ele){
					s+="<b>"+ele.name+"</b>: "+"<span id='modcontent'>"+ele.content+"</span>";
					s+="<span class='day'>"+ele.writeday+"</span>";
					
					if(loginok=='yes' && myid==ele.myid){
						s+="<span class='glyphicon glyphicon-pencil amod' idx='"+ele.idx+"'></span>";
						s+="&nbsp;&nbsp;";
						s+="<span class='glyphicon glyphicon-trash adel' idx='"+ele.idx+"'></span>";
						s+="<br>";
					}
				
				})
				
				$(".alist").html(s);
				
			}
		})
	}
	
	//////////////삭제
	$(document).on("click",".adel",function(){
		
		var idx=$(this).attr("idx");
		//alert(idx);
		
		$.ajax({
			type:"get",
			url:"deleteanswer",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				alert("삭제성공!");
				list();
			}
		})
	})
	
	//////////////수정 불러오기
	$(document).on("click",".amod",function(){
		idx=$(this).attr("idx");

		$.ajax({
			type:"get",
			url:"getdata",
			dataType:"json",
			data:{"idx":idx},
			success:function(res){
				
				$("#content").val(res.content);
				$("#btnansweradd").hide(); 
				$("#btnanswermod").show(); 
			}
		})
		
	})
	
	///////////////업데이트
	$(document).on("click","#btnanswermod",function(){

		var content=$("#content").val();

		$.ajax({
			type:"post",
			url:"updateAnswer",
			dataType:"text",
			data:{"idx":idx,"content":content},
			success:function(){
				alert("수정완료");
				$("#content").val("");
				list();
			}
		})
	})
</script>

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

<!-- 댓글 -->
      <tr>
         <td>
         <b>조회: ${dto.readcount }</b>&nbsp;&nbsp;
         <b>댓글: <span class="acount"></span></b>
         
         <div class="alist"></div>
         
         <input type="hidden" id="num" value="${dto.num }">
         <c:if test="${sessionScope.loginok!=null }">
            <div class="form-inline">
               <input type="text" class="form-control" placeholder="댓글을 입력하세요" id="content">
               <button type="button" class="btn btn-info" style="width: 60px;" id="btnansweradd">등록</button>
               <button class="btn btn-info" style="width: 60px;" id="btnanswermod">수정</button>
            </div>
         </c:if>
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