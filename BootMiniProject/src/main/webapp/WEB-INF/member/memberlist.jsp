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

<c:set var="root" value="<%=request.getContextPath() %>"/>

<h3>총 ${totalCount }개</h3>
<br>

<table class="table table-borderless">

<tr style="background-color: #ddd">
<td>번호</td>
<td>이름</td>
<td>아이디</td>
<td>전화</td>
<td>이메일</td>
<td>주소</td>
<td>
<input type="checkbox" id="alldelcheck">
</td>
</tr>

<c:forEach var="dto" items="${list }" varStatus="i">
<tr>
<td>${i.count }</td>
<td>
<img src="../photo/${dto.photo }" style="width:20px;">&nbsp;
${dto.name }</td>
<td>${dto.id }</td>
<td>${dto.hp }</td>
<td>${dto.email }</td>
<td>${dto.addr }</td>
<td><input type="checkbox" class="eachcheck" num=${dto.num }></td>
</tr>
</c:forEach>

<tr>
<td colspan="7" align="right">
<button type="button" class="btn btn-danger" id="btnalldel">전체삭제</button>
</td>
</tr>
</table>

</body>

<script>
    	//전체체크클릭시 체크값 얻어서 모든 체크값에 전달
    	$("#alldelcheck").click(function(){
    		
    		var chk=$(this).is(":checked");
    		//console.log(chk);
    		//chk의 checked 속성을 prop을 통해 다른 체크들에 전달
    		$(".eachcheck").prop("checked",chk);
    	})
    	
    	//삭제버튼 클릭시 삭제
    	$("#btnalldel").click(function(){
    		//체크된 길이
    		var len=$(".eachcheck:checked").length;
    		//alert(len);
    		
    		if(len==0){
    			alert("최소 한 개 이상의 글을 선택해주세요.");
    			return;
    		}else{
    			var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요.");
    			
    			if(a){

    				$(".eachcheck:checked").each(function(i,ele){
	    				num=$(this).attr("num");
    				
    				$.ajax({
    					type:"get",
    					url:"/member/delete",
    					data:{"num":num},
    					dataType:"html",
    					success:function(res){
    						location.reload();
    					}
    					
    				})
    				})
	    			
    			}
    		}
    		
    	})
    	
    </script>

</html>