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


	<table class="table" style="width:300px;">
	<c:if test="${sessionScope.loginok!=null }">
	<tr>
	<td rowspan="7 " align="center">
	<img src="../photo/${dto.photo}" style="width:200px;">
	<input type="file" id="newphoto" style="display: none;" num=${dto.num }> <!-- 사진 수정시 호출 -->
	<button type="button" id="btnnewphoto">사진수정</button>
	
	<script type="text/javascript">
	
	//trigger
	$("#btnnewphoto").click(function(){
		$("#newphoto").trigger("click");
	})
	
	$("#newphoto").change(function(){
		var num=$(this).attr("num");
		//alert(num);
		
		var form=new FormData();
		form.append("num",num);
		form.append("photo",$("#newphoto")[0].files[0]); //선택한 1개만 append한다는 뜻
		
		console.dir(form);
		
		$.ajax({
			type:"post",
			url:"updatephoto",
			dataType:"text",
			processData:false, /* 서버전달시 데이터가 query String형태로 전달되는데 파일전송의 경우 이를 하지 않아야 함 ->false */
			contentType:false, /* encType 기본이 application...www 형태라서 multipart/form-data로 변경 ->false */
			data:form,
			success:function(res){
				
				location.reload();
			}
		})
	})

	</script>
	
	
	
	
	</td>
	</tr>
	<tr>
	<td>${dto.name }</td>
	</tr>
	<tr>
	<td><span>${dto. id}</span></td>
	</tr>
	<tr>
	<td>${dto.email }</td>
	</tr>
	<tr>
	<td>${dto.hp }</td>
	</tr>
	<tr>
	<td>${dto.addr }</td>
	</tr>
	<tr>
	<td>
	<input type="hidden" id="num" num=${dto.num}>
	<button type="button" data-toggle="modal" data-target="#updateInfo">수정</button>
	<button type="button" onclick="del()">탈퇴</button>
	</td>
	</tr>
	</c:if>
	</table>
	
  <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="updateInfo" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원정보 수정</h4>
        
        <div class="modal-body">
        
    	<div id="info">내용</div>
          
        </div>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="updatebtn">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
  </div>
  
  <script type="text/javascript">
  
    //삭제
    function del(){
    	const answer=confirm("정말 탈퇴하시겠습니까?");
    	
    	if(answer){
    		location.href='deleteinfo?num=${dto.num}';
    	}else{
    		return false;
    	}
    }
    
    //수정폼 모달
  	$.ajax({
  		type:"get",
  		url:"getdata",
  		dataType:"json",
  		success:function(res){
  			
  			var s="이름: <input type='text' value="+res.name+" id='name'><br>";
  			s+="이메일: <input type='email' value="+res.email+" id='email'><br>";
  			s+="번호: <input type='text' value="+res.hp+" id='hp'><br>";
  			s+="주소: <input type='text' value="+res.addr+" id='addr'><br>";
  			s+="<input type='hidden' num="+res.num+">";
  			
  			$("#info").html(s);
  		}
  	})
  	
  	//수정 프로세스
  	$("#updatebtn").click(function(){
 		
  		var num=$("#num").attr("num");
  		var name=$("#name").val();
  		var email=$("#email").val();
  		var hp=$("#hp").val();
  		var addr=$("#addr").val();
  		
  		$.ajax({
  		type:"post",
  		url:"updatedata",
  		dataType:"html",
  		data:{"num":num,"name":name,"email":email,"hp":hp,"addr":addr},
  		success:function(res){
  			alert("수정완료");
  			location.reload();
  		}
  	})
  	
  	})
  
  </script>

</body>
</html>