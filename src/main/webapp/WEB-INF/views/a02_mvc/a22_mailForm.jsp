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
	.input-group-text{width:100%;background-color:#cfffdf;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
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
		var msg = "${msg}"
		if(msg!="") alert(msg)
			
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >메일발송</h2>

</div>
<div class="container">
	<form id="frm01" class="form" 
		action="${path}/mailSender.do" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">수신자</span>
			</div>
			<input name="receiver" class="form-control" 
				value="" placeholder="수신자 메일 주소를 입력하세요" />	
		</div>  
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">발신자</span>
			</div>
			<input class="form-control" 
				value="yeeaahzzii@gmail.com" readonly/>
			<!-- gmail 계정(자신 계정) -->		
		</div> 	
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">제 목</span>
			</div>
			<input name="title" class="form-control" 
				value="" placeholder="제목을 입력하세요" />
		</div> 
				
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">내 용</span>
			</div>
			<textarea name="content" rows="10" class="form-control"  
				placeholder="내용 입력하세요"></textarea>	
		</div> 	
		<div class="text-right">
			<button type="submit" class="btn btn-success">메일발송</button>
		</div>		
	</form>
</div>

</body>
</html>