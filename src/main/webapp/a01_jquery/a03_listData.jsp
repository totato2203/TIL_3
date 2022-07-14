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
<script type="text/javascript">
   $(document).ready(function(){
      <%-- 
      
      --%>
      $("h1").click(function(){
    	  // 선택자에 의해 여러 개의 DOM을 한 번에 속성, 문자열 변경
    	  $("h2").css("color", "navy").text("문자열변경");
    	  // 개별적인 데이터는 .eq(index)로 특정한 내용에 대하여 지정하여 처리할 수 있다.
    	  $("h2").eq(2).attr("align", "left").text("선택된 h2");
    	  $("h2").eq(0).attr("align", "right").text("첫번째 h2").css("color", "red");
    	  $("h2").eq(-1).attr("align", "center").text("마지막 h2").css("color", "red");
    	  // :even, :odd	짝수 번째, 홀수 번째를 선택해서 처리 가능
    	  $("h2:even").css("background-color", "yellow")
    	  $("h2:odd").css("background-color", "blue")
      })
      // ex) 3X3 테이블을 만들고, 빙고게임 [빙고] 클릭 시
      //	해당 테이블의 특정 cell 배경색상이 빨간색으로 변경되게 하세요.
      //	var rIdx = parseInt(Math.random())
      $("[name=bingo]").click(function(){
    	  var rIdx = parseInt(Math.random() * 9)
    	  $("td").eq(rIdx).css("background-color", "red")
      })
      
      // $("다중요소객체").each(function(idx){$(this) : 포함된 단위 객체})
      $("td").each(function(idx){
    	  $(this).text(idx+1);
      })
      // $("h1"), $("#아이디명") : id = "btn01"
      // $(".클래스명") : class="cls01"
      // $("[속성=속성값]")
      $("#btn01").click(function(){
    	  // css({속성1:속성1명, 속성2:속성2명})
    	  $("td").css({"height":"33%", "background":""}).each(
    			  function(idx){$(this).text(idx+1)})
    	  var len = $("#tab01 td").length
    	  var rIdx = Math.floor(Math.random() * len)
    	  $("td").eq(rIdx).css("background", "yellow").text("빙고");
      })
   });
</script>
</head>

<body>
<table id="tab01" align="center" width="200" height="200" border>
	<col width="33%"><col width="33%"><col width="33%">
	<tr>
		<td>1</td><td>2</td><td>3</td>
	</tr>
	<tr>
		<td>4</td><td>5</td><td>6</td>
	</tr>
	<tr>
		<td>7</td><td>8</td><td>9</td>
	</tr>
</table>
<input type="button" name="bingo" value="빙고"/>
<input type="button" id="btn01" value="빙고"/>


<div class="jumbotron text-center">
  <h1>여러 객체에 대한 데이터 처리</h1>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
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