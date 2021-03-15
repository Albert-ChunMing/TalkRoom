package control;
import java.io.IOException;
import java.util.ArrayList;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
@ServerEndpoint("/mywebsocket")
public class MyWebSocket {
    //用來存放WebSocket已連接的Socket
    static ArrayList<Session> sessions;
    String allmsg="";
    @OnMessage
    //String message搭配boolean last可分段接收client傳過來的String(用以對付超長String)   Session session是選擇性的參數
    public void onMessage(String message, boolean last, Session session) throws IOException,
            InterruptedException, EncodeException {    	
    	if(!last) {
    		allmsg+=message;
    	}else {
    		allmsg+=message;
    		//在Json String中增加訪客人數
        	Integer guestNumber=allmsg.substring(allmsg.length()-7,allmsg.length()-2 ).equals("離開聊天室")? sessions.size()-1:sessions.size();       	
        	allmsg="{"+allmsg.substring(1, allmsg.length()-1)+",\"number\":\""+guestNumber+"\"}";        	
            //session.getBasicRemote().sendText("Hello world Mr. " + message);
            for (Session s : session.getOpenSessions()) {
            //for (Session s : sessions) {    //對每個連接的Client傳送訊息
                if (s.isOpen()) {
                    s.getBasicRemote().sendText(allmsg);
                }
            }
            allmsg="";
    	}
    }
 
    @OnOpen
    public void onOpen(Session session) {
        //紀錄連接到sessions中
        System.out.println("Client connected");        
        if (sessions == null) {
            sessions = new ArrayList<Session>();
        }
        sessions.add(session);
        System.out.println("Current sessions size: " + sessions.size());
    }
 
    @OnClose
    public void onClose(Session session) {
        //將連接從sessions中移除
        System.out.println("Connection closed");
        sessions.remove(session);
        System.out.println("Current sessions size: " + sessions.size());
    }
}
