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
# v-for를 통한 반복문 랜더링 처리
1. 모델데이터의 배열, 객체, 객체형 배열을 반복문에 의해서 효과적으로 처리할 수 있다.
2. 기본 형식
	1) 배열 [데이터1, 데이터2, 데이터3]
		<반복할DOM v-for="(단위변수, index) in 배열형모델">
			{{단위변수}}
	2) 객체 {속성:값, 속성:값}
		<반복할DOM v-for="(값, 속성) in 객체모델">
			{{값}} {{속성}}
      --%>
      var vm = new Vue({
	  	  el:".container",
	  	  data:{msg:"v-for문 활용",
	  		  fruits:["사과", "바나나", "딸기"],
	  		  prices:[1000, 2000, 3000],
	  		  person:{name:"홍길동", age:25, loc:"서울 신림"},
	  		  bteam:{teamname:"한화", playername:"류현진", rank:"꼴등"},
	  		  dept:{10:"인사", 20:"재무", 30:"아이티사업부", 40:"총무"}
	  	  }
      	  // ex1) 배열로 가격 3개를 선언하고 반복문을 통해 출력하세요.
      	  // ex2) 야구선수의 팀명, 이름, 성적을 선언하고 호출하세요.
      })
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<div class="container">
	<h3 align="center">{{msg}}</h3>
	<h3 align="center" v-for="(fruit, index) in fruits">
		{{index+1}}) {{fruit}}
	</h3>
	<br>
	<h3 align="center" v-for="(price, index) in prices">
		가격 {{index+1}}) {{price}}
	</h3>
	<br>
	<h3 align="center" v-for="(val, prop) in person">
		{{prop}} - {{val}}
	</h3>
	<br>
	<h3 align="center" v-for="(val, prop) in bteam">
		{{prop}} - {{val}}
	</h3>
	<select>
		<option v-for="(val, pro) in bteam" :value="val">{{pro}}</option>
	</select>
	<br>
	부서선택:<select>
		<option v-for="(value, prop) in dept"
			:value="prop">{{value}}</option>
	</select>
   <form id="frm01" class="form"  method="post">
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