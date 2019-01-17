package admin.model;

import java.sql.SQLException;

public interface InterAdminDAO {

	// ** 관리자 로그인 추상 메소드 **
	boolean getLogin(String adminId, String adminPwd) throws SQLException;

}
