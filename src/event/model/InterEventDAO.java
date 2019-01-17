package event.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterEventDAO {

	// === 이벤트를 불러오는 추상 메소드 ===
	EventVO getEvent(String etnum) throws SQLException;
	// === 이벤트 제품 불러오는 추상 메소드 ===
	List<HashMap<String,Object>> getEventProduct(String etnum) throws SQLException;
	//=== 이벤트 메인페이지에서 이벤트 리스트를 보여주는 추상 메소드 ===
	List<EventVO> getEventList() throws SQLException;
	//=== 이벤트 메인페이지에서 이벤트 리스트2를 보여주는 추상 메소드 ===
	List<HashMap<String,Object>> getEventList2(String etname,int startRno,int endRno) throws SQLException;
	// == 쿠폰 페이지에서 나의 쿠폰 내역 불러오기 
	List<HashMap<String,String>> getCouponList(String userid) throws SQLException;
}
