package controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;



// MV[C] 컨트롤러
public class DispatcherServlet extends HttpServlet { //서블릿 규약(1.public이여야한다. 2.HttpServlet을 extends해야한다)


	private static final long serialVersionUID = -3613785051622608035L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	@Override
	public void init() throws ServletException {
		// 초기화, 서블릿 객체 생성
		String path = this.getInitParameter("path");
		// path: /WEB-INF/commandHandler.properties
		// System.out.println("path: " + path);
		
		String realPath = this.getServletContext().getRealPath(path);
		// realpath : D:\Class\Workspace\JSPClass\.metadata\
		// .plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\
		// jspPro\WEB-INF\commmandHandler.properties
		// System.out.println("realPath : " + realPath);

		Properties prop = new Properties();
		try(FileReader reader = new FileReader(realPath)){
			prop.load(reader);
			// handler.ListHandler
			// System.out.println(prop.getProperty("/perform/list.do"));
		} catch (Exception e) {
			throw new ServletException();
		}
		// commandHandlerMap <- 엔트리 (요청URL key, 커멘드 핸들러 객체 value)
		Set<Entry<Object,Object>> set = prop.entrySet();
		Iterator<Entry<Object,Object>> ir = set.iterator();
		while(ir.hasNext()) {
			Map.Entry<Object, Object> entry = ir.next();
			String url = (String)entry.getKey();
			String className = (String)entry.getValue();
			try {
				//클래스이름만 가지고 클래스 생성
				Class<?> commandHandlerClass = Class.forName(className);
				CommandHandler commandHandler = (CommandHandler) commandHandlerClass.newInstance();

				this.commandHandlerMap.put(url, commandHandler);
			} catch(ClassNotFoundException | InstantiationException | IllegalAccessException e){
				e.printStackTrace();
			}

		}
	}


	@Override
	public void destroy() {
		// 서블릿 객체 소멸
		super.destroy();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		// System.out.println(requestURI);
		// http://localhost/timeticket/perform/list.do
		String contextPath = request.getContextPath();
		requestURI = requestURI.replace(contextPath, "");
		// System.out.println(requestURI);
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(viewPage != null) {
			// 포워딩 
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}





}
