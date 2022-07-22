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
07-22
[1단계:개념] 1. 페이징 처리의 기본 속성을 처리하는 순서를 기술하고, 해당 속성이 처리되는 형식을 표기하세요.
	1) sql 작성
		select rownnum
		from ...
		where rownum between 1 and 5
		5개씩 1 page인 경우 1~5
			2 page인 경우 6~10
			3 page인 경우 11~15
			...
		
		SELECT count(*)
		FROM board;
		
		select *
		from (
		select rownum cnt, level, b.*
		from board b
		WHERE 1=1
		start with refno = 0
		connect by prior no = refno
		order siblings by no desc)
		WHERE cnt BETWEEN 1 AND 5;
		하단의 속성을 처리한 boardsch vo 생성
		
		dao
			public List<Board> totCnt(BoardSch sch);
		mapper
			총 건수 sql 처리
			
			select *
			from(
			select rownum cnt, level, b.*
			from board b
			WHERE 1=1
			<if test="subject != null">
				AND subject LIKE '%' || #{subject} || '%'
			</if>
			<if test="writer != null">
				AND writer LIKE '%' || #{writer} || '%'
			</if>
			start with refno = 0
			connect by prior no = refno
			order siblings by no desc)
			WHERE cnt BETWEEN 1 AND 5
		
			<select id="totCnt" parameterType="boardsch">
				SELECT count(*)
				FROM board
				WHERE 1=1
				<if test="subject != null">
					AND subject LIKE '%' || #{subject} || '%'
				</if>
				<if test="writer != null">
					AND writer LIKE '%' || #{writer} || '%'
				</if>
			</select>
		
	2) 검색 시 필요한 속성을 vo로 설정
		# 기본 페이징 속성
			전체 건수 count
			한 번에 보여줄 건수 : pageSize
			총 페이지 수 : pageCount
			클릭한 현재 페이지번호 : curPage
			해당 페이지의 시작번호 : start
			해당 페이지의 마지막 번호 : end
		
		# 페이지 블럭 처리
			하단에 한 번에 보여줄 block의 크기 : blockSize
			block의 시작번호 : startBlock
			block의 마지막번호 : endBlock
	3) service단 로직 처리
		1. 전체 데이터 건수 설정
		sch.setCount(dao.totCnt(sch));
		System.out.println("총 건수 : " + sch.getCount());
		2. 선언한 한 번에 보여줄 데이터 건수 (요청값)
			초기 화면을 대비하여 한 번에 보여줄 데이터 건수를 선언
		if(sch.getPageSize() == 0) {
			sch.setPageSize(5);
		}
		3. 총 페이지 수 : (데이터 건수) / (한 번에 보여줄 데이터 건수)  [1][2][3][4]
			ex) 18/5 ==> 3
			ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환 4를 총 페이지 수로 처리
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		4. 클릭한 현재 페이지 번호 (요청값)
			[1] ==> 1~5
			[2] ==> 6~10
			[3] ==> 11~15
			[4] ==> 16~18
			초기에 화면은 0으로 처리되기 때문에 default 값을 1로 처리한다.
			if(sch.getCurPage() == 0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage() > sch.getPageCount()) {
				sch.setCurPage(sch.getPageCount());
			}
			블럭 단위로 next를 눌렀을 때, curpage가 증가되는 것을 방지
		5. 마지막번호(현재페이지 * 한번에보여줄데이터건수)
			int end = sch.getCurPage() * sch.getPageSize();
			if(end >= sch.getCount()) { // 총 데이터 건수보다 크면
				sch.setEnd(sch.getCount());
			}else {
				sch.setEnd(end);
			}
		
		sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
				1	(1-1) * 5+1 : 1
				1	(2-1) * 5+1 : 6
				1	(3-1) * 5+1 : 11
		
			하단에 <이전		이후> 블럭 처리
			1. 블럭의 크기 지정
				sch.setBlockSize(5);
			2. 블럭의 번호 지정
				1번 블럭		[1] ... [5]
				2번 블럭		[6] ... [10]
				3번 블럭		[11] ... [15]
			int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		
		
			int endBlock = blocknum * sch.getBlockSize();
			if(endBlock >= sch.getPageCount()) {
				endBlock = sch.getPageCount();
			}
			sch.setEndBlock(endBlock);
			sch.setStartBlock((blocknum - 1) * sch.getBlockSize() + 1);

			요청값을 넘기고, 객체(ArrayList<Board>)를 받는 처리
			return dao.boardList(sch);
			
[1단계:개념] 2. 페이징 처리 시 default 설정이 필요한 속성과 이유를 기술하세요.

	CurPage(현재 페이지) 속성은 초기화면에 0이기 때문에 default값을 1로 설정해주어야 한다.


[1단계:개념] 3. 페이지 처리에 있어 예외적인 데이터로 인해 조건 처리하는 내용을 기술하세요.

		int end = sch.getCurPage() * sch.getPageSize();
		if(end >= sch.getCount()) { // 총 데이터 건수보다 크면
			sch.setEnd(sch.getCount());
		}else {
			sch.setEnd(end);
		}
		
			마지막 페이지 설정(초과되지 않게)

		int endBlock = blocknum * sch.getBlockSize();
		if(endBlock >= sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		
			마지막 블럭 설정(초과되지 않게)

[1단계:개념] 4. 페이지 처리에 화면단 요청값에 대한 처리 내용과 방법을 기술하세요.

		function goPage(cnt){
			$("[name=curPage]").val(cnt);
			$("form").submit();
		}
		
			요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달
		
		
[1단계:개념] 5. fullcalendar api의 환경 설정 순서를 기술하세요.

	0) 초기화면 로딩
	1) DB		
	2) 초기화면 구성
	3) 등록 처리
	4) 수정 처리
	5) 삭제 처리

[1단계:개념] 6. emp 테이블의 list를 ajax 데이터로 가져오는 추가 controller을 선언하고 출력하세요.

	

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