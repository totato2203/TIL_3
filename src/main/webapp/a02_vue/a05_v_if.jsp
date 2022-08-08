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
# 조건문 처리 directive
1. v-if : 해당 조건일 때만 DOM 객체를 로딩(랜더링) 처리한다.
	v-else-if
	v-else
	기본 형식
	<태그 v-if="모델데이터>=1000">Gold</태그>
	<태그 v-else-if="모델데이터>=500">Silver</태그>
	<태그 v-else>Bronze</태그>
2. v-show : 일단 html 요소를 랜더링 한 후에 display 스타일
	속성으로 화면에 보여줄지 여부를 결정한다.
	<v-show="balance>=1000>
	cf) 자주 변경되는 부분에 대해 효과적으로 화면 처리
      --%>
   		var vm = new Vue({
   			el:".container",
   			data:{msg:"안녕", price:"", point:""}
   		})
   });
// ex) 입력한 점수에 따라 A, B, C, D, F 등급을 표시하는 조건문 처리를 하세요.
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>v-if / v-show 조건문 처리</h2>

</div>
<div class="container">
	<h2 align="center">가격 : {{price}}</h2>
	<h3 align="center" v-if="price>=100000">고가</h3>
	<h3 align="center" v-else-if="price>=50000">중가</h3>
	<h3 align="center" v-else>저가</h3>
	
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input v-model="price" class="form-control mr-sm-2" placeholder="가격" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
    </nav>
   </form>
   
   <h2 align="center">점수 : {{point}}</h2>
	<h3 align="center" v-if="point>=90">등급 : A</h3>
	<h3 align="center" v-else-if="point>=80">등급 : B</h3>
	<h3 align="center" v-else-if="point>=70">등급 : C</h3>
	<h3 align="center" v-else-if="point>=60">등급 : D</h3>
	<h3 align="center" v-else>등급 : F</h3>
	
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input v-model="point" class="form-control mr-sm-2" placeholder="가격" />
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