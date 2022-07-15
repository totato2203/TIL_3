<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
   td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<%-- cdn(content delivery network) 방식 :
	해당 javascript lib를 network 상 로딩하여 사용하는 방식
	반드시 online 인터넷이 되는 상황에서 가능하다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>
	
<%-- 해당 lib를 다운 받아서 처리하는 방식
<script src="${path }/a00_com/jquery-3.6.0.js"
	type="text/javascript"></script> --%>
<script type="text/javascript">
	// $ : jquery
	// $(document) : DOM 객체(tag를 객체화하여 사용)에 대한 선언
	// $(document).ready(익명함수);
	// html 화면이 전체 로딩되어 태그 등 DOM 객체를 인식할 수 있는 상황이 되었을 때
	// 처리할 코드를 익명함수를 적용하여 처리한다.
	$(document).ready(function(){
      <%-- 
      
      --%>
      $("h2").css('color', "blue").text("안녕하세요 jquery 시작")
      
      // $("선택").이벤트명(익명함수) : 해당 이벤트가 수행되었을 때
      // 처리할 이벤트 핸들러 함수
      var cnt = 1;
      // h2를 클릭한다면 처리할 내용 기술
      // 1. $("선택자").이벤트(익명함수)
      // 2. $("선택자").이벤트(정의된 함수)
      $("h1").click(function(){
    	  // $(this) : 이벤트가 처리된 해당 객체
    	  // h2 한 개
    	  // h2 여러 개
    	  // h2 여러 개 : 이벤트로 클릭한 h2
    	  // h2 여러 개
    	  $(this).css("color", "pink");
    	  // h2{속성:속성값; 속성2:속성2값}
    	  // 1) css("속성", "속성값")
    	  // 2) css({"속성":"속성값", "속성2":"속성2값"})
    	  
    	  $('h1').text("카운트 : " + (cnt++));
      });
      // ex) h3을 클릭 시 h4가 100부터 카운트 다운되게 처리하세요.
		var cnt02 = 100;
		$("h3").click(function(){
				$('h4').text(cnt02--);
		});
		// $("태그[속성=속성값]")
		// $("input[name=num01]").val("저장")
		// $("input[name=num01]").val() : 호출
		$("#btn01").click(function(){
			alert("번호1 : " + $("[name=num01]").val());
			var num01Val = $("[name=num01]").val();
			// Number(), parseInt() 숫자형으로 변환
			// js의 모든 입력된 데이터는 문자열형이다.
			// 따라서 "문자열1" + "문자열2" ==> "문자열1문자열2"
				// "34" + "12" ==> "3412"
			// 숫자형일 때, 숫자로 변경해서 처리해야 한다. (+ 연산자)
			// 나머지 연산자(-, *, /) 는 자동형변환 해서 숫자로 처리된다.
			var num01 = Number(num01Val);
			num01 += 2
			 $("[name=num01]").val(num01)
			// cf) jquery의 대부분 데이터 할당 및 출력 메소드는
		 	// 호출도 하고 저장도 한다. val() - 호출, val("데이터") - 저장
		});

		 // ex) 버튼 btn02를 만들고, 클릭 시 마다 num02의 데이터를 세배수로 증가
		 $("#btn02").click(function(){
			 alert("번호2 : " + $("[name=num02]").val());
			 var num02 = $("[name=num02]").val();
			 num02 *= 3
			 $("[name=num02]").val(num02)
		 })
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
	<input type="button" id="btn01" value="짝수로 증가"/><br>
	<input type="button" id="btn02" value="세 배로 증가"/><br>
	번호1 : <input name="num01" size=1 value="0"/><br>
	번호2 : <input name="num02" size=1 value="1"/>
	


	<h3>클릭하세요</h3>
	<h4></h4>

  <h1>카운트 : </h1>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="10%">
      <col width="50%">
      <col width="15%">
      <col width="15%">
      <col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>   
    <tbody>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
   </table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="frm02" class="form"  method="post">
        <div class="row">
         <div class="col">
           <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="직책명 입력" name="job">
         </div>
        </div>
       </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>