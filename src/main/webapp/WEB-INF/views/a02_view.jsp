<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"    
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<fmt:requestEncoding value="UTF-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/a00_com/a01_common.css" rel="stylesheet">
<style>
    
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script>
	/*
	
	*/
	$(document).ready(function(){
//		$("h1").text("시작!");
	});
</script>
</head>
<body>
<%--

--%>
<h1>Second Spring</h1>
<div class="container">
	<form>
	<div class="row">
		<div class="col-25">
			<label for="dname">@@@</label>
		</div>
		<div class="col-75">
			<input type="text" id="dname" name="dname" placeholder="부서명입력.." value="">
		</div>
	</div>
	<div class="row">
		<input type="submit" value="검색">
	</div>
	</form>
</div> 
<table>
	<tr><th>#</th><td>#</td><td>#</td></tr>
	<tr><td>#</td><td>#</td><td>#</td></tr>
</table>
</body>
</html>