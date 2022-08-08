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
# 양방향 디렉티브 v-model
1. 단방향 디렉티브가 모델의 값을 가져와서 속성이나 화면 출력을 처리한다면
2. 양방향 디렉티브는 form 하위 요소 객체와 연결하여 모델값을 변경 처리한다.
3. 변경된 모델값을 호출하는 곳에는 다시 변경되는 데이터가 출력된다.
4. 기본 형식
	<form 하위 요소객체 v-model="모델데이터"
      --%>
	var vm = new Vue({
		el:".container",
		data:{name:"", price:"0", cnt:"0",
			pt:{kor:0, eng:0, math:0}
		}
	})
   });
// ex) 학생의 국어, 영어, 수학 점수를 모델로 선언하고 form 하위 요소 객체와 연결하여
// 		해당 값을 입력과 동시에 총계와 평균이 출력되게 처리하세요. v-model 활용
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input v-model="name" class="form-control mr-sm-2" placeholder="제목" />
       <input v-model="price" class="form-control mr-sm-2" placeholder="제목" />
       <input v-model="cnt" class="form-control mr-sm-2" placeholder="제목" />
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">
    <thead>
      <tr class="table-success text-center">
        <th>물건명</th>
        <th>가격</th>
        <th>개수</th>
        <th>계</th>
      </tr>
    </thead>   
    <tbody>
       <tr><td>{{name}}</td><td>{{price}}</td>
       <td>{{cnt}}</td><td>{{price*cnt}}</td></tr>
       <tr><td>{{name}}</td><td>{{price}}</td>
       <td>{{cnt}}</td><td>{{price*cnt}}</td></tr>
       <tr><td>{{name}}</td><td>{{price}}</td>
       <td>{{cnt}}</td><td>{{price*cnt}}</td></tr>
    </tbody>
   </table>
   
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input v-model="pt.kor" class="form-control mr-sm-2" placeholder="제목" />
       <input v-model="pt.eng" class="form-control mr-sm-2" placeholder="제목" />
       <input v-model="pt.math" class="form-control mr-sm-2" placeholder="제목" />
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
    <thead>
      <tr class="table-success text-center">
        <th>국어</th>
        <th>영어</th>
        <th>수학</th>
        <th>총계</th>
        <th>평균</th>
      </tr>
    </thead>   
    <tbody>
       <tr><td>{{pt.kor}}</td><td>{{pt.eng}}</td>
       <td>{{pt.math}}</td><td>{{Number(pt.kor)+Number(pt.eng)+Number(pt.math)}}</td>
       <td>{{(Number(pt.kor)+Number(pt.eng)+Number(pt.math)) / 3.0}}</td></tr>
       <!-- 
       js는 기본적으로 입력 데이터를 문자열 데이터 형식으로 나타낸다.
       데이터 처리 시 +(기호) 이외에는 자동 형변환 처리한다.
       그러나 +(기호)는 문자열을 이어주는 기능과 충돌되기 때문에
       우선 문자열 연결처리를 하고, 숫자형 변환 함수(Number(), parseInt(), parseFloat())를 
       통해서 숫자형 문자열을 숫자로 변환하여 연산을 처리한다.
       -->
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