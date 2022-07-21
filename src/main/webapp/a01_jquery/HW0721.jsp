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
[1단계:개념] 1. 파일을 다운로드하기 위한 환경 설정을 기술하세요.

	1) 다운로드 뷰를 생성
		model : 파일명 지정
		한글파일을 encoding 처리
		목적 : 해당 view를 통해서 서버에 있는 파일을 client에 전달하기 위한 목적
		처리 프로세스
		client ==(클릭/다운로드 요청)==> server
					파일명(모델명)
					
				<==(파일을 전송)======		viewer
					stream 형식		받은 모델명을 기준으로 서버 내에
									해당 경로에 파일이 있는지 확인
									한글 encoding..
		파일 다운로드 뷰
			전달해온 model명을 기준으로 전송할 파일 객체 File f = new File(@@@)
			한글파일명인 경우 encoding
			response(반응객체)에 탑재하여 client에 전송한다.
	
	2) 다운로드 뷰 컨테이너 등록
	
	3) 다운로드 controller 처리
	
2. 다운로드 상세화면에서 로딩 처리
	1) dao에 기존 게시물 정보(게시물번호)로 다운로드 처리할 수 있게 등록
			public String getFileName(int no);
		XXXMapper
			<select id="getFileName" parameterType="int">
				select fname
				from boardfile
				where no = #{no}
			</select>
	2) service ==> controller
		d.addAttribute("fname", service.getFileName(board.getNo());
3. jsp
	<input name="fname" value="${fname}"/>
		해당 파일 클릭 시, 다운로드 controller 호출
4. 다운로드 controller
	/downLoad.do
	
	return "다운로드뷰(컨테이너에 등록된)"		
	
	
	// 해설
	
	1) 다운로드 viewer 생성
	2) 컨테이너에 다운로드 viewer 등록
	3) 다운로드 할 파일의 위치 : src\main\webapp\z01_upload
		공통 파일에 선언
	4) 다운로드 controller 생성
		- 요청값 : 파일명 지정
		- 모델데이터 : 다운로드 viewer에서 선언한 모델명
		- return "컨테이너의 다운로드 viewer"
	
	
[1단계:확인] 2. 아래와 같은 경로에 파일을 올려놓고 url을 이용하여 파일을 다운로드 할 수 있게 controller를 처리하세요.
            파일 위치 : src\main\webapp\z01_upload
            http://localhost:7080/springweb/download10.do?filename=@@@@  viewer fileView01
            http://localhost:7080/springweb/download11.do?file01=@@@@

[1단계:확인] 3. 위에 설정한 controller상 경로로 src\main\webapp\z01_upload에 있는 파일을 리스트(직접파일명 입력)하고,
            클릭시, 다운되게 하세요
            
[1단계:개념] 4. 답글을 달기 위하여 필요하는 요청값 처리 구조와 속성을 기술하세요.   

	1) 데이터 구조
		no	refno	subject	content
		1	0
		2	0
		3	1		RE:@@	\n\n===상위글===\n상위 글 내용..
	2) 화면단
		상세화면 ==> 등록화면
		[name = no]의 값 ==> [name = refno] 값으로 할당
		[name = subject]의 값 ==> RE:로 접두어 표기
		[name = content]의 값 ==> \n\n===상위글===\n상위 글 내용..
		
		$("#reBtn").click(function(){
			위 내용으로 데이터 처리
			$("form").attr("action","${path}/insertBoardForm");
			$("form").submit();
		})
		등록화면 form에서 처리는 일반 등록처리와 동일
	3) 계층형 sql 처리
		start with refno=0
		connect by prior no = refno
		order siblings by no desc
		
		계층형으로 상위글 밑에 하위글들이 먼저 list 되고, 그 다음 항목들이 역순위로 출력된다.
	4) vo 속성으로 level을 추가하여
		계층단계별로 공백이 추가되어 계층 레벨별로 리스트 처리
		<c:forEach begin="1" end="${bd.level}">
			&nbsp;&nbsp;
		</c>
		
		${bd.subject}
		
		
[1단계:개념] 5. 페이지 처리를 위한 핵심 sql이 가지는 의미를 기술하세요.
	
	rownum : 데이터가 나온 순서대로 1~... 개수만큼 numbering,
		이 기준으로 특정 페이지에서 보이는 데이터를 범위로 지정하여 출력
	select *
	from (
		select rownum cnt
		from ...
	)
	where cnt between ${start} and #{end}
	1페이지 1~5
	2페이지 6~10
	3페이지 11~15
	                
[1단계:개념] 6. 페이지 처리를 위한 속성을 기술하세요.  

	count : 전체 검색된 데이터가 몇 건인지 확인(DB)
	pageSize : 한 번에 보여줄 데이터 건수 화면에서 요청값으로 전달(view)
	pageCount : count/pageSize 형식으로 전체 페이지 수를 가져올 수 있다. (로직)
	curpage : 요청값으로 화면에서 클릭한 현재 페이지 번호
	start : (curpage - 1) * pageSize + 1(로직)
	end : curpage * pageSize(로직)
	--- 블럭 처리 ---
	<[ 1][ 2][ 3][ 4][ 5]>
	<[ 6][ 7][ 8][ 9][10]>
	<[11][12][13][14][15]>
	blockSize : 블럭의 크기
	startBlock : 시작 block 페이지번호
	endBlock : 마지막 block 페이지번호

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
})
</script>
</head>

<body>

<h2>파일 다운로드(과제 HW0721)</h2>

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
	    	<tr><td>AjaxTest_v3.1.1.zip</td></tr>
		    <tr><td>fullcalendar-5.11.0.zip</td></tr>
		    <tr><td>jquery-3.6.0.js</td></tr>
		    <tr><td>banner.png</td></tr>
		</tbody>  
	</table>
	<script type="text/javascript">
		$("#showData td").click(function(){
			var fname = $(this).text();
			location.href="${path}/download10.do?filename="+fname;
		})
	</script>
    
</div>
</body>
</html>