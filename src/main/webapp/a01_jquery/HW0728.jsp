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
[1단계:개념] 1. jquery lib를 활용하는 순서를 기술하세요
	1) jquery lib 다운로드
		webapp 설정 main index.html 확인
	2) controller/view단 확인
	3) 공통 lib(css, js) webapp/a01_com 위치
	4) 초기 로딩 화면 controller를 통해 호출
	5) ajax 처리 및 호출 controller 메소드 선언
	
[1단계:개념] 2. fullcalendar의 수정 처리 프로세스의 종류와 처리방법을 기술하세요.
	1) 상세 화면/등록 화면의 기본 타이틀과 버튼 처리 (show()/hide() 처리)
	2) 수정 처리
		상세 화면에서 수정 처리
		일정 드랍 다운, 일정 시간 resize로 수정 처리
	3) 공통 form 데이터 처리 기능 메소드 선언 및 기능 메소드의 매개변수로 해당 기능 할당 처리
	4) $("form").attr("action", ...)
		$("form").submit()
	
[1단계:개념] 3. 스프링의 이용한 session 처리 방법을 기술하세요.
	1) servlet
		메소드(HttpServletRequest request)
		HttpSession session = request.getSession()
		session.setAttribute("세션키", 세션처리객체)
	2) spring
		@SessionAttribute("세션명")
		@Controller
			@ModelAttribute("세션명")
			public 객체명 get객체(){
				return 객체명
			}
			
			public String 메소드명(@ModelAttribute("세션명") 객체 참조){}

[1단계:확인] 4. 기존의 member테이블을 이용하여 ajax로 회원등록여부와 로그인 session 처리를 하세요.
	1) sql
		SELECT count(*)
		FROM member
		WHERE id = #{id}
		
		SELECT *
		FROM member
		WHERE id = #{id}
		AND pass = #{pass}
		
	2) vo
		member 공통 mybatis 등록
		
	3) dao/mapper/service
		public int checkMember(int id);
		public Member getMember(int id);
		
		mapper
		
		springweb.a02_mvc.a03_dao.MemberDao
		<select id="checkMember" parameterType="int" resultType="int">
			SELECT count(*)
			FROM member
			WHERE id = #{id}
		</select>
		<select id="getMember" parameterType="int" resultType="member">
			SELECT *
			FROM member
			WHERE id = #{id}
			AND pass = #{pass}
		</select>
		
	4) controller
		회원가입화면/ajax 처리
		로그인처리화면
		
	5) controller단 session 처리
	
	6) view(jsp)
		회원가입 화면에서 jquery ajax를 통해 회원가입여부 처리
		로그인 화면에서 로그인 처리

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
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
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