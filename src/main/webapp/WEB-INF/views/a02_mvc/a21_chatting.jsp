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
   #chatArea{
   		width:80%; height:200px; overflow-y:auto; text-align:left;
   		border:1px solid green;
   }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	var wsocket;
   $(document).ready(function(){
		$("#enterBtn").click(function(){
			if(confirm("채팅방 접속합니다.")){
				conn();
			}
		})
		
		// 아이디 입력 후 enter 키를 입력시도 접속
		$("#id").keyup(function(){
			if(event.keyCode==13){
				conn();
			}
		})
		
		$("#exitBtn").click(function(){
			if(confirm("접속을 종료하시겠습니까?")){
				wsocket.send("msg : " + $("#id").val() + " : 접속을 종료했습니다.")
				wsocket.close();
				// 서버 handler - public void afterConnectionClosed() 와 연동
			}
		})
      <%-- 
      
      --%>   
   });
   function conn(){
		wsocket = new WebSocket("ws:localhost:7080/${path}/chat-ws.do")
		wsocket.onopen=function(evt){ // 접속하는 핸들러 메소드와 연결
			console.log(evt)
			// 능동적으로 소켓 통신을 통해 메세지를 보내는 것
			wsocket.send("msg : " + $("#id").val() + " : 연결 접속했습니다.")
			// "msg : himan:연결 접속했습니다."
			//  msg : 전송자 : 메세지명
			//  msg : 그룹명 : 전송자:메세지 (단일 chatting / 그룹 chatting)
		}
		// 메세지를 받을 때 처리되는 메소드
		// 서버에서 push 방식으로 메세지를 전달 받는다
		/*
		# 참고
		1. webstorage 활용
			1) 메세지 내용 임시 저장
			2) 로그인한 id 임시 저장
		*/
		wsocket.onmessage=function(evt){
			var msg = evt.data
			console.log(msg)
			if(msg.substring(0,6)=="msg : "){
				// msg : 그룹명 : 전송자 : 메세지 (단일 chatting / 그룹 chatting)
				// 그룹에 해당할 때만 메세지를 받아서 처리하게 처리
				
				
				// msg: 를 제외한 모든 문자열을 추출
				var revMsg = msg.substring(6)
				
				console.log("# 메세지 받기 #")
				console.log(msg)
				$("#chatMessageArea").append(revMsg + "<br>")
				
				// 자동 scrolling 처리 로직
				// 1. 전체 charMessageArea의 입력된 최대 높이 구하기
				var mx = parseInt($("#chatMessageArea").height())
				// 2. 포함하고 있는 div의 scrollTop을 통해 최대한 내용으로 scrolling 하기
				$("#charArea").scrollTop(mx);
			}
		}
		// 접속을 종료 처리할 때
		wsocket.onclose=function(){
			alert($("#id").val() + " 접속 종료합니다.")
			$("#chatMessageArea").val("")
			$("#id").val("").focus();
		}
   }
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>채팅화면</h2>

</div>
<div class="container">
      	<div class="input-group mb-3">
         	<div class="input-group-prepend">
            	<span class="text-center input-group-text">아이디</span>
         	</div>
         	<input id="id" class="form-control" placeholder="접속할 아이디를 입력하세요."/>
         	
         	<button type="button" id="enterBtn" class="btn btn-success">채팅 입장</button>
			<button type="button" id="exitBtn" class="btn btn-danger">나가기</button>
      	</div>

      <div class="input-group mb-3">
         <div class="input-group-prepend">
            <span class="text-center input-group-text">내 용</span>
         </div>
         <div id="chatArea" class="input-group-prepend">
         	<div id="chatMessageArea"></div>
         </div>
      </div>
      
		<div class="input-group mb-3">
	         <div class="input-group-prepend">
	            <span class="text-center input-group-text">메세지</span>
	         </div>
	         <input id="msg" class="form-control" placeholder="보낼 메세지를 입력하세요." />  
			<button type="button" id="sndBtn" class="btn btn-info">메세지 전송</button>
		</div>
		<script type="text/javascript">
			// 엔터 키 입력 시에 메세지 전송
			$("#msg").keyup(function(){
				if(event.keyCode==13){
					wsocket.send("msg : " + $("#id").val() + " : " + $(this).val())
					$(this).val("").focus()
				}
			})
			
			// 전송 버튼 클릭 시에 메세지 전송
			$("#sndBtn").click(function(){
				wsocket.send("msg : " + $("#id").val() + " : " + $("#msg").val())
				$("#msg").val("").focus()
			})
			
		</script>
		
      <div class="text-right">
		<button type="button" onclick="updateProc()" class="btn btn-success">수정</button>
		<button type="button" onclick="deleteProc()" class="btn btn-danger">삭제</button>
		<button type="button" onclick="replyProc()" class="btn btn-warning">답글</button>
		<button type="button" onclick="goMain()" class="btn btn-info">메인화면</button>
      </div>
</div>
</body>
</html>