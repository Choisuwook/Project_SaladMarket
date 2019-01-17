package admin.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.AES256;
import jdbc.util.SHA256;
import member.model.MemberVO;
import my.util.Mykey;

public class AdminDAO implements InterAdminDAO {
	private DataSource ds = null;
	//객체변수 ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	AES256 aes = null;
	
	/*
	 === MemberDAO 생성자에서 해야할일 ===
	 
	  아파치톰캣이 제공하는 DBCP 객체인 ds 를 얻어오는 것이다.
	 */
	public AdminDAO() {
	try {
		
		Context initContext = new InitialContext();
		Context envContext;
		envContext = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");// web.xml , context.xml_name. 풀장을 땡겨온것.
		String key = Mykey.key; // 암호화 , 복호화 키 
		aes = new AES256(key);
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}catch (NamingException e) {
		e.printStackTrace();
	}
	}// end of 생성자
// === 사용한 자원을 반납하는 close()메소드 생성하기 ===
public void close() {
	try {
		if(rs !=null) {
			rs.close();
			rs = null;
		}
		if(pstmt!=null) {
			pstmt.close();
			pstmt = null;
		}
		if(conn !=null) {
			conn.close();
			conn = null;
		}
		
	}catch(SQLException e){
		
	}
}
	// ** 관리자 로그인 메소드 **
	@Override
	public boolean getLogin(String adminId, String adminPwd) throws SQLException {
		boolean flag = false;		
		try {
<<<<<<< HEAD

				conn = ds.getConnection();
		
				String sql = " select adminid,adminpw\n"+
						" from admin \n"+
						" where adminid = ? and adminpw = ? ";

				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, adminId);
				//pstmt.setString(2,SHA256.encrypt(adminPwd));
				pstmt.setString(2, adminPwd);
=======
				conn = ds.getConnection();
		
				String sql = " select dminid,adminpw "
							+" from login "
							+" where dminid = ? and adminpw = ? "; 
	
				
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, adminId);
				pstmt.setString(2,SHA256.encrypt(adminPwd));
				
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
				rs = pstmt.executeQuery();				
				boolean bool = rs.next();
				if(bool){//회원이 존재하는 경우=> 로그인이 되었을 경우
					flag = true;
				}			
		} finally {
			close();
		}
		return flag;
	}

}
