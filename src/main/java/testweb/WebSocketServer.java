package testweb;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 *                 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/websocket")
public class WebSocketServer {
	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int sessionCount = 0;
	private static Logger log = LoggerFactory.getLogger(WebSocketServer.class);

	@OnOpen
	public void onOpen(Session session) {
		addSessionCount(); // 在线数加1
		log.debug("有新连接加入！当前在线人数为" + sessionCount);
	}

	@OnClose
	public void onClose() {
		delSessionCount(); // 在线数减1
		log.debug("有一连接关闭！当前在线人数为" + sessionCount);
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		log.debug("来自客户端的消息:" + message);
		try {
			session.getAsyncRemote().sendText("Echo from Server:" + message);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	@OnError
	public void onError(Session session, Throwable e) {
		log.debug("发生错误");
		log.error(e.getMessage(), e);
	}

	public static synchronized void addSessionCount() {
		sessionCount++;
	}

	public static synchronized void delSessionCount() {
		sessionCount--;
	}
}