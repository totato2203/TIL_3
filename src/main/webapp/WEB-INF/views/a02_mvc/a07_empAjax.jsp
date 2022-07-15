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
      $("#schBtn").click(function(){
    	  $.ajax({
    		  url:"${path}/ajaxEmp.do",
    		  dataType:"json",
    		  success:function(data){
    			  // data.모델명 : m.addAttribute("empList", ser...)
    			  var list = data.empList
    			  var addHTML = ""
    			  $(list).each(function(dix, emp){ // 변수명이 중요하지 않고 순서가 중요하다.
    				  addHTML += "<tr><td>" + emp.empno + "</td><td>" + emp.ename + "</td><td>" + emp.job
    				  			+ "</td><td>" + emp.sal + "</td><td>" + emp.deptno + "</td></tr>"
    			  })
    			  console.log(addHTML)
    			  $("#empList").html(addHTML)
    		  }
    	  })
      })
      $(".sch").keyup(function(){
    	  var enameVal = $("[name=ename]").val()
    	  var jobVal = $("[name=job]").val()
    	  // $("h2").text("ename=" + enameVal + "&job=" + jobVal)
    	  $.ajax({
    		  url:"${path}/ajaxEmp.do",
    		  data:"ename=" + enameVal + "&job=" + jobVal,
    		  dataType:"json",
    		  success:function(data){
    			  // data.모델명 : m.addAttribute("empList", ser...)
    			  var list = data.empList
    			  var addHTML = ""
    			  $(list).each(function(idx, emp){ // 변수명이 중요하지 않고 순서가 중요하다.
    				  addHTML += "<tr><td>"+emp.empno+"</td><td>"+emp.ename+"</td>"+
						"<td>"+emp.job+"</td><td>"+emp.sal+"</td>"+
						"<td>"+emp.deptno+"</td></tr>"
    			  })
    			  console.log(addHTML)
    			  $("#empList").html(addHTML)
    		  }
    	  })
      })
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>사원정보 Ajax</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="sch form-control mr-sm-2" placeholder="사원명" name="ename"/>
       <input class="sch form-control mr-sm-2" placeholder="직책명" name="job"/>
       <button class="btn btn-info" id="schBtn" type="button">Search</button>
       <!-- <button> 기본 타입이 submit -->
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
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책명</th>
        <th>급여</th>
        <th>부서번호</th>
      </tr>
    </thead>   
    <tbody id="empList">
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