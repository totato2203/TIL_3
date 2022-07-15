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
# ajax
1. 비동기통신으로 서버와 통신하는 것을 말한다.
	1) 웹에서 동기 통신
		ex) id/pass 입력 후 submit를 눌렀을 때, 서버에서 이 form에서
		지정한 url의 자원을 호출할 때까지 다른 작업을 안 하고,
		해당 작업이 끝나면 화면이 전환되어 처리가 된다.
			단점 : 화면 refresh
	2) 웹에서 비동기 통신
		js 아이디를 입력하고 서버에 있는지 여부를 호출하고,
		다른 기능을 처리할 수 있게 하는 것을 말한다.
			장점 : 화면 전환이 일어나지 않고, XMLHttpRequest
2. jquery를 통한 ajax 처리
	1) 보다 효과적인 옵션을 통해서 비동기 통신으로 데이터를 처리할 수 있다.
	2) json 데이터 형식 파악
	3) ajax의 옵션 파악
	4) 서버와 jquery Ajax 비동기 처리 연습
      --%>
		// # json
		// 1. {속성:속성값}
		var p01 = {name:"홍길동", age:25, loc:"서울",
					show:function(){
						console.log("# 객체의 메소드 호출 #")
						console.log("이름 : " + this.name)
						console.log("나이 : " + this.age)
						console.log("사는 곳 : " + this.loc)
					}}
		p01.show();
		p01.show();
		p01.show();
		
		console.log("이름 : " + p01.name)
		console.log("나이 : " + p01.age)
		console.log("사는 곳 : " + p01.loc)
		// ex) prod로 물건명, 가격, 개수 속성으로 선언하고,
		//		console.log를 통해서 출력하세요.
		
		var prod = {pname:"사과", price:2000, cnt:3,
				show:function(){
					console.log("# prod 객체의 메소드 호출")
					console.log("물건명 : " + this.pname)
					console.log("물건가격 : " + this.price)
					console.log("물건개수 : " + this.cnt)
				},
				show2:function(){
					$("h2").eq(3).text("물건명 : " + this.pname)
					$("h2").eq(4).text("물건가격 : " + this.price)
					$("h2").eq(5).text("물건개수 : " + this.cnt)
				}}
		$("h2").eq(0).text("물건명 : " + prod.pname)
		$("h2").eq(1).text("물건가격 : " + prod.price)
		$("h2").eq(2).text("물건개수 : " + prod.cnt)
		prod.show();
		prod.show();
		prod.show2();
		
		var member = {}
		member.name = "홍길동"
		member.id = "himan"
		member.show = function(){
			console.log(this.name)
			console.log(this.id)
		}
		member.show()
		
		var array = [
			{no:1, subject:"첫번째", name:"홍길동", regdate:"2020-07-07", readcnt:5},
			{no:2, subject:"두번째", name:"마길동", regdate:"2020-08-09", readcnt:3}
		]
		array.push({no:3, subject:"세번째", name:"오길동", regdate:"2021-01-19", readcnt:1})
		console.log("배열의 개수 : " + array.length)
		// ex) var fruits 로 물건명 가격 개수 속성과 값이 처리된 객체형 배열을 선언하고
		//		console.log로 배열의 개수를 출력하세요
		
		var fruits = [
			{name:"사과", price:2000, cnt:3},
			{name:"바나나", price:3000, cnt:6},
			{name:"오렌지", price:1500, cnt:5}
		]
		console.log("과일의 개수 : " + fruits.length)
		
		$("#loadBtn").click(function(){
			var addhtml=""
			// 배열의 개수만큼 반복 처리
			for(var idx = 0; idx < array.length ; idx++){
				var bd = array[idx]	// board의 단위 데이터 할당
				addhtml += "<tr><td>" + bd.no + "</td><td>" + bd.subject 
				+ "</td><td>" + bd.name + "</td><td>" + bd.regdate
				+ "</td><td>" + bd.readcnt + "</td></tr>"
			}
			console.log(addhtml)
			$("#tab01 tbody").html(addhtml);
		})
		// ex) 회원 정보 배열형 json 형태로 id, 이름을 3명 선언하고
		//		버튼 클릭 시, memlist에 아이디와 회원명이 출력되게 하세요.
		var memlist = [
			{id:"wkdgh1001", name:"전장호"},
			{id:"chulsoo", name:"김철수"},
		]
		memlist.push({id:"0hui", name:"김영희"})
		
		$("#loadMem").click(function(){
			var addhtml=""
			/*
			for(var idx = 0; idx < memlist.length ; idx++){
				var mem = memlist[idx]
				console.log(mem)
				addhtml += "<h2>" + mem.id + "</h2><h2>" + mem.name + "</h2>"
			}
			*/
			
			// $(배열).each(function(index번호, 단위객체){});
			$(memlist).each(function(idx, mem){
				console.log(mem)
				addhtml += "<h2>" + mem.id + " : " + mem.name + "</h2>"
			})
			console.log(addhtml)
			$("#memList").html(addhtml);
		})
		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
	<input type="button" id="loadMem" value="회원정보로딩"/>
	<div id="memList">
		<h2>memList 불러오기</h2>
	</div>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" id="loadBtn" type="button">Search</button>
    </nav>
   </form>
   <table id="tab01" class="table table-hover table-striped">
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