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
      # 기본 디렉티브
      1. 단방향 디렉티브
      	1) {{}} (mustache) : 모델 데이터를 처리하는 기본 형식
      		출력 형식 태그에 바로 사용한다. ex) <h2>{{모델명}}</h2>
      	2) v-text : 모델 데이터를 태그의 속성으로 선언하여 처리하는 방식
      		ex) <h2 v-text="모델명"></h2>
      	3) v-html : 모델 데이터가 tag 내용을 포함하고 있으면 랜더링하여 출력
      	4) v-bind : 모델 데이터를 요소 객체의 속성으로 할당하여 처리할 때 사용된다.
      		- 기본 형식
      			v-bind:속성="모델key"
      			:속성="모델key"	v-bind는 생략이 가능하다.
      		ex) 모델 데이터 {dir01:"center", id:"himan"}
      			<h2 v-bind:align="dir01">안녕</h2>
      				모델명 dir01은 값이 center로 연결되어 있기에 정렬을 중앙으로 처리한다.
      			<input type="text" :value="id"/>
      				속성 value에 id값의 모델명으로 처리되어 있는 himan이 화면에 출력된다.
      --%>
      var vm = new Vue({
    	  el:".container",
    	  data:{name:"홍길동", text01:"<h3>안녕</h3>",
    		  dir01:"center", id:"himan",
    		  name01:"김철수", age:"25", loc:"서울",
    		  img:"banner.png"}
      })

   // ex1) 이름, 나이, 사는 곳은 모델 데이터로 선언하여 form 하위에 input의 value 값으로 처리하세요.
   // ex2) 이미지를 찾아서 모델값으로 이미지명을 설정하고,
   //		 img의 src 속성을 모델명으로 호출하여 이미지가 출력되게 하세요.
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>vue directive</h2>

</div>
<div class="container">
	<h2 v-text="name"></h2>
	<div v-text="text01"></div>
	<div v-html="text01" v-bind:align="dir01"></div>
	<img :src="img"/>
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input :value="id" class="form-control mr-sm-2" placeholder="제목" />
       <input :value="name01" class="form-control mr-sm-2" placeholder="제목" />
       <input :value="age" class="form-control mr-sm-2" placeholder="제목" />
       <input :value="loc" class="form-control mr-sm-2" placeholder="제목" />
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