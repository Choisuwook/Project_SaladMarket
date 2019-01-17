package member.model;


import java.sql.SQLException;
import java.util.List;

public interface InterMemberDAO {
	// ** 로그인 해주는 추상 메소드 **
	MemberVO loginOKmemberInfo(String userid, String pwd) throws SQLException;
	// *** 회원가입 추상 메소드 ***
	int registerMember(MemberVO membervo) throws SQLException;
	
	// ** 아이디 중복검사 해주는 추상 메소드 **
	int idDuplicateCheck(String userid) throws SQLException;
	
	// ** 회원정보 페이지 비밀번화 확인해주는 추상 메소드 **
	boolean checkPasswd(String userid,String password) throws SQLException;
	
	// ** 회원아이디 찾기 추상메소드 **
	String getUserid(String username, String phone) throws SQLException;
	
	//** 비밀번호 찾기를 위해 먼저 userid 와 email을 가지는 사용자가 존재하는지 검증해주는 추상메소드 **
	int isUserExists(String userid, String email) throws SQLException; 
	
	// ***암호를 새암호로 변경해주는 추상메소드 ***
	int updatePwdUser(String userid, String pwd) throws SQLException;
	
	 // *** 회원 1명에 대한 정보를 보여주는 추상 메소드 *** //
	MemberVO getMemberOneByMnum(String userid) throws SQLException;
	
	// *** 회원 정보 수정에 대한 추상 메소드 ***
	int updateMember(MemberVO membervo) throws SQLException;
}