package event.model;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import jdbc.util.AES256;
import jdbc.util.SHA256;
import member.model.MemberVO;
import my.util.Mykey;
import product.model.ProductVO;

public class EventDAO implements InterEventDAO {
	private DataSource ds = null;
	//객체변수 ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	AES256 aes = null;
	
	/*
	 === EventDAO 생성자에서 해야할일 ===
	 
	  아파치톰캣이 제공하는 DBCP 객체인 ds 를 얻어오는 것이다.
	 */
	public EventDAO() {
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
	// === 선택한 이벤트를 가져오는 메소드 ===
	@Override
	public EventVO getEvent(String etnum) throws SQLException {
		EventVO eventvo = new EventVO();
		try {
				conn = ds.getConnection();
				
				String sql = " select etnum,etname,etimagefilename \n"+
							 " from event_tag "+
							 " where etnum = ? ";
				
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, etnum);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int v_etnum =  rs.getInt("etnum");
					String etname = rs.getString("etname");
					String etimagefilename = rs.getString("etimagefilename");
					
					eventvo.setEtnum(v_etnum);
					eventvo.setEtname(etname);
					eventvo.setEtimagefilename(etimagefilename);
				}		
			} finally {
				close();
			}
			return eventvo;
	}

	// === 선택한 이벤트 상품 리스트를 가져오는 메소드 ===
	@Override
	public List<HashMap<String,Object>> getEventProduct(String etnum) throws SQLException {

		List<HashMap<String,Object>> pvoList = null;
		try {
				conn = ds.getConnection();				

				String sql = "    select fk_pacname,saleprice,pacimage\n"+
						"    from \n"+
						"        (\n"+
						"            select fk_pacname, min(saleprice) AS saleprice\n"+
						"            from \n"+
						"                (\n"+
						"                select row_number() over(order by saleprice) AS salapriceRank, saleprice,fk_pacname,pacimage,fk_stname\n"+
						"                from \n"+
						"                (\n"+
						"                    select C.pnum,fk_pacname,C.saleprice,C.fk_sdname,C.fk_ctname,C.fk_stname,C.fk_etname,C.pname,C.price,C.point,C.pqty,C.pcontents,C.pexpiredate,C.allergy,C.weight,C.salecount,C.plike,C.pdate,C.fk_etname\n"+
						"                               ,D.pacnum,D.paccontents,D.pacimage\n"+
						"                        from (\n"+
						"                            select A.pnum,A.pname,A.fk_pacname,A.fk_sdname,A.fk_ctname,A.fk_stname,A.fk_etname,A.price,A.saleprice,A.point,A.pqty,A.pcontents,A.pexpiredate,A.allergy,A.weight,A.salecount,A.plike,A.pdate,B.etnum,B.etname,B.etimagefilename\n"+
						"                            from product A join event_tag B\n"+
						"                            on A.fk_etname = B.etname\n"+
						"                            where B.etnum= ? \n"+
						"                            order by pnum\n"+
						"                        )C join product_package D\n"+
						"                    on C.fk_pacname = D.pacname\n"+
						"                )\n"+
						"            )\n"+
						"            group by fk_pacname\n"+
						"        )A join product_package B\n"+
						"        on A.fk_pacname = B.pacname";
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, etnum);
				rs = pstmt.executeQuery();
				
				int cnt=0;

				while(rs.next()) {
					cnt++;					
					if(cnt == 1) pvoList = new ArrayList<HashMap<String,Object>>();

					int saleprice =  rs.getInt("saleprice");
					String fk_pacname = rs.getString("fk_pacname");
					String pacimage = rs.getString("pacimage");

/*					
					sql = "select fk_stname \n"+
							"from product A join spec_tag B \n"+
							"on A.fk_stname = B.stname \n"+
							"where fk_pacname = ? \n"+
							"group by fk_stname ";	
	
					pstmt.setString(1, fk_pacname);
					rs=pstmt.executeQuery();
					String fk_stname = rs.getString("fk_stname");				
					System.out.println("333");*/
					HashMap<String, Object> map = new HashMap<String, Object>();

					map.put("saleprice",saleprice);
					map.put("fk_pacname",fk_pacname);
					map.put("pacimage",pacimage);
				/*	map.put("fk_stname",fk_stname);*/
					
					pvoList.add(map);					
				}		
			} finally {
				close();
			}
			return pvoList;
	}
	
	
	//=== 이벤트 메인페이지에서 이벤트 리스트를 보여주는 메소드 ===
	@Override
	public List<EventVO> getEventList() throws SQLException {
		conn = ds.getConnection();
		List<EventVO> eventList = null;
		
		try {
			System.out.println("EventAcion DAO 1");			
			
			String sql = " select etnum,etname,etimagefilename \n"+
						 " from event_tag ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println("EventAcion DAO 2");
			int cnt = 0;		
			while(rs.next()) {
				cnt++;
				if(cnt ==1) eventList = new ArrayList<EventVO>();
				
				int etnum = rs.getInt("etnum");
				String etname = rs.getString("etname");
				String etimagefilename = rs.getString("etimagefilename");
							
				EventVO evo = new EventVO(etnum, etname, etimagefilename);
				
				eventList.add(evo);
				
			}		
			
		} finally {
			close();
		}
		
		return eventList;
	}

	
	// === 선택한 이벤트 상품 리스트2를 가져오는 메소드 ===
	@Override
	public List<HashMap<String, Object>> getEventList2(String etname,int startRno,int endRno) throws SQLException {

		List<HashMap<String,Object>> pvoList = null;
		try {
				conn = ds.getConnection();	 			
				String sql = "\n"+
						"select etname,rnum, pacnum, pacname, paccontents, pacimage, pnum\n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate,pimgfilename\n"+
						"from\n"+
						"(\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum\n"+
						"            , sdname, ctname, stname, etname, pname, price\n"+
						"            , saleprice, point, pqty, pcontents\n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"    from \n"+
						"    (\n"+
						"        select pacnum, pacname, paccontents, pacimage, pnum\n"+
						"                , sdname, ctname, stname, etname, pname, price\n"+
						"                , saleprice, point, pqty, pcontents\n"+
						"                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"        from\n"+
						"        (\n"+
						"            select pacnum, pacname, paccontents, pacimage, pnum\n"+
						"                    , sdname, ctname, stname, etname, pname, price\n"+
						"                    , saleprice, point, pqty, pcontents\n"+
						"                    , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"            from\n"+
						"            (\n"+
						"                select row_number() over(partition by pacnum order by saleprice) as rno\n"+
						"                    , b.pacnum, b.pacname, b.paccontents, b.pacimage, a.pnum\n"+
						"                    , fk_sdname as sdname, a.fk_ctname as ctname, a.fk_stname as stname, a.fk_etname as etname\n"+
						"                    , a.pname, a.price, a.saleprice, a.point, a.pqty, a.pcontents\n"+
						"                    , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount, a.plike, a.pdate\n"+
						"                from product a JOIN product_package b\n"+
						"                ON a.fk_pacname = b.pacname\n"+
						"            ) V\n"+
						"            where rno = 1 and pacnum != 1\n"+
						"            union all\n"+
						"            select pacnum, pacname, paccontents, pimgfilename, pnum\n"+
						"                    , sdname, ctname, stname, etname, pname\n"+
						"                    , price, saleprice, point, pqty, pcontents\n"+
						"                    , pcompanyname, pexpiredate, allergy, weight, salecount\n"+
						"                    , plike, pdate\n"+
						"            from\n"+
						"            (\n"+
						"                select row_number() over(partition by pname order by saleprice) as rno\n"+
						"                        , b.pacnum, b.pacname, b.paccontents, b.pacimage, pnum\n"+
						"                        , fk_sdname AS sdname, a.fk_ctname AS ctname, a.fk_stname AS stname, a.fk_etname AS etname, a.pname\n"+
						"                        , a.price, a.saleprice, a.point, a.pqty, a.pcontents\n"+
						"                        , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount\n"+
						"                        , a.plike, a.pdate, c.pimgfilename\n"+
						"                from product a JOIN product_package b\n"+
						"                ON a.fk_pacname = b.pacname\n"+
						"                JOIN product_images c\n"+
						"                ON a.pnum = c.fk_pnum\n"+
						"                where pacnum = 1\n"+
						"            ) V\n"+
						"            where rno = 1\n"+
						"        )T\n"+
						"       \n"+
						"        where etname = ? \n"+
						"        order by pdate desc, pname asc\n"+
						"    ) E\n"+
						") F join product_images B\n"+
						"on F.pnum = B.fk_pnum\n"+
						" where rnum between ? and ? ";
				/*String sql = "select etname,rnum, pacnum, pacname, paccontents, pacimage, pnum\n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"from\n"+
						"(\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum\n"+
						"            , sdname, ctname, stname, etname, pname, price\n"+
						"            , saleprice, point, pqty, pcontents\n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"    from \n"+
						"    (\n"+
						"        select pacnum, pacname, paccontents, pacimage, pnum\n"+
						"                , sdname, ctname, stname, etname, pname, price\n"+
						"                , saleprice, point, pqty, pcontents\n"+
						"                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
						"        from view_Product       \n"+
						"        where etname = ? \n"+
						"        order by pdate desc, pname asc\n"+
						"    )E\n"+
						") F\n"+
						" where rnum between ? and ? ";*/
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1,etname);
				pstmt.setInt(2,startRno);
				pstmt.setInt(3,endRno);
				rs = pstmt.executeQuery();
				
				int cnt=0;

				while(rs.next()) {
					cnt++;					
					if(cnt == 1) pvoList = new ArrayList<HashMap<String,Object>>();
					 
					String stname = rs.getString("stname");
					int saleprice =  rs.getInt("saleprice");
					String pacname = rs.getString("pacname");
					String pacimage = rs.getString("pacimage");
					String v_etname = rs.getString("etname");
					String pname = rs.getString("pname");
					String pimgfilename = rs.getString("pimgfilename");
					System.out.println("Event NAME"+etname);
					int pacnum = rs.getInt("pacnum");
			
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("etname", v_etname);
					map.put("saleprice",saleprice);
					map.put("pacname",pacname);
					map.put("pacimage",pacimage);
					map.put("stname",stname);
					map.put("pname",pname);
					map.put("pname",pname);
					map.put("pimgfilename",pimgfilename);
					map.put("pacnum",pacnum);
					
					pvoList.add(map);					
				}		
			} finally {
				close();
			}
			return pvoList;
	}
	
	// == 쿠폰 페이지에서 나의 쿠폰 내역 불러오기 
	@Override
	public List<HashMap<String,String>> getCouponList(String userid) throws SQLException{
		conn = ds.getConnection();
		List<HashMap<String,String>> couponList = null;
		
		try {
			
			String sql = "select A.fk_userid ,A.cpexpiredate,A.cpstatus,B.cpnum,B.cpname,B.discountper,cpusemoney,cpuselimit\n"+
					"from my_coupon A join coupon B\n"+
					"on A.fk_cpnum = B.cpnum\n"+
					"where fk_userid= ? and cpexpiredate > sysdate ";


			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();

			int cnt = 0;		
			while(rs.next()) {
				cnt++;
				if(cnt ==1) couponList = new ArrayList<HashMap<String,String>>();
				
				String v_userid = rs.getString("fk_userid");
				String cpexpiredate = rs.getString("cpexpiredate");
				String cpstatus = rs.getString("cpstatus");
				String cpname = rs.getString("cpname");
				String discountper = rs.getString("discountper");
				String cpusemoney = rs.getString("cpusemoney");
				String cpuselimit = rs.getString("cpuselimit");
	
				HashMap<String, String> map = new HashMap<String,String>();

				map.put("fk_userid",v_userid);
				map.put("cpexpiredate",cpexpiredate);
				map.put("cpstatus",cpstatus);
				map.put("cpname",cpname);
				map.put("discountper",discountper);
				map.put("cpusemoney",cpusemoney);
				map.put("cpuselimit",cpuselimit);
				
				couponList.add(map);
			}		
			
		} finally {
			close();
		}		
		return couponList;
	}

	// == 이벤트 별 패키지 총갯수 불러오기
	@Override
	public int getEventTotalCount(String etname) throws SQLException {
		int totalCount = 0;
		try{
			conn = ds.getConnection();
			
		String sql = "select count(*) AS cnt\n"+
				"from\n"+
				"(\n"+
				"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum\n"+
				"            , sdname, ctname, stname, etname, pname, price\n"+
				"            , saleprice, point, pqty, pcontents\n"+
				"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
				"    from \n"+
				"    (\n"+
				"        select pacnum, pacname, paccontents, pacimage, pnum\n"+
				"                , sdname, ctname, stname, etname, pname, price\n"+
				"                , saleprice, point, pqty, pcontents\n"+
				"                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				"        from\n"+
				"        (\n"+
				"            select pacnum, pacname, paccontents, pacimage, pnum \n"+
				"                    , sdname, ctname, stname, etname, pname, price \n"+
				"                    , saleprice, point, pqty, pcontents \n"+
				"                    , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				"            from\n"+
				"            (\n"+
				"                select row_number() over(partition by pacnum order by saleprice) as rno \n"+
				"                    , b.pacnum, b.pacname, b.paccontents, b.pacimage, a.pnum \n"+
				"                    , fk_sdname as sdname, a.fk_ctname as ctname, a.fk_stname as stname, a.fk_etname as etname \n"+
				"                    , a.pname, a.price, a.saleprice, a.point, a.pqty, a.pcontents \n"+
				"                    , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount, a.plike, a.pdate \n"+
				"                from product a JOIN product_package b \n"+
				"                ON a.fk_pacname = b.pacname \n"+
				"            ) V\n"+
				"            where rno = 1 and pacnum != 1 \n"+
				"            union all\n"+
				"            select pacnum, pacname, paccontents, pimgfilename, pnum \n"+
				"                    , sdname, ctname, stname, etname, pname \n"+
				"                    , price, saleprice, point, pqty, pcontents \n"+
				"                    , pcompanyname, pexpiredate, allergy, weight, salecount \n"+
				"                    , plike, pdate\n"+
				"            from\n"+
				"            (\n"+
				"                select row_number() over(partition by pname order by saleprice) as rno \n"+
				"                        , b.pacnum, b.pacname, b.paccontents, b.pacimage, pnum \n"+
				"                        , fk_sdname AS sdname, a.fk_ctname AS ctname, a.fk_stname AS stname, a.fk_etname AS etname, a.pname \n"+
				"                        , a.price, a.saleprice, a.point, a.pqty, a.pcontents \n"+
				"                        , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount \n"+
				"                        , a.plike, a.pdate, c.pimgfilename\n"+
				"                from product a JOIN product_package b \n"+
				"                ON a.fk_pacname = b.pacname \n"+
				"                JOIN product_images c \n"+
				"                ON a.pnum = c.fk_pnum \n"+
				"                where pacnum = 1 \n"+
				"            ) V\n"+
				"            where rno = 1 \n"+
				"        )T\n"+
				"       \n"+
				"        order by pdate desc, pname asc\n"+
				"    ) E \n"+
				") F \n"+
				" where etname = ? ";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, etname);		
		rs = pstmt.executeQuery();
		rs.next();		
		totalCount = rs.getInt("CNT");	
	 } finally{
		close();
	 }
	
	return totalCount;		
	
	}
	
	
	// == 패키지 없는 이벤트 리스트 ==
	public List<HashMap<String,Object>> getProImgPnameFile(String etname) throws SQLException{
		List<HashMap<String,Object>> productList = null;
		try {			
			conn = ds.getConnection();			
		
			String sql = " select pnum,fk_pacname AS pacname,fk_sdname AS sdname,fk_etname AS etname\n"+
					"        ,pname,price,saleprice,point,pqty,pimgfilename,pacnum,pacimage\n"+
					"    from product A join product_images B\n"+
					"    on A.pnum = B.fk_pnum\n"+
					"join product_package B\n"+
					"on A.fk_pacname = B.pacname\n"+
					"where fk_etname = ?";
			
			 
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.setString(1, etname);
			 	rs = pstmt.executeQuery();
			 	int cnt = 0;
			 	while(rs.next()) {
			 		cnt++;
			 		if(cnt ==1)  productList = new ArrayList<HashMap<String,Object>>();
			 		
			 		int pnum = rs.getInt("pnum");
			 		String pacname = rs.getString("pacname");
			 		String sdname = rs.getString("sdname");
			 		String v_etname = rs.getString("etname");
			 		String pname = rs.getString("pname");
			 		int price = rs.getInt("price");
			 		int saleprice = rs.getInt("saleprice");
			 		int point = rs.getInt("point");
			 		int pqty = rs.getInt("pqty");
			 		int pacnum= rs.getInt("pacnum");
			 		String pacimage = rs.getString("pacimage");			 	
			 			
			 		HashMap<String,Object> map = new HashMap<String,Object>();
			 		
			 		map.put("pnum", pnum);
			 		map.put("pacname", pacname);
			 		map.put("sdname", sdname);
			 		map.put("etname", etname);
			 		map.put("pname", pname);
			 		map.put("price", price);
			 		map.put("saleprice", saleprice);
			 		map.put("point", point);
			 		map.put("pqty", pqty);
			 		map.put("pacnum", pacnum);
			 		map.put("pacimage", pacimage);
			 		
			 		productList.add(map);					 	 		
			 	}				 	
		} finally {
			close();
		}
		return productList;
	}
	
}// end of DAO

