package common.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "C:/semi-project/saladmarket/WebContent/WEB-INF/Command.properties")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	HashMap<String, Object> cmdMap = new HashMap<String, Object>();
	
	/*public void init(ServletConfig config) throws ServletException {
		// *** 확인용 *** 
		System.out.println("확인용 => FrontController 의 init(ServletConfig config)메소드가 실행됨");
		
		웹 브라이저 주소창에서 *.do 를 하면 FrontController 서블릿이 받는데 맨 처음에 자동적으로 실행되어지는 메소드가
		 init(ServletConfig config)이다.  그런데 이 메소드는WAS(톰캣 서버)가 구동되어진 후 딱 1번만 수행되어지고, 그 이후에는 수행되지 않는다. 
		
		String props = config.getInitParameter("propertyConfig");
		//C:\\myjsp\\MyMVC\\WebContent\\WEB-INF 값을 읽어온다
		//초기화 파라미터 데이터값인 "C:\\myjsp\\MyMVC\\WebContent\\WEB-INF"을 가져와서 String props 변수에 저장시켰다.
		
		//확인용
		//System.out.println("초기화 파라미터 데이터값이 저장된 파일명 (prop): "+props);
		
		Properties pr = new Properties();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(props);
			pr.load(fis);
			
			 fis 가 C:/myjsp/MyMVC/WebConten/WEB-INF/ Command.properties 파일을 읽어오면
			 Properties 클래스의 객체인  pr 에 로드시킨다.
			 그러면 pr 은 읽어온 파일(Comman.properties)의 내용에서 '=' 을 기준으로 
			 왼쪽은 key 로보고 오른쪽은 value로 인식해준다.
			  
			
			String str_className = pr.getProperty("/test1.do");
			System.out.println("<<확인용>> key가 /test1.do 인 value 값 :"+str_className);
			Class<?> cls = Class.forName(str_className);
			Object obj = cls.newInstance();//실제로 객체를 생성한다.
			
			cmdMap.put("/test.do", obj);
			
			 Enumeration<Object> en =  pr.keys();//모든 키를 읽어온다
			 
			  pr.keys 은 C:/myjsp/MyMVC/WebConten/WEB-INF/ Command.properties 파일의 내용물에서
			  '='을 중심으로 왼쪽에 있는 키들만 읽어온다. 
			   
			 while(en.hasMoreElements()) { // 키가 있다면
				 String key_urlcmd = (String)en.nextElement();// 실제 키를 얻어온다
				 String className =  pr.getProperty(key_urlcmd);//value값을 불러온다.
				 if(className !=null) {
					 className = className.trim();
					 Class<?> cls = Class.forName(className);
					 Object obj = cls.newInstance();//실제로 객체를 생성한다.
					 cmdMap.put("key_urlcmd ", obj);
				 }*/
	public void init(ServletConfig config) 
			throws ServletException {
			
			// *** 확인용 *** //
			System.out.println("확인용 ==> 서블릿 FrontController 의  init(ServletConfig config) 메소드가 실행됨.");
			/*
			   웹브라우저 주소창에서 *.do 를 하면  FrontController 서블릿이 받는데 
			   맨 처음에 자동적으로 실행되어지는 메소드가 init(ServletConfig config) 이다.
			   그런데 이 메소드는 WAS(톰캣서버)가 구동되어진 후 딱 1번만 수행되어지고, 그 이후에는 수행되지 않는다. 
			 */
			
			String props = config.getInitParameter("propertyConfig");
			// 초기화 파라미터 데이터 값인 "C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties" 을 
			// 가져와서 String props 변수에 저장시켰다.
			
			// *** 확인용 *** //
			System.out.println("<<확인용>> 초기화 파라미터 데이터 값이 저장된 파일명 props => " + props);
			// <<확인용>> 초기화 파라미터 데이터 값이 저장된 파일명 props => C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties
			
			Properties pr = new Properties();
			
			FileInputStream fis = null;
			
			try {
				fis = new FileInputStream(props);
				
				pr.load(fis);
				/*
				  C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일을 읽어다가 
				  Properties 클래스의 객체인 pr 에 로드시킨다. 
				  그러면 pr 은 읽어온 파일(Command.properties)의 내용에서
				  = 을 기준으로 왼쪽은 키로 보고, 오른쪽은 value 로 인식한다.
				*/
				
			/*	===========================================
				String str_className = pr.getProperty("/test1.do");
				                                   // "/test1.do" 이 key 이다.
				// *** 확인용 *** //
				System.out.println("<<확인용>> key가 /test1.do인 value => " + str_className);
				// <<확인용>> key가 /test1.do인 value => test.controller.Test1Controller 
				
				Class<?> cls = Class.forName(str_className);
				Object obj = cls.newInstance();
				
				cmdMap.put("/test1.do", obj);
			    ===========================================
			*/
				
				Enumeration<Object> en = pr.keys();
				/*
				    pr.keys(); 은 
				    C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용물에서 
				    '=' 을 기준으로 왼쪽에 있는 모든 key 들만 읽어오는 것이다.
				 */
				
				while(en.hasMoreElements()) {
					/*
					Enumeration : 속성 목록에 있는 모든 속성의 key값들을 열거형 객체로 반환(구버전)
					hasMoreElements() : 다음요소가 있는 지 확인하고
					nextElement() : 요소를 가져온다.
					Iterator : 컬렉션에 저장된 요소를 읽어오는 방법(신버전)
					hasNext() : 데이터가 있는지 확인한다.
					next() : 데이터를 가져온다.
					remove() :  Iterator가 가르키고있는 컬렉션 원본에 있는걸 지움.
					 */
					String key_urlcmd = (String)en.nextElement();
					String className = pr.getProperty(key_urlcmd);
					
					if(className != null) {
						className = className.trim();
						Class<?> cls = Class.forName(className);
						Object obj = cls.newInstance();
						
						cmdMap.put(key_urlcmd, obj);
					}
					
				}// end of while----------------------------
				
		 }catch (ClassNotFoundException e) {
			System.out.println("클래스가 없습니다.");
			e.printStackTrace();
		 }catch (InstantiationException e) {
			e.printStackTrace();
		 }catch (FileNotFoundException e) {
			System.out.println("C:/myjsp/MyMVC/WebConten/WEB-INF/ Command.properties 파일이 없습니다");
			e.printStackTrace();
		 }catch (IOException e) {
			e.printStackTrace();
	     }catch(Exception e) {
			e.printStackTrace();
		 }
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		requestProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request,response);
		
	}
	private void requestProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
			// 웹브라우저상의 주소입력창에서 
			// http://localhost:9090/MyMVC/test2.do?name=홍길동&addr=서울 
			// 와 같이 입력되었더라면 
			
		//	String url = request.getRequestURL().toString();
			// url은 http://localhost:9090/MyMVC/test2.do 이다.
			
			String uri = request.getRequestURI();
			// uri는 /MyMVC/test2.do 이다.
			
			String ctxPath = request.getContextPath();
			// ctxPath 는 /MyMVC 이다.
			
			String mapKey = uri.substring(ctxPath.length());
			// mapKey 는  /test2.do 이다.
			
			AbstractController action = (AbstractController)cmdMap.get(mapKey);
			
			if(action == null) {
				System.out.println(mapKey + " URL 패턴에 매핑된 객체가 없습니다.");
				return;
			}
			else {
				try {
					action.execute(request, response);
					
					String viewPage = action.getViewPage();
					boolean bool = action.isRedirect();
					
					if(bool) {
						// VIEW단 페이지를 sendRedirect 방법으로 이동시킨다.
						response.sendRedirect(viewPage);
					}
					else {
						// VIEW단 페이지를 forward 방법으로 이동시킨다.
						RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
						dispatcher.forward(request, response);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			 
			
		}
		
		

	}
