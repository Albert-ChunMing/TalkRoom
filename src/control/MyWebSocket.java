package control;

import java.io.IOException;
import java.util.ArrayList;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.google.gson.Gson;

import model.UserMessage;

@ServerEndpoint("/mywebsocket")
public class MyWebSocket {
	// 用來存放WebSocket已連接的Socket
	static ArrayList<Session> sessions;
	static ArrayList<String> usernames = new ArrayList<String>();
	String allmsg = "";

	@OnMessage
	// String message搭配boolean last可分段接收client傳過來的String(用以對付超長String) Session
	// session是選擇性的參數
	public void onMessage(String message, boolean last, Session session)
			throws IOException, InterruptedException, EncodeException {
		if (!last) {
			allmsg += message;
		} else {
			allmsg += message;
			// 紀錄目前在線上的訪客姓名與人數
			if (allmsg.substring(13, 15).equals("系統")) {
				Gson gson = new Gson();
				UserMessage um = gson.fromJson(allmsg, UserMessage.class);
				int msglenth = um.getMessage().length();
				if (um.getMessage().substring(msglenth - 5, msglenth).equals("進入聊天室")) {
					usernames.add(um.getMessage().substring(0, um.getMessage().length() - 6));
				} else if (um.getMessage().substring(msglenth - 5, msglenth).equals("離開聊天室")) {
					usernames.remove(um.getMessage().substring(0, um.getMessage().length() - 6));
				}
				String gestnames = "";
				for (String s : usernames) gestnames += s + "\n";
				um.setGuestNames(gestnames);
				um.setGuestNumbers(usernames.size());
				System.out.println("目前訪客: \n"+um.getGuestNames());
				for (Session s : session.getOpenSessions()) {
					if (s.isOpen()) {
						s.getBasicRemote().sendText(gson.toJson(um));
					}
				}
			} else {
			//非系統發話時 訊息直接傳給每個session
				for (Session s : session.getOpenSessions()) {
					// for (Session s : sessions) { //對每個連接的Client傳送訊息
					if (s.isOpen()) {
						s.getBasicRemote().sendText(allmsg);
					}
				}
			}
			allmsg = "";
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// 紀錄連接到sessions中
		System.out.println("Client connected");
		if (sessions == null) {
			sessions = new ArrayList<Session>();
		}
		sessions.add(session);
		System.out.println("Current sessions size: " + sessions.size());
	}

	@OnClose
	public void onClose(Session session) {
		// 將連接從sessions中移除
		System.out.println("Connection closed");
		sessions.remove(session);
		System.out.println("Current sessions size: " + sessions.size());
	}
}
