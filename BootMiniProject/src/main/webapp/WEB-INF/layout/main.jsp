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

/* 오늘 하루 보지 않기 팝업 */
button {
  border: 0;
  background: none;
  cursor:pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 40px -6px #061626;
  top: 50px;
  left: 50px;
  display: none;

  &.on {
    display: block;
    background-color: #fff;
  }

  .img_wrap {
    width: 200px;
    height: 200px;
    display:flex;
    justify-content:center;
    align-items:center;
  }

  .btn_close {
    width: 32px;
    height: 32px;
    position: absolute;
    top: 17px;
    right: 17px;
    font-size: 0;
    border: 0;
    background: none;

    &::before {
      content: "";
      width: 2px;
      height: 32px;
      background-color: #333;
      position: absolute;
      top: 0;
      left: 15px;
      transform: rotate(45deg);
    }
    &::after {
      content: "";
      width: 32px;
      height: 2px;
      background-color: #333;
      position: absolute;
      top: 15px;
      left: 0;
      transform: rotate(45deg);
    }
  }

  .btn_today_close {
    width: 100%;
    height: 45px;
    background-color: #333;
    text-align: center;
    color: #fff;
    font-size: 14px;
    display: block;
    span {
      display: block;
      line-height: 40px;
      vertical-align: bottom;
      opacity: 0.8;
    }
  }
}

</style>

<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<h1>메인페이지</h1>

<div class="main_popup">
  <div class="layer_cont">
    <div class="img_wrap">
      팝업 콘텐츠
    </div>
    <div class="btn_wrap">
      <!-- 오늘 하루 보지 않기 --->
      <button class="btn_today_close"><span>오늘 하루 보지 않기</span></button>
      <!-- 그냥 닫기 --->
      <button class="btn_close">close</button>
    </div>
  </div>
</div>
</body>

<script type="text/javascript">

var toggleMainPopup = function() {
	  
	  /* 쿠키 제어 함수 정의 */
	  var handleCookie = {
	    // 쿠키 쓰기
	    // 이름, 값, 만료일
	    setCookie: function (name, val, exp) {
	      var date = new Date();
	      
	      // 만료 시간 구하기(exp를 ms단위로 변경)
	      date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
	      console.log(name + "=" + val + ";expires=" + date.toUTCString() + ";path=/");
	      
	      // 실제로 쿠키 작성하기
	      document.cookie = name + "=" + val + ";expires=" + date.toUTCString() + ";";
	    },
	    // 쿠키 읽어오기(정규식 이용해서 가져오기)
	    getCookie: function (name) {
	      var value = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
	      return value ? value[2] : null;
	    }
	  };
	  console.log(handleCookie.getCookie("today"));
	  
	  // 쿠키 읽고 화면 보이게
	  if (handleCookie.getCookie("today") == "y") {
	    $(".main_popup").removeClass("on");
	  } else {
	    $(".main_popup").addClass("on");
	  }

	  // 오늘하루 보지 않기 버튼
	  $(".main_popup").on("click", ".btn_today_close", function () {
	    handleCookie.setCookie("today", "y", 1);
	    $(this).parents(".main_popup.on").removeClass("on");
	  });

	  // 일반 버튼
	  $(".main_popup").on("click", ".btn_close", function () {
	    $(this).parents(".main_popup.on").removeClass("on");
	  });
	}

	$(function() {
	  toggleMainPopup();
	});

</script>

</html>