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

#showimg{
	border: 1px solid black;
	width: 130px;
	height: 150px;
}

</style>

<script type="text/javascript">

//showimg에 미리보기
  function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) {
        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            $('#showimg').attr('src', e.target.result);
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
            //(아래 코드에서 읽어들인 dataURL형식)
        }                   
        reader.readAsDataURL(input.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    }
}

$(function(){
	//버튼클릭시 사진 불러오는 이벤트 추가
	$("#btnphoto").click(function(){
		$("#myphoto").trigger("click");
	})
	
	//아이디입력시 idsuccess값 지움
	$("#loginid").keydown(function(){
		$(".idsuccess").text("");
	})
	
	//중복체크 버튼 클릭시 id 체크
	$("#btnidcheck").click(function(){
		const id=$("#loginid").val();

		$.ajax({
			type:"get",
			url:"/member/idcheck",
			dataType:"json",
			data:{"id":id},
			success:function(res){
				if(res.count==0){
					$(".idsuccess").text("ok");
				}else{
					$(".idsuccess").text("fail");
				}
			}
		})
		
	})
	
	//비밀번호 체크
	$("#pass2").keyup(function(){
		var pass=$("#pass").val();
		var pass2=$("#pass2").val();
		
		if(pass==pass2){
			$(".passsuccess").text("ok");
		}else{
			$(".passsuccess").text("fail");
		}
		
	})
	
})
	function check(){
		//사진
		if($("#myphoto").val()==''){
			alert('사진을 넣어주세요.');
			return false;
		}
		
		//중복체크
		if($(".idsuccess").text()!='ok'){
			alert('아이디 중복체크를 해주세요.');
			return false;
		}
		
		//비밀번호
		if($(".passsuccess").text()!='ok'){
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		
	}

</script>

<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-info" onclick="location.href='list'">전체회원목록</button>

<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
<table class="table table-bordered" style="width: 600px;">
<caption><b>회원가입</b></caption>
	<tr>
	<td width="200" rowspan="4" align="center">
	<input type="file" id="myphoto" name="myphoto" style="display: none;" onchange="readURL(this);">
	<button type="button" id="btnphoto" class="btn btn-warning">사진선택</button>
		<br>
	<img id="showimg">
	</td>
	
	<td>
	    <div class="form-inline">
	    <input type="text" placeholder="아이디 입력" id="loginid" name="id" 
	    class="form-control" required>
	    
	    <button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>
	    &nbsp;<span class="idsuccess" style="width: 60px; color: green;"></span>
	    </div>
	</td>
	
	</tr>
	
	<tr>
	<td>
	<div class="form-inline">
	<input type="password" class="form-control" name="pass" id="pass" placeholder="숫자네자리">
	<input type="password" class="form-control" name="pass2" id="pass2" placeholder="숫자네자리">
	<span class="passsuccess" style="width: 60px; color: red; "></span>
	</div>
	
	</td>
	</tr>
	
	<tr>
	<td>
	<input type="text" name="name" class="form-control" style="width: 130px;" placeholder="이름을입력" required>
	</td>
	</tr>
	
	<tr>
	<td>
	<input type="email" name="email" class="form-control" style="width: 130px;" placeholder="email" required>
	</td>
	</tr>
	
	<tr>
	<td colspan="2">
	<div class="form-inline">
	<input type="text" name="hp" class="form-control" style="width: 130px;" placeholder="-없이 핸드폰 입력" required>
	<input type="text" name="addr" class="form-control" style="width: 300px;" placeholder="간단주소입력" required>
	</div>
	</td>
	</tr>
	
	
	<tr>
	<td colspan="2" align="center"><button type="submit">회원가입</button> </td>
	</tr>
</table>
</form>

</body>
</html>