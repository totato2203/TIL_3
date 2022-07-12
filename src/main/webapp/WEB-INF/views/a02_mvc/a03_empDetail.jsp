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
   });
	<tr ondblclick="goDetail(${emp.empno})">
	function goDetail(empno){
		location.href="${path}/getDetail02.do?no="+no;
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>사원 정보 상세</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" name="empno" placeholder="사원번호" value="${param.empno }" />
       <button class="btn btn-info" type="submit">Search</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="15%">
      <col width="15%">
      <col width="20%">
      <col width="20%">
      <col width="15%">
      <col width="15%">
    <thead>
    
      <tr class="table-success text-center">
        <th>사원명</th>
        <th>직책명</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
      </tr>
    </thead>   
    <tbody>
       	<tr ondblclick="goDetail(${emp.empno})">
       		<td>${emp.ename }</td><td>${emp.job }</td>
       		<td><fmt:formatDate value="${emp.hiredate}"/></td>
       		<td><fmt:formatNumber value="${emp.sal}"/></td>
       		<td><fmt:formatNumber value="${emp.comm}"/></td>
       		<td>${emp.deptno }</td>
       	</tr>
    </tbody>
   </table>    
    
</div>

</body>
</html>