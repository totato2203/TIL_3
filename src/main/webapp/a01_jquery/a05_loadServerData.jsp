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
# jquery ajax 통신 속성
1. 기본 형식
	$.ajax({속성:속성값, ...})
	1) url : 요청 주소 - url mapping(controller의 기능메소드)
	2) data : 요청 query string ex) id=@@@&pass=@@@
	3) type : get/post
	4) dataType : 결과를 받은 데이터 유형 [json], xml, text
	5) success:function(data){} : 서버에서 전달해주는 데이터(data)
	6) error : function(xhr, status, error){}
		: 서버와 통신에 에러 발생 시 처리해주는 메소드
	
# backend(서버에서 환경 설정)
1. 모델 데이터를 json 데이터로 변경해주는 spring 프레임워크의 lib 컨테이너에서 선언
2. ajax에서 요청한 요청값을 선언 메소드 처리
3. 모델 데이터 처리
4. return 컨테이너에 선언한 json 처리 view 호출

      --%>   
	$("#btn01").click(function(){
		$.ajax({
			url:"${path}/ajax01.do", // 서버의 주소
			dataType:"json",
			success:function(data){
				// data.모델명
				$("h2").text(data.data01 + " : " + typeof(data))
			}
		})
	})
	// ex) 버튼2를 클릭 시, ajax02.do로 호출해서
	//		모델명 msg라고 선언된 내용(반가워요)을 호출해서 h2 출력
	$("#btn02").click(function(){
		$.ajax({
			url:"${path}/ajax02.do",
			dataType:"json",
			success:function(data){
				// data.모델명
				$("h2").text(data.msg + " : " + typeof(data))
			}
		})
	})
	
	$("#btn03").click(function(){
		$.ajax({
			url:"${path}/ajax03.do",
			dataType:"json",
			success:function(data){
				var p01 = data.person
				console.log(p01)
				$("h2").text(p01.name + " : " + p01.age + " : " + p01.loc)
			}
		})
	})
	// ex) btn04 추가 Product 복사해서 data.product
	//		물건명 가격 개수를 h2에 출력
	$("#btn04").click(function(){
		$.ajax({
			url:"${path}/ajax04.do",
			dataType:"json",
			success:function(data){
				var p01 = data.product
				console.log(p01)
				$("h2").text(p01.pname + " : " + p01.price + " : " + p01.cnt)
			}
		})
	})
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" id="btn01" type="button">서버데이터 호출</button>
       <button class="btn btn-info" id="btn02" type="button">서버데이터 호출2</button>
       <button class="btn btn-info" id="btn03" type="button">객체 호출</button>
       <button class="btn btn-info" id="btn04" type="button">객체 호출2</button>
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