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
<h1>물건 정보</h1>
<div class="container">
	<form method="post">
	<div class="row">
		<div class="col-25">
			<label for="pname">물건명</label>
		</div>
		<div class="col-75">
			<input type="text" id="pname" name="pname" placeholder="물건명 입력.." value="">
		</div>
	</div>
	<div class="row">
		<div class="col-25">
			<label for="price">가격</label>
		</div>
		<div class="col-75">
			<input type="text" id="price" name="price" placeholder="가격 입력.." value="">
		</div>
	</div>
	<div class="row">
		<div class="col-25">
			<label for="cnt">개수</label>
		</div>
		<div class="col-75">
			<input type="text" id="cnt" name="cnt" placeholder="개수 입력.." value="">
		</div>
	</div>
	<div class="row">
		<input type="submit" value="검색">
	</div>
	</form>
</div> 
<%-- ${buyInfo.pname} ${buyInfo.price} ${buyInfo.cnt} --%>
<table>
	<tr><th>물건명</th><th>가격</th><th>개수</th><th>총계</th></tr>
	<tr><td>${buyInfo.pname}</td><td>${buyInfo.price}</td><td>${buyInfo.cnt}</td>
	<td>${buyInfo.price*buyInfo.cnt }</td></tr>
</table>
</body>
</html>