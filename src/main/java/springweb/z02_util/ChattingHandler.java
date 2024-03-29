package springweb.z02_util;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("chatHandler")
public class ChattingHandler extends TextWebSocketHandler{
	// 서버로 접속한 계정을 저장하는 필드 선언
	private Map<String, WebSocketSession> users = new ConcurrentHashMap();


	// 1. 접속 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 각 client를 추가 처리
		users.put(session.getId(), session);
		log(session.getId() + "님 접속합니다! 현재 접속자 수 : " + users.size());
	}
	
	// 2. 메세지 전송 시
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// client가 아래 형식으로 전송을 하면 여기서 메세지를 받는다.
		log(session.getId() + "에서 온 메세지 : " + message.getPayload());
		// 현재 접속한 모든 사람들에게 메세지 전송
		for(WebSocketSession ws:users.values()) {
			// 1. 각 접속한 클라이언트에게 메세지 전달
			//		"msg:himan:연결 접속했습니다."
			ws.sendMessage(message);
			log(ws.getId() + "에게 전달한 메세지 : " + message.getPayload());
		}
	}

	// 3. 접속 종료 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 1. 등록된 사용자에서 제거 처리
		users.remove(session.getId());
		log(session.getId() + "접속 종료합니다.");
	}
	
	// 4. 에러 발생 시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + "에러 발생! 에러 내용 : " + exception.getMessage());
	}
	private void log(String msg) {
		System.out.println("# 소켓 채팅 #" + new Date() + " : " + msg);
	}
	
}
