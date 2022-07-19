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
2022-07-19
오전 정리문제
[1단계:개념] 1. 파일을 업로드 하기 위하여 스프링에 어떤 환경 처리가 필요한가?

		1) 웹에서 파일 업로드 처리의 구조
			1. 화면
				form
				<input type="file"/>
			2. form에서 파일을 stream으로 전달할 수 있는 속성값을 설정
				enctype = "multipart/form-data"
				
			3. 서버단에서 stream으로 전달해오는 파일객체를 받을 수 있게
				MultipartFile을 통해서 파일객체를 Stream 형식으로 받고,
			
			4. MultipartFile(Stream) ==> File(하드웨어적으로 특정한 위치에 파일 저장)
				1) 위 내용을 처리하는 전환 과정을 거치고
				2) 서버에 특정한 위치에 파일을 저장처리
				3) 그 파일명 특정위치정보를 DB로 등록
			
			
		2) 파일 업로드 뷰에 대한 이해
			1. 스프링에서 사용하는 veiw는 기본으로 jsp/html 뷰가 default
			2. json view(객체 ==> json 문자열)
			3. 업로드 뷰 (클라이언트 ==> 서버) 파일 정보를 전송하는 뷰
	
		3) 파일 다운로드 뷰에 대한 이해
			1. 서버에 특정한 위치에 있는 파일을 클릭 등 이벤트 처리했을 때, 클라이언트로
			파일을 다운로드하게 처리하는 뷰(서버 ==> 클라이언트)
	
		4) 파일 업로드 처리를 위한 기본 처리 프로세스와 실제 코드
			1. 기본 프로세스
				화면에서 type="file"을 클릭 시, 파일을 선택할 수 있는 ui 로딩.
				파일을 선택하면 화면에 파일명이 출력되고 form 형식으로 전송할 준비를 한다.
				submit 클릭 시 서버의 파일이 stream 형식으로 변환되어 전송된다.
				전송된 stream 형식 파일(MultipartFile)을 transTo()에 의해서
				File 객체로 특정한 위치에 파일을 서버에서 저장한다.
				해당 파일의 경로, 파일명, 기본 연동하는 정보들을 파일 관리 테이블에 저장한다.
			2. 파일 업로드 view 컨테이너에 등록
			3. 뷰(jsp)
				- <form enctype="multipart/form-data"
					<input type="file" name="report"
			
			4. controller
				- 요청 객체로 파일 받기 : public String insertBoard(Board ins, Model d)
					class Board{
						// 추가 property 설정
						private MultipartFile mpf;
					}
				- 단일 요청 형식으로 파일 받기 @RequestParam("report") MultipartFile mpf'
			5. service
				- MultipartFile tranferTo()를 통해서 선언될 File 객체로 변환하여 특정 위치에 파일명으로 저장
			6. Dao를 통한 파일정보 처리
				- 저장할 파일정보를 처리한 테이블 구성
				- 위에 있는 파일명과 경로명 등록일 등으로 DB 할당 처리한다.
				- dao, mapper 처리
				table : 
					create table boardfile(
						no number,
						path varchar2(100),
						regdte date,
						uptdte date,
						etc varchar2(200)
					)
				sql : insert into boardfile(values(board_seq.currval,
						#{path}, #{fname}, sysdate, sysdate, '');
				vo
					class BoardFile{
						private int no;
						private String path;
						private String fname ;
						private Date regdte ;
						private Date uptdte ;
						private String etc;
					}
					
				공통 mybatis
					BoardFile  boardfile
					
				dao
					public void insertFile(BoardFile file);
				
				mapper
					<insert id="insertFile" parameterType="boardfile">
						insert into boardfile(values(board_seq.nextval,
							#{path}, #{fname}, sysdate, sysdate, '')
					</insert>
			
		
		5) 파일 다운로드 처리를 위한 기본 처리 프로세스와 실제 코드
			1. 기본 프로세스
				생성화면에서 첨부파일을 확인하고, 해당 파일을 클릭 후 다운로드 시
				다운로드 컨트롤러를 통해 다음 정보를 전달하고 이 정보를 모델로 설정하여
				다운로드 뷰를 호출하여, 해당 정보(파일명/경로명)와 동일한 파일을 다운로드 뷰에 의해 다운이 된다.
				
				
[1단계:확인] 2. 아래와 같은 url을 이용하여 파일을 업로드 처리하세요
             /fileUpload05.do    name="file01"    webapp/z05_upload
             
             // http://localhost:7080/springweb/fileUpload05.do
             
             
[1단계:개념] 3. 파일 업로드와 함께 DB 처리하는 방식을 기술하세요.


[1단계:확인] 4. 아래와 같은 화면에서 파일 업로드 처리와 DB 등록까지 하세요.
            첨부파일:[    ] 게시물명:[   ]          
	1) 초기 기본 화면 로딩
		controller(springweb.a02_mvc.a01_controller.FileUploadController.java)
			/fileUpload05.do
			a01_jquery\HW0719.jsp
	2) 화면 구현(a01_jquery\HW0719.jsp)
		<form enctype="multipart/form-data"
			<input type="file" name="addFile"
			<input type="text" name="title"
	3) controller 전송 데이터 처리
		- 매개변수 받는 객체
			class FileVo{
				private MultipartFile addFile;
				private String title;
			}
		
		@Autowired(required = false)
		private FileUploadService service;
		
		- public String upload(FileVo vo){
			// service 처리
			
			// 메세지
			d.addAttribute("msg", vo.addFile.getOriginalFilename() + " 파일첨부성공");
		}
		
		# jsp
		script
		var msg = "${msg}"
		if(msg != ""){
			alert(msg)
		}
		
	4) service 처리
		@Value("${upload}")
		private String path;
		public void upload(FileVo vo){
			MultipartFile mpf = vo.getAddFile();
			String fname = mpf.getOriginalFilename();
			File f01 = new File(path + fname);
			
			mpf.transferTo(f01);
			
			// DB로 파일 정보 등록
			dao.insertFile(new BoardFile(path, fname)
		}
	5) 파일 정보 등록 처리
		board에 있는 내용을 처리
		vo
			: springweb.a02_mvc.a04_vo.BoardFile (Board 쪽에서 복사)
		dao
			springweb.a02_mvc.a03_dao.DaoExp
			public void insertFile(BoardFile file);
			
		공통 mybatis.spring.xml
			springweb.a02_mvc.a04_vo.BoardFile boardfile
			
		mapper
			resource\mapper\DaoExpMapper.xml	
				
			<insert id="insertFile" parameterType="boardfile">
				insert into boardfile values(board_seq.nextrval,
					#{path}, #{fname}, sysdate, sysdate, '')
			</insert>
				(Board 쪽에서 복사, board_seq.nextval는 변경사항)


--%>
})
</script>
</head>

<body>

<h2>파일 업로드(과제 HW0719)</h2>

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
</body>
</html>