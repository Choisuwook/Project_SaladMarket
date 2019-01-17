package jdbc.util;

import java.sql.*;

/**
 *  오라클 데이터베이스에 연결되어질 Connection 객체를 생성해서
 *  리턴 시켜주는 클래스
 */

public class DBConnection {

	// static 멤버변수(클래스 멤버변수)로 지정하여 DBConnection 클래스를 사용하겠다고 하는순간
	// DBConnection 클래스의 객체를 생성하지 않아도 static 멤버변수(클래스 멤버변수)는 생성되어진다.
	
	// >>>> 1. 오라클 드라이버  <<<<
		private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
		
	// >>>> 2. 오라클 서버의 물리적 주소  <<<<
		private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
	// >>>> 3. 오라클 서버에 연결할 계정명  <<<<
		private static final String USER = "myorauser";
	
	// >>>> 4. 오라클 서버에 연결할 계정의 암호  <<<<
		private static final String PASSWORD = "eclass";

	// >>>> 5. 오라클 서버에 연결해주는 Connection 객체 받아오기
	
	// **** singleton 패턴에서 중요한 것은 다음 세 가지이다.**** //
	// ==>첫번째, 멤버변수의 접근제한자를 private 으로 하여 외부 클래스에서는 직접적으로 접근이 불가하게 한다.
	//          또한 static 멤버변수로 지정하여 Connection 클래스를 사용할때 객체생성은 딱 1번만 생성된다.	
		private static Connection conn = null;
		
	///// ***** static 초기화 블럭 ***** /////
		/*  DBConnection 클래스를 사용하겠다고 하는순간 
		    DBConnection 클래스의 객체를 생성하지 않아도 static 초기화 블럭은 딱1번만 실행되어지는 부분이다.
		 */
		static{ 
			System.out.println("==> 확인용 DBConnection 스태틱 초기화 블럭 시작함!! ");
		// <1>. 오라클 드라이버 로딩
			try {
				Class.forName(DRIVER);
			
			
		// <2>. 오라클 DB 서버와 연결해주는 객체 생성하기. 즉, Connection 객체 생성하기
			// conn 의 값이 null 이거나 close 된 상태이라면 새롭게 conn 의 값을 만들어준다.
				if(conn==null || conn.isClosed() ) {
					// conn.isClosed() 은  conn 이 닫혀있으면 true, conn 이 열려있으면 false 를 리턴해준다.
					 
				   conn = DriverManager.getConnection(URL, USER, PASSWORD);
				}
				
			} catch (ClassNotFoundException e) {
				System.out.println("오라클 드라이버 로딩 실패!! ojdbc6.jar 파일이 없습니다.");
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		} // static 초기화 블럭 끝 -----------
			
	
	
	// ==>두번째, 생성자에 접근제한자로 private 를 지정하여, 외부에서 절대로 인스턴스를 생성하지 못하게 한다.
		private DBConnection() { }	
		
		
	// ==> 세번째, static 한 getConn() 메소드를 통해서만 외부에서 해당 클래스의 객체를 가져갈 수 있도록 한다.
	    public static Connection getConn() {
	        System.out.println(">>> 확인용 DBConnection 스태틱 메소드 getConn() 호출함 !!");
	    	return conn;
	    }	
		
		
	// <3>. DB와 연결하려고 사용하였던 객체 conn 닫아주기
		public static void close() {
			if(conn==null)
				return;
			
			try {
				if(!conn.isClosed()) // conn 이 열려있으면
					conn.close();    // conn 을 닫아준다.
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			conn = null; // conn 의 값을 초기화 시키기
			
		}// end of close() --------------------------------
		
}// end of class DBConnection ////////////////
