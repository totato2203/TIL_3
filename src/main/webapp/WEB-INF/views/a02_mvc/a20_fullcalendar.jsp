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

<link href='${path }/a00_com/lib/main.css' rel='stylesheet' />
<script src='${path }/a00_com/lib/main.js'></script>

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
// document.addEventListener('DOMContentLoaded', function() {
// $(document).ready(function(){});
// 1. calendar 처리할 객체 지정 : var calendarEl = document.getElementById('calendar')
//		<div id='calendar'></div>
// 2. fullcalendar 객체 생성
//		var calendar = new FullCalendar.Calendar(calendarEl,
//		{속성 : 속성값, ...});
//	1) 주요 속성
//		headerToolbar : 타이틀 부분 레이아웃 설정
//		initialDate : 초기 화면 날짜를 지정
//		select:function(arg){
//			초기에 특정한 날짜를 클릭하거나, 시간을 스크롤 했을 때 : 입력 처리 화면
//			arg : 기본 정보를 가지고 있다. 시작/마지막 날짜, 전체일정/시간일정
//			arg.start, arg.end, arg.allDay
//		}
/*
		특정한 data-target="#exampleModalCenter"로 된 DOM을 클릭 시 모달창이 로딩된다.
		<h2 data-toggle="modal" id="modalBox" style="display:none;"
		data-target="#exampleModalCenter">모달창 로딩</h2>
    	  */

   $(document).ready(function(){
      <%-- 
      
      --%>   
   });
</script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2022-07-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	  
		// 모달창의 타이틀명
		$("#exampleModalLongTitle").text("일정등록");
		$("#modalBox").click(); // 팝업창 로딩 : 이벤트를 하지 않더라도 코드에 의해 강제 실행 처리
		console.log("fullcalendar 데이터")
		console.log(arg)
		console.log(arg.start)
		console.log(arg.end)
		console.log(arg.color) // 입력으로 넣을 예정
		console.log(arg.textColor) // 입력으로 넣을 예정
		console.log(arg.allDay)
		// arg.start.toISOString() : GMT 기준 시간으로 나온다.
		$("#frm01 [name=start]").val(arg.start.toISOString())
		$("#frm01 [name=end]").val(arg.end.toISOString())
		
		// 내용은 추가적으로 넣을 예정

      },
      // 있는 데이터를 클릭 시, (상세 내용을 보고 수정/삭제)
      eventClick: function(arg) {
    	var event = arg.event;
  		console.log("#상세 내역#")
    	console.log(event)
    	console.log(event.title)
  		console.log(event.start)
  		console.log(event.end)
  		console.log(event.backgroundColor) // 입력으로 넣을 예정
  		console.log(event.textColor) // 입력으로 넣을 예정
  		console.log(event.allDay)
  		console.log(event.extendedProps.content)
    	
    	if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info, successCallback, failureCallback){
    	  // http://localhost:7080/springweb/calendar.do callist
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/calList.do",
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data.callist)
    			  successCallback(data.callist)
    		  },
    		  error:function(err){
    			  console.log(err)
    		  }
    	  })
      }
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>

<body>
<div id='calendar'></div>
<h2 data-toggle="modal" id="modalBox", 
	data-target="#exampleModalCenter">모달창 로딩</h2>

<!--
특정한 data-target="#exampleModalCenter"로 된 DOM을 클릭 시 모달창이 로딩된다.

style="display:none;"
모달 창 로딩 -->
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
				<form id="frm01" class="form"  method="post">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control"  data-bs-toggle="tooltip" title="제목 입력" name="title">
						</div>
						<div class="col">
							<select type="text" class="form-control"  data-bs-toggle="tooltip" title="종일 여부" name="allDay">
								<option value="0">시간</option>
								<option value="1">종일</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" placeholder="시작일" name="start">
						</div>
						<div class="col">
							<input type="text" class="form-control" placeholder="종료일" name="end">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="color" class="form-control"  data-bs-toggle="tooltip" title="배경색상"
								value="#0099cc" name="backgroundColor">
						</div>
						<div class="col">
							<input type="color" class="form-control"  data-bs-toggle="tooltip" title="글자색상"
								value="#ccffff" name="textColor">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<textarea name="content" rows="7" class="form-control" 
								data-bs-toggle="tooltip" title="내용"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="regBtn" class="btn btn-primary">일정등록</button>
			</div>
			<script type="text/javascript">
				$("#regBtn").click(function(){
					if(confirm("등록하시겠습니까?")){
						$("#frm01").attr("action", "${path}/calInsert.do");
						$("#frm01").submit();
					}	
				})
			</script>
		</div>
	</div>
</div>
</body>
</html>