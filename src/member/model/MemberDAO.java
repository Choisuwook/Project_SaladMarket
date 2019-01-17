package member.model;


import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthSeparatorUI;

import jdbc.util.AES256;
import jdbc.util.SHA256;
import my.util.Mykey;
import oracle.jdbc.OracleConnection.CommitOption;


public class MemberDAO implements InterMemberDAO {
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
	public MemberDAO() {
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
	// === 로그인 메소드 ===
	@Override
	public MemberVO loginOKmemberInfo(String userid, String pwd) throws SQLException {
		System.out.println("loginOFmemberInfo 1");
		MemberVO membervo = null;		
		try {
			conn = ds.getConnection();

			String sql = "select mnum, userid, name, email, phone, postnum, address1, address2,point \n"+
					",trunc(months_between(sysdate,last_changepwdate)) AS pwdchagnegap \n"+
					",trunc(months_between(sysdate,last_logindate)) AS lastlogingap \n"+
					", to_char(registerdate, 'yyyy-mm-dd') as registerdate \n"+
					", status,fk_lvnum \n"+
					" from member \n"+
					" where userid = ? and pw = ? ";

			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2,SHA256.encrypt(pwd));
			//pstmt.setString(2,pwd);	
			rs = pstmt.executeQuery();

			boolean bool = rs.next();
			if(bool){//회원이 존재하는 경우=> 로그인이 되었을 경우

				int mnum = rs.getInt("mnum");
				String v_userid = rs.getString("userid");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = aes.decrypt(rs.getString("phone"));
				//String phone = rs.getString("phone");
				String postnum = rs.getString("postnum");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				int point = rs.getInt("point");
				int pwdchagnegap = rs.getInt("pwdchagnegap");
				int lastlogingap = rs.getInt("lastlogingap");
				int status = rs.getInt("status");
				int fk_lvnum = rs.getInt("fk_lvnum");
				
				membervo = new MemberVO();
				
				membervo.setMnum(mnum);
				membervo.setUserid(v_userid);
				membervo.setName(name);
				membervo.setEmail(email);
				membervo.setPhone(phone);
				membervo.setPostnum(postnum);
				membervo.setAddress1(address1);
				membervo.setAddress2(address2);
				membervo.setPoint(point);
				//마지막으로 암호를 변경한 날짜가 현재시각으로부터 6개월 지났으면 true,
				//마지막으로 암호를 변경한 날짜가 현재시각으로부터 6개월 지지않았으면 false,
				if(pwdchagnegap >=6) 
					membervo.setRequirePwdChange(true);
				//마지막으로 로그인한 날짜가 현재일로부터 1년이 지났으면
				if(lastlogingap>=12) membervo.setLastlogingap(true);
				
				membervo.setStatus(status);
				membervo.setFk_lvnum(fk_lvnum);
								
				//마지막으로 로그인한 날짜시간 기록하기
				if(lastlogingap <12) {
					sql = " update member set last_logindate = sysdate \n"+
						  " where userid = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,userid);
					pstmt.executeUpdate();
				}
			}else{
				// 회원이 존재하지 않거나 탈퇴되었을 경우				
		}			
		} catch (NoSuchAlgorithmException |UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return membervo;
	}// end of MemberVO loginOKmemberInfo
	
  // === 회원가입 메소드 ===
	/*@Override
	public int registerMember(MemberVO membervo) throws SQLException{
		int result=0;
		try {
			conn = ds.getConnection();			
			conn.setAutoCommit(false);			
			int n=0;

			String sql = " insert into member(mnum,userid,name,email,phone,birthday,postnum,address1,address2,point,registerdate,last_logindate,last_changepwdate,status,summoney,fk_lvnum,pw) \n"+
					" values(seq_member_mnum.nextval,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membervo.getUserid());
			pstmt.setString(2, membervo.getName());				
			pstmt.setString(3, aes.encrypt(membervo.getEmail()));//이메일을 AES256알고르짐으로 양방향 암호화 시키기
			pstmt.setString(4, aes.encrypt(membervo.getPhone()));//휴대폰번호를 AES256알고르짐으로 양방향 암호화 시키기
			pstmt.setString(5, membervo.getBirthyyyy()+membervo.getBirthmm()+membervo.getBirthdd());
			pstmt.setString(6, membervo.getPostnum());
			pstmt.setString(7, membervo.getAddress1());
			pstmt.setString(8, membervo.getAddress2());
			pstmt.setString(9, SHA256.encrypt(membervo.getPwd()));// 암호를 SHA256 알고리즘으로 단방향 암호화 시키기";
			n = pstmt.executeUpdate();
						
			if((n) == 1) {
				conn.commit();
				return n;
			}
			else {
				conn.rollback();
				conn.getAutoCommit();
				return 0;
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return result;
	}*/
	// === *** ID 중복 검사하기를 위한 메소드 생성하기 *** ===	
	
	@Override
	public int idDuplicateCheck(String userid) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
						
			String sql = " select count(*) AS CNT \n"+
					" from member \n"+
					" where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			n = rs.getInt("CNT");
			
		} finally{
			close();
		}	
		
		return n;
	}// end of int idDuplicateCheck(String userid)---------------
	
	// ** 회원정보 페이지 비밀번화 확인해주는 메소드 **
	@Override
	public boolean checkPasswd(String userid,String password) throws SQLException {
		boolean bool = false;
		
		try {
			conn = ds.getConnection();						
			String sql = " select count(*) AS CNT \n"+
						" from member \n"+
						" where userid = ? and pw = ? ";		
			pstmt = conn.prepareStatement(sql);  			
			pstmt.setString(1,userid);
			pstmt.setString(2,SHA256.encrypt(password));
			//pstmt.setString(2,password);
			rs = pstmt.executeQuery();

			bool = rs.next();
			int n = rs.getInt("CNT");
			if(n ==1) {
				System.out.println("회원ㅈ정보 페이지 비밀번호 확인 메소드 n=1");
				bool = true;
				return bool;
			}
			else {
				System.out.println("n!=1");
				bool = false;
				return bool;
			}			
			
		} finally{
			close();
		}			
	}// end of boolean checkPasswd(String userid,String password)
	@Override
	
	// ** 회원아이디 찾기 메소드 **
	public String getUserid(String username, String phone) throws SQLException {
		conn = ds.getConnection();	
		String userid="";
		try {
			conn = ds.getConnection();						
			String sql = " select userid \n"+
						 " from member \n"+
						 " where phone = ? and name = ? ";		
			pstmt = conn.prepareStatement(sql);  			
			pstmt.setString(1,aes.encrypt(phone));
			//pstmt.setString(1,phone);
			
			pstmt.setString(2,username);			
			rs = pstmt.executeQuery();

			if(rs.next()) {								
				userid = rs.getString("userid");	

				
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			close();
		}
		return userid;
	}
	
	

	//*** 비밀번호 찾기를 위해 먼저 userid 와 email을 가지는 사용자가 존재하는지 검증해주는 추상메소드 ***
	@Override
	public int isUserExists(String userid, String email) throws SQLException{
			int n =0;
			try {
				
				conn = ds.getConnection();
					String sql = "select count(*) AS CNT "
				              +	" from member "
							  + " where status = 1 and userid = ? and email = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, aes.encrypt(email));
					//pstmt.setString(2, email);

					rs = pstmt.executeQuery();
					
					boolean isExists = rs.next();
					n = rs.getInt("CNT");
					
			}catch(UnsupportedEncodingException e) {
				
			} catch (NoSuchAlgorithmException e) {
				
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
			
				e.printStackTrace();
			} finally {
						close();
			}
		return n ;	
	}
	
	// ***암호를 새암호로 변경해주는 추상메소드 ***
	@Override
	public int updatePwdUser(String userid, String pwd)throws SQLException {

			int result = 0;
			
			try {
				conn = ds.getConnection();
				// DBCP(DB Connection Pool) 객체 ds를 통해  
							// 톰캣의 context.xml 에 설정되어진 Connection 객체를 빌려오는 것이다.
				
				String sql = " update member set pw = ?, last_changepwdate = sysdate "    		
					       + " where userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				//pstmt.setString(1, SHA256.encrypt(pwd));
				pstmt.setString(1, pwd);
				pstmt.setString(2, userid ); 				
				result = pstmt.executeUpdate();			
			} finally {
				close();
			}			
			return result;
		}//end of int updatePwdUser(String userid, String pwd)
	
	 // *** 회원 1명에 대한 정보를 보여주는 추상 메소드 *** //
	@Override
	public MemberVO getMemberOneByMnum(String userid) throws SQLException{
		MemberVO membervo = null; 		
		try {
			conn = ds.getConnection();
			// DBCP(DB Connection Pool) 객체 ds를 통해  
			// 톰캣의 context.xml 에 설정되어진 Connection 객체를 빌려오는 것이다.
			
            

			String sql = " select mnum, userid, name, email, phone, postnum, address1, address2, point,birthday \n"+
					"					 ,to_char(registerdate, 'yyyy-mm-dd') AS last_logindate \n"+
					"					 ,to_char(registerdate, 'yyyy-mm-dd') AS  last_changepwdate \n"+
					"		             ,to_char(registerdate, 'yyyy-mm-dd') as registerdate \n"+
					"                    ,status,summoney,fk_lvnum,cpname,cpnum,cpexpiredate\n"+
					"                    ,(select count (*)from (select fk_cpnum from my_coupon where fk_userid = ? )) AS cpnumCount\n"+
					"                    ,lvbenefit,lvname,lvcontents\n"+
					"    from member A join my_coupon B\n"+
					"    on A.userid = B.fk_userid\n"+
					"    join coupon C\n"+
					"    on C.cpnum = B.fk_cpnum\n"+
					"    join member_level D\n"+
					"    on A.fk_lvnum = D.lvnum\n"+
					"    where userid = ? ";
					    
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			
			boolean isExists = rs.next();
			System.out.println("getMemberOneByMnum");
			if(isExists) {
				int mnum = rs.getInt("mnum");
				String v_userid = rs.getString("userid");
				String name = rs.getString("name");
				String email = aes.decrypt(rs.getString("email"));  // 이메일을 AES256 알고리즘으로 복호화 시키기
				String phone = aes.decrypt(rs.getString("phone"));      // 휴대폰을 AES256 알고리즘으로 복호화 시키기
				String postnum = rs.getString("postnum");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");				
				int point = rs.getInt("point");
				String birthday = rs.getString("birthday");				
				String last_logindate = rs.getString("last_logindate");
				String last_changepwdate = rs.getString("last_changepwdate");
				String registerdate = rs.getString("registerdate");
				int status = rs.getInt("status");
				int summoney = rs.getInt("summoney");
				int fk_lvnum = rs.getInt("fk_lvnum");
				String cpname = rs.getString("cpname");
				int cpnum = rs.getInt("cpnum");
				String cpexpiredate = rs.getString("cpexpiredate");
				int cpnumCount = rs.getInt("cpnumCount");
				
				membervo = new MemberVO();
				
				membervo.setMnum(mnum);
				membervo.setUserid(v_userid);
				membervo.setName(name);
				membervo.setEmail(email);
				membervo.setPhone(phone);
				membervo.setPostnum(postnum);
				membervo.setAddress1(address1);
				membervo.setAddress2(address2);
				membervo.setBirthyyyy(birthday.substring(0, 4));
				membervo.setBirthmm(birthday.substring(4, 6));
				membervo.setBirthdd(birthday.substring(6));
				membervo.setPoint(point);
				membervo.setRegisterdate(registerdate);
				membervo.setLast_logindate(last_logindate);
				membervo.setLast_changepwdate(last_changepwdate);
				membervo.setStatus(status);
				membervo.setSummoney(summoney);
				membervo.setFk_lvnum(fk_lvnum);
				membervo.setCpname(cpname);
				membervo.setCpnum(cpnum);
				membervo.setCpexpiredate(cpexpiredate);
				membervo.setCpnumCount(cpnumCount);
			}
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return membervo;		
	}
	
	// *** 회원 정보 수정에 대한 메소드 ***
	@Override
	public int updateMember(MemberVO membervo) throws SQLException {
		int result = 0;
		System.out.println("회원정보수정 DAO 1");
		try {
			conn = ds.getConnection();
			// DBCP(DB Connection Pool) 객체 ds를 통해  
						// 톰캣의 context.xml 에 설정되어진 Connection 객체를 빌려오는 것이다.
			
			String sql = " update member set name=?,pw=?,email=?,phone=?,postnum=?,address1=?,address2=?,last_changepwdate = sysdate"
						+" where userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membervo.getName());
			pstmt.setString(2, SHA256.encrypt(membervo.getPwd()) ); 
			pstmt.setString(3, aes.encrypt(membervo.getEmail()) );
			pstmt.setString(4, aes.encrypt(membervo.getPhone()));
			pstmt.setString(5, membervo.getPostnum());
			pstmt.setString(6, membervo.getAddress1());
			pstmt.setString(7, membervo.getAddress2());
			pstmt.setString(8, membervo.getUserid());
			
			result = pstmt.executeUpdate();

		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}			
		return result;
	}
		
	
	// === 회원가입 메소드 ===
		
		public int registerMember(MemberVO membervo) throws SQLException{
			int result=0;
			try {
				conn = ds.getConnection();			
				conn.setAutoCommit(false);			
				int n=0;

				String sql =" insert into member(mnum,userid,name,email,phone,birthday,postnum,address1,address2,point,registerdate,last_logindate,last_changepwdate,status,summoney,fk_lvnum,pw) \n"+
							" values(seq_member_mnum.nextval,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, membervo.getUserid());
				pstmt.setString(2, membervo.getName());				
				pstmt.setString(3, aes.encrypt(membervo.getEmail()));//이메일을 AES256알고르짐으로 양방향 암호화 시키기
				pstmt.setString(4, aes.encrypt(membervo.getPhone()));//휴대폰번호를 AES256알고르짐으로 양방향 암호화 시키기
				pstmt.setString(5, membervo.getBirthyyyy()+membervo.getBirthmm()+membervo.getBirthdd());
				pstmt.setString(6, membervo.getPostnum());
				pstmt.setString(7, membervo.getAddress1());
				pstmt.setString(8, membervo.getAddress2());
				pstmt.setString(9, SHA256.encrypt(membervo.getPwd()));// 암호를 SHA256 알고리즘으로 단방향 암호화 시키기";
				n = pstmt.executeUpdate();
				result = n;			
				if(n == 1) {
					sql = " insert into my_coupon (fk_userid,fk_cpnum,cpexpiredate,cpstatus) \n"+
						  " values(?,1, add_months(sysdate,1), 1) ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, membervo.getUserid());
					n=pstmt.executeUpdate();
					if(n ==1) {
						conn.commit();
						return n;
					}
					else {
						conn.rollback();
						conn.getAutoCommit();
						return 0;
					}
				}
				else {
					conn.rollback();
					conn.getAutoCommit();
					return 0;
				}
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				close();
			}
			return result;
		}
		
}
