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
2022-07-15
오전 정리문제
[1단계:개념] 1. jquery에서  한번에 여러가지 css 속성을 설정하는 방법을 기술하세요
		$("선택자").css({"속성":"속성값", "속성2":"속성2값", ...})

[1단계:확인] 2. jquery에서  each 구문을 통한 객체형 배열 처리의 매개변수을 값을 활용하여, 학생들의 이름/국어/영어/수학 점수를 테이블에 출력하세요
--%>
		var studList=[
			{name:"철수", kor:90, eng:80, math:80},
			{name:"영희", kor:70, eng:70, math:70},
			{name:"맹구", kor:100, eng:90, math:20}			
		];
		var addHTML = "";
		$(studList).each(function(idx, stud){
			addHTML += "<tr><td>" + stud.name + "</td><td>" + stud.kor + "</td><td>"
						+ stud.eng + "</td><td>" + stud.math + "</td></tr>";
		})
		$("#showData").html(addHTML);
<%--
[1단계:개념] 3. jquery에서 ajax 처리를 위한 속성값을 기술하세요
		$.ajax({속성:속성값, ...})
			1) url : 요청 주소 - url mapping(controller의 기능메소드)
			2) data : 요청 query string ex) id=@@@&pass=@@@
			3) type : get/post
			4) dataType : 결과를 받은 데이터 유형 [json], xml, text
			5) success:function(data){} : 서버에서 전달해주는 데이터(data)
			6) error : function(xhr, status, error){}
				: 서버와 통신에 에러 발생 시 처리해주는 메소드
				
		$.ajax({속성:속성값})
		$.ajax({
			url:"컨트롤러 호출 주소", // 내부 주소, 외부 사이트에 있는 json 형식 가져오고,
			data:"요청 query String,
			dataType:"json", // json 문자열 ==> 객체로 변환
			success:function(data){
				// controller단이나 외부 사이트에서 넘겨온 json 데이터 객체
				// data.모델명 : controller에서 모델명이 지정했을 때
			},
			error:function(err){
				// 서버에 해당 주소로 접속했을 때 에러에 대한 처리
			}
			
		})
	
[1단계:확인] 4. 아래의 내용을 처리하는 서버단 ajax controller을 메서드를 선언하세요 
            1) http://localhost:7080/springweb/ajax11.do?name=홍길동&height=175.5&weight=68.5
               화면출력 {"p01",{"name":"홍길동","height":175.5,"weight":68.5}}
               
               - 요청값에 대한 확인, vo 처리 여부 결정
               - controller 생성 - url 기능 메소드 선언
               
--%>
		$("#btn11").click(function(){
			$.ajax({
				url:"${path}/ajax11.do?name=홍길동&height=175.5&weight=68.5",
				dataType:"json",
				success:function(data){
					var p01 = data.p01
					$("h2").text(p01.name + " : " + p01.height + " : " + p01.weight)
				}
			})
		})
<%--
            2) http://localhost:7080/springweb/ajax12.do?radius=50.2
               화면출력 {"circle":{radius:50.2,dimension:7912.92}}
--%>
		$("#btn12").click(function(){
			$.ajax({
				url:"${path}/ajax12.do?radius=50.2",
				dataType:"json",
				success:function(data){
					var circle = data.circle
					$("h2").text(circle.radius + " : " + circle.dimension)
				}
			})
		})
<%--
[1단계:확인] 5. 아래 내용을 ajax 통해 controller에서 모델 값을 처리를 통해서 입력과 동시에 출력되게 하세요
            물건명 :[    ] 가격:[     ] 수량:[     ]
            ==> @@을 @@@원에 @@게 구매하여 총비용이 @@@ 원입니다.  
            1) 요청값 vo 확인
            2) controller :
            	http://localhost:7080/springweb/ajax13.do?pname=사과&price=2000&cnt=3
            3) 화면 및 이벤트 처리
            	name="name" name="price" name="cnt"
            	class="prodCls"
            	$(".prodCls").keyup(function(){
            	
            	});
            4) ajax 처리
            	$.ajax(function(){
            		url:"${path}/ajax13.do",
            		data:$("form").serialize(),
            		success:function(data){
            			var prod = data.product
            			var show = prod02.pname + "를 " + prod02.price + "원에 " + prod02.cnt + "개 구매하여 총비용이 " + prod02.sum + "원 입니다.
            			$("#result").text(show);
            		}
            	})
      --%>
		$("#btn13").click(function(){
			$.ajax({
				url:"${path}/ajax13.do?pname=사과&price=2000&cnt=3",
				dataType:"json",
				success:function(data){
					var prod02 = data.prod02
					$("h2").text("물건명 : " + prod02.pname + ", 가격 : " + prod02.price + "원, 수량 : " + prod02.cnt + "개\n"
								+ prod02.pname + "를 " + prod02.price + "원에 " + prod02.cnt + "개 구매하여 총비용이 " + prod02.sum + "원 입니다.")
					
				}
			})
		})
		
		$("#showData").html(addHTML);
		$(".prodCls").keyup(function(){
			$.ajax({
				url:"${path}/ajax14.do",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(data){
					console.log(data)
					var prod = data.prod
					var show = prod.pname + "를 " + prod.price + "원에 " + prod.cnt + "개를 구매한 총 비용은 " + prod.sum + "원 입니다."
					$("#resultTxt").text(show);
				},
				error:function(err){
					console.log(err)
				}
			})
		})
})
</script>
</head>

<body>

<h2>나는 h2</h2>

<div class="container">

	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="pname" value="" class="prodCls form-control mr-sm-2" placeholder="물건명" />
	    <input name="price" value="0" class="prodCls form-control mr-sm-2" placeholder="가격" />
	    <input name="cnt"  value="0" class="prodCls form-control mr-sm-2" placeholder="개수" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
	<h3 id="resultTxt"></h3>
	<table class="table table-hover table-striped">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      
      <tbody id="showData">
      </tbody>

	</table>
    
</div>
<button class="btn btn-info" id="btn11" type="button">4-1</button>
<button class="btn btn-info" id="btn12" type="button">4-2</button>
<button class="btn btn-info" id="btn13" type="button">5</button>

</body>
</html>