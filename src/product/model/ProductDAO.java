package product.model;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.AES256;
import my.util.Mykey;

public class ProductDAO implements InterProductDAO {
	private DataSource ds = null;
	//객체변수 ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	AES256 aes = null;
	
	/*
	 === ProductDAO 생성자에서 해야할일 ===
	 
	  아파치톰캣이 제공하는 DBCP 객체인 ds 를 얻어오는 것이다.
	 */

	
	public ProductDAO() {
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
<<<<<<< HEAD
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
	@Override
	public List<HashMap<String, Object>> getProductDetail(int pnum) throws SQLException {
		
		List<HashMap<String,Object>> pvoList = null;
		try {
				conn = ds.getConnection();			

				String sql = " select A.pnum,A.fk_pacname,A.fk_sdname,A.fk_ctname,A.fk_stname,A.fk_etname,A.pname,A.price,A.saleprice,A.point,A.pqty,A.pcontents,A.pcompanyname \n"+
							"          ,A.pexpiredate,A.allergy,A.weight,A.salecount,A.plike,A.pdate,B.pacnum,B.pacname,B.paccontents,B.pacimage,C.pimgnum,C.pimgfilename,C.fk_pnum\n"+
							"    from product A JOIN product_package B\n"+
							"    on A.fk_pacname = B.pacname \n"+
							"        join product_images C \n"+
							"        on A.pnum = C.fk_pnum \n"+
							" 	where A.fk_pacname like '%' || ? || '%' ";
				
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, pnum);
				rs = pstmt.executeQuery();
				
				int cnt=0;
				while(rs.next()) {
					cnt++;					
					if(cnt == 1) pvoList = new ArrayList<HashMap<String,Object>>();
					
					int v_pnum = rs.getInt("pnum");
					String fk_pacname =  rs.getString("fk_pacname");
					String fk_sdname =  rs.getString("fk_sdname");
					String fk_ctname=  rs.getString("fk_ctname");
					String fk_stname =  rs.getString("fk_stname");
					String fk_etname =  rs.getString("fk_etname");
					String pname =  rs.getString("pname");
					int price =  rs.getInt("price");
					int saleprice =  rs.getInt("saleprice");
					int point =  rs.getInt("point");
					int pqty =  rs.getInt("pqty");
					String pcontents =  rs.getString("pcontents");
					String pcompanyname = rs.getString("pcompanyname");
					String pexpiredate =  rs.getString("pexpiredate");
					String allergy =  rs.getString("allergy");
					int weight=  rs.getInt("weight");
					int salecount=  rs.getInt("salecount");
					int plike =  rs.getInt("plike");
					String pdate =  rs.getString("pdate");
					int pacnum = rs.getInt("pacnum");
					String pacname = rs.getString("pacname");
					String paccontents = rs.getString("paccontents");
					String pacimage=rs.getString("pacimage");
					int pimgnum = rs.getInt("pimgnum");
					String pimgfilename = rs.getString("pimgfilename");
					int fk_pnum = rs.getInt("fk_pnum");
					
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("pnum",pnum);
					map.put("fk_pacname",fk_pacname);
					map.put("fk_sdname",fk_sdname);
					map.put("fk_ctname", fk_ctname);
					map.put("fk_stname",fk_stname);
					map.put("fk_etname",fk_etname);
					map.put("pname",pname);
					map.put("price", price);
					map.put("saleprice",saleprice);				
					map.put("point",point);
					map.put("pqty",pqty);
					map.put("pcontents",pcontents);
					map.put("pcompanyname",pcompanyname);
					map.put("pexpiredate",pexpiredate);
					map.put("allergy",allergy);
					map.put("weight",weight);
					map.put("salecount",salecount);
					map.put("plike",plike);
					map.put("pdate",pdate);
					map.put("pacnum",pacnum);
					map.put("paccontents",paccontents);
					map.put("pacimage",pacimage);
					map.put("pimgnum",pimgnum);
					map.put("pimgfilename",pimgfilename);
					map.put("fk_pnum",fk_pnum);
					
					pvoList.add(map);					
				}		
			} finally {
				close();
			}
			return pvoList;
	}
	
	// === List에서 sdname 별 상품 보기
	@Override
	public List<ProductVO> getpackageList(String sdname,String order)throws SQLException {
		
		 List<ProductVO> productList = null; 		
		 
	 try {
		conn = ds.getConnection();	 				  

		String sql = "  select pacname,pacnum, pacimage \n"+
			"        , sdname,stname,pname, pnum,price, saleprice\n"+
			" from\n"+
			"(\n"+
			"    select rownum as rnum,pacnum, case when pacname like '없음' then pname else pacname end AS pacname, paccontents, pacimage, pnum\n"+
			"            , sdname, ctname, stname, etname, pname, price\n"+
			"            , saleprice, point, pqty, pcontents\n"+
			"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
			"    from \n"+
			"    (\n"+
			"        select pacnum, pacname, paccontents, pacimage, pnum\n"+
			"                , sdname, ctname, stname, etname, pname, price\n"+
			"                , saleprice, point, pqty, pcontents\n"+
			"                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
			"        from prod_view\n"+
			"        order by pdate desc, pname asc\n"+
			"    ) E\n"+
			"        where sdname like ? \n"+
			"        order by ? \n"+
			") F ";


		 	pstmt = conn.prepareStatement(sql);
		 	pstmt.setString(1, sdname);
		 	pstmt.setString(2, order);
		 	
		 	rs = pstmt.executeQuery();

		 	int cnt = 0;
		 	while(rs.next()) {
		 		cnt++;
		 		if(cnt ==1)  productList = new ArrayList<ProductVO>();

		 		String stname = rs.getString("stname");
		 		String pacname = rs.getString("pacname");
		 		String pacimage = rs.getString("pacimage");
		 		String pname = rs.getString("pname");
		 		String v_sdname = rs.getString("sdname");
		 		int saleprice = rs.getInt("saleprice");
		 		int price = rs.getInt("price");
		 		int pacnum = rs.getInt("pacnum");
		 		int pnum = rs.getInt("pnum");
		 		
		 		ProductVO pvo = new ProductVO();
		 		pvo.setFk_stname(stname);
		 		pvo.setPacname(pacname);
		 		pvo.setPname(pname);
		 		pvo.setPacimage(pacimage);
		 		pvo.setFk_sdname(v_sdname);
		 		pvo.setSaleprice(saleprice);
		 		pvo.setPrice(price);
		 		pvo.setPacnum(pacnum);
		 		pvo.setPnum(pnum);
		 		productList.add(pvo);	

		 	}		 	
	} finally {
		close();
	}
		return productList;
	}
	

	// ** Index.do 에서 NEW 상품 보기 추상 메소드 **
	@Override
	public List<HashMap<String, String>> getNewProductList() throws SQLException {
		List<HashMap<String, String>> newProductList = null;

		try {	
			
				conn = ds.getConnection();			
			
				
			String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'NEW' and pacname != '없음' \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";

				 	pstmt = conn.prepareStatement(sql);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  newProductList = new ArrayList<HashMap<String,String>>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String sdname = rs.getString("sdname");
				 		String saleprice = rs.getString("saleprice");
				 		String pacnum = rs.getString("pacnum");
				 		
				 		HashMap<String,String> map = new HashMap<String, String>();
				 		
				 		map.put("pacname", pacname);
				 		map.put("pacimage",pacimage);
				 		map.put("sdname", sdname);
				 		map.put("saleprice",saleprice);
				 		map.put("pacnum",pacnum);
				 		
				 		newProductList.add(map);		 		
				 		
				 	}
				 	
			} finally {
				close();
			}

			return newProductList;
	}

		
	// ** Index.do 에서 BEST 상품 보기 추상 메소드 **
	@Override
	public List<HashMap<String, String>> getBestProductList() throws SQLException {
	List<HashMap<String, String>> newProductList = null;

		try {	
			
				conn = ds.getConnection();			
			
/*				String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'BEST' and pacname != '없음' \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";*/
				String sql = "select etname,rnum, pacnum, pacname, paccontents, pacimage, pnum\n"+
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
						"        order by pdate desc, pname asc\n"+
						"    ) E\n"+
						"        where stname = 'BEST' and pacname != '없음' \n"+
						"       order by rnum asc, pname asc \n"+
						") F ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  newProductList = new ArrayList<HashMap<String,String>>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String sdname = rs.getString("sdname");
				 		String saleprice = rs.getString("saleprice");
				 		String pacnum = rs.getString("pacnum");
				 		HashMap<String,String> map = new HashMap<String, String>();
				 		
				 		map.put("pacname", pacname);
				 		map.put("pacimage",pacimage);
				 		map.put("sdname", sdname);
				 		map.put("pacnum",pacnum);
				 		map.put("saleprice",saleprice);
				 		
				 		newProductList.add(map);		 		
				 		
				 	}
				 	
			} finally {
				close();
			}

			return newProductList;
	}

	// ** Index.do 에서 상품 상세 리스트로 진입 하는 메소드 **
	// 상품 패키지에 대한 정도
	@Override
	public ProductVO getIndexProductDetail(int pacnum) throws SQLException{
		ProductVO productDetailList = null;
		
			try {						
					conn = ds.getConnection();			
				
					String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
							"        , sdname, ctname, stname, etname, pname, price\n"+
							"        , saleprice, point, pqty, pcontents\n"+
							"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
							" from\n"+
							" (\n"+
							"    select rownum as rnum,pacnum,pacname, paccontents, pacimage, pnum \n"+
							"            , sdname, ctname, stname, etname, pname, price \n"+
							"            , saleprice, point, pqty, pcontents \n"+
							"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
							"    from view_Product \n"+
							"        where pacnum = ? \n"+
							"        order by rnum asc, pname asc \n"+
							" ) F"; 
					 
					 	pstmt = conn.prepareStatement(sql);
					 	pstmt.setInt(1, pacnum);
					 	rs = pstmt.executeQuery();
					 	
					 	if(rs.next()) {
					 		productDetailList = new ProductVO();
					 		
					 		int rnum = rs.getInt("rnum");
					 		int v_pacnum = rs.getInt("pacnum");
					 		String pacname = rs.getString("pacname");
					 		String paccontents = rs.getString("paccontents");
					 		String pacimage = rs.getString("pacimage");
					 		int pnum = rs.getInt("pnum");
					 		String sdname = rs.getString("sdname");
					 		String ctname = rs.getString("ctname");
					 		String stname = rs.getString("stname");
					 		String etname = rs.getString("etname");
					 		String pname = rs.getString("pname");
					 		int price = rs.getInt("price");
					 		int saleprice = rs.getInt("saleprice");
					 		int point = rs.getInt("point");
					 		int pqty = rs.getInt("pqty");
					 		String pcontents = rs.getString("pcontents");
					 		String pcompanyname = rs.getString("pcompanyname");
					 		String pexpiredate = rs.getString("pexpiredate");
					 		String allergy = rs.getString("allergy");					 		
					 		int weight = rs.getInt("weight");
					 		int salecount = rs.getInt("salecount");
					 		int plike = rs.getInt("plike");
					 		String pdate = rs.getString("pdate");
					 		
					 		productDetailList.setRnum(rnum);
					 		productDetailList.setPacnum(v_pacnum);
					 		productDetailList.setPacname(pacname);
					 		productDetailList.setPaccontents(paccontents);
					 		productDetailList.setPacimage(pacimage);
					 		productDetailList.setPnum(pnum);
					 		productDetailList.setFk_sdname(sdname);
					 		productDetailList.setFk_ctname(ctname);
					 		productDetailList.setFk_stname(stname);
					 		productDetailList.setFk_etname(etname);
					 		productDetailList.setPname(pname);
					 		productDetailList.setPrice(price);
					 		productDetailList.setSaleprice(saleprice);
					 		productDetailList.setPoint(point);
					 		productDetailList.setPqty(pqty);
					 		productDetailList.setPcontents(pcontents);
					 		productDetailList.setPcompanyname(pcompanyname);
					 		productDetailList.setPexpiredate(pexpiredate);
					 		productDetailList.setAllergy(allergy);
					 		productDetailList.setWeight(weight);
					 		productDetailList.setSalecount(salecount);
					 		productDetailList.setPlike(plike);
					 		productDetailList.setPdate(pdate);
		
					 							 	}
					 	
				} finally {
					close();
				}
				return productDetailList;
	}
	
	// ** 상품 패키지 단품명, 사
	@Override
	public List<ProductVO> getProductDateilList(int pacnum) throws SQLException {
		List<ProductVO> productDetailList = null;

		try {	
				
				conn = ds.getConnection();			
			
				String sql = " select pnum,fk_pacname,price,saleprice,point,pqty,pcontents,pcompanyname\n"+
						" ,pexpiredate,pname,allergy,weight,salecount\n"+
						"	,plike,pdate,pimgnum,pimgfilename,pacnum \n"+
						" from product A join product_images  B \n"+
						" on A.pnum = B.fk_pnum \n"+
						" join product_package C \n"+
						" on A.fk_pacname = C.pacname \n"+
						" where pacnum = ? ";
																
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setInt(1, pacnum);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt =0;
				 	while(rs.next()) {
				 		
				 		cnt++;
				 		if(cnt == 1) productDetailList = new ArrayList<ProductVO>();
				 		
				 		int pnum = rs.getInt("pnum");
				 		int v_pacnum =rs.getInt("pacnum");
				 		String pacname = rs.getString("fk_pacname");
				 		String pname = rs.getString("pname");
				  		int price = rs.getInt("price");
				 		int saleprice = rs.getInt("saleprice");
				 		int point = rs.getInt("point");
				 		int pqty = rs.getInt("pqty");
				 		String pcontents = rs.getString("pcontents");
				 		String pcompanyname = rs.getString("pcompanyname");
				 		String pexpiredate = rs.getString("pexpiredate");		 		
				 		String allergy = rs.getString("allergy");
				 		int weight = rs.getInt("weight");
				 		int salecount = rs.getInt("salecount");
				 		int plike = rs.getInt("plike");
				 		String pdate = rs.getString("pdate");	
				 		int pimgnum = rs.getInt("pimgnum");
				 		String pimgfilename = rs.getString("pimgfilename");
				 		
				 		
				 		ProductVO pvo = new ProductVO();
				 		pvo.setPacnum(v_pacnum);
				 		pvo.setPacname(pacname);
				 		pvo.setPnum(pnum);
				 		pvo.setPname(pname);
				 		pvo.setPrice(price);
				 		pvo.setSaleprice(saleprice);
				 		pvo.setPoint(point);
				 		pvo.setPqty(pqty);
				 		pvo.setPcontents(pcontents);
				 		pvo.setPcompanyname(pcompanyname);
				 		pvo.setPexpiredate(pexpiredate);
				 		pvo.setAllergy(allergy);
				 		pvo.setWeight(weight);
				 		pvo.setSalecount(salecount);
				 		pvo.setPlike(plike);
				 		pvo.setPdate(pdate);
				 		pvo.setPimgnum(pimgnum);
				 		pvo.setPimgfilename(pimgfilename);
				 		productDetailList.add(pvo);
				 	}				 	
			} finally {
				close();
			}
			return productDetailList;
	}

	//** 상품 리스트에서 Best 상품 불러오기 
	@Override
	public List<ProductVO> getProductDetailSpecList(String sdname) throws SQLException {	
		
		List<ProductVO> productBestList = null;
			try {			
				conn = ds.getConnection();			
			
				String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'BEST' and sdname = ? \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setString(1, sdname);
				 	rs = pstmt.executeQuery();
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  productBestList = new ArrayList<ProductVO>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String v_sdname = rs.getString("sdname");
				 		int saleprice = rs.getInt("saleprice");
				 		int pacnum = rs.getInt("pacnum");
				 		
				 		ProductVO pvo = new ProductVO();
				 		
				 		pvo.setPacname(pacname);
				 		pvo.setPacimage(pacimage);
				 		pvo.setFk_sdname(v_sdname);
				 		pvo.setSaleprice(saleprice);
				 		pvo.setPacnum(pacnum);
				 		
				 		productBestList.add(pvo);					 	 		
				 	}				 	
			} finally {
				close();
			}
			return productBestList;
		}
	
	// *** 패키지가 있는 상품 상세 가져오는 메소드 ***
	public ProductVO getProductDetail(String pacname) throws SQLException{
		
		ProductVO productDetail = null;
		try {			
			conn = ds.getConnection();			
			
			String sql = "select pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents\n"+
					"       ,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate,pimgnum,pimgfilename,pacnum,paccontents,pacimage\n"+
					"from product A join product_images B\n"+
					"on A.pnum=B.fk_pnum\n"+
					"join product_package C\n"+
					"on A.fk_pacname = C.pacname\n"+
					"where A.fk_pacname = ? and C.pacnum != 1;\n";
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.setString(1, pacname);
			 	rs = pstmt.executeQuery();
			 	if(rs.next()) {
			 		productDetail = new ProductVO() ;
			 		int pnum = rs.getInt("pnum");
			 		String v_pacname = rs.getString("fk_pacname");
			 		String fk_sdname= rs.getString("fk_sdname");
			 		String fk_ctname= rs.getString("fk_ctname");
			 		String fk_stname= rs.getString("fk_stname");
			 		String fk_etname= rs.getString("fk_etname");
			 		String pname= rs.getString("pname");
			 		int price = rs.getInt("price");
			 		int saleprice = rs.getInt("saleprice");
			 		int point = rs.getInt("point");
			 		int pqty = rs.getInt("pqty");
			 		String pcompanyname= rs.getString("pcopcompanynamentents");
			 		String pexpiredate= rs.getString("pexpiredate");
			 		String allergy= rs.getString("pconallergytents");
			 		String pcontents= rs.getString("pcontents");
			 		int weight = rs.getInt("weight");
			 		int salecount = rs.getInt("salecount");
			 		int plike = rs.getInt("pqplikety");
			 		String pdate= rs.getString("pdate");
			 		int pimgnum = rs.getInt("pimgnum");
			 		String pacimage= rs.getString("pacimage");
			 		String paccontents= rs.getString("paccontents");
			 		String pimgfilename= rs.getString("pimgfilename");
			 		int pacnum = rs.getInt("pipacnummgnum");
			 		
			 		productDetail.setPnum(pnum);
			 		productDetail.setPacname(v_pacname);
			 		productDetail.setFk_pacname(v_pacname);
			 		productDetail.setFk_sdname(fk_sdname);
			 		productDetail.setFk_ctname(fk_ctname);
			 		productDetail.setFk_stname(fk_stname);
			 		productDetail.setFk_etname(fk_etname);
			 		productDetail.setPname(pname);
			 		productDetail.setPrice(saleprice);
			 		productDetail.setSaleprice(saleprice);
			 		productDetail.setPoint(point);
			 		productDetail.setPqty(pqty);
			 		productDetail.setPcompanyname(pcompanyname);
			 		productDetail.setPexpiredate(pexpiredate);
			 		productDetail.setAllergy(allergy);
			 		productDetail.setPcontents(pcontents);
			 		productDetail.setWeight(weight);
			 		productDetail.setSalecount(salecount);
			 		productDetail.setPlike(plike);
			 		productDetail.setPdate(pdate);
			 		productDetail.setPimgnum(pimgnum);
			 		productDetail.setPacimage(pacimage);
			 		productDetail.setPaccontents(paccontents);
			 		productDetail.setPimgfilename(pimgfilename);
			 		productDetail.setPacnum(pacnum);
					 	 		
			 	}
			 	
			 					 	
		} finally {
			close();
		}
		return productDetail;

	}
	
	// *** 패키지  없는 상품 상세 가져오는 메소드 ***
	public ProductVO getProductNoPackageDetail(String pname) throws SQLException{
		
		ProductVO pvo = null;
		try {			
			conn = ds.getConnection();			

			String sql = "select rnum,pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents\n"+
					"       ,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate,pimgnum,pimgfilename,pacnum,paccontents,pacimage\n"+
					"from \n"+
					"(\n"+
					"    select rownum AS rnum,pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents\n"+
					"           ,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate,pimgnum,pimgfilename,pacnum,paccontents,pacimage\n"+
					"    from \n"+
					"    (\n"+
					"        select pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents\n"+
					"               ,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate,pimgnum,pimgfilename,pacnum,paccontents,pacimage\n"+
					"        from product A join product_images B\n"+
					"        on A.pnum=B.fk_pnum\n"+
					"        join product_package C\n"+
					"        on A.fk_pacname = C.pacname\n"+
					"        where C.pacnum = 1 and A.pname like ?\n"+
					"    )D\n"+
					")E\n"+
					"where rnum =1";
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.setString(1, pname);
			 	rs = pstmt.executeQuery();
			 	if(rs.next()) {
			 		int pnum = rs.getInt("pnum");
			 		String pacname = rs.getString("fk_pacname");
			 		String fk_sdname= rs.getString("fk_sdname");
			 		String fk_ctname= rs.getString("fk_ctname");
			 		String fk_stname= rs.getString("fk_stname");
			 		String fk_etname= rs.getString("fk_etname");
			 		String v_pname= rs.getString("pname");
			 		int price = rs.getInt("price");
			 		int saleprice = rs.getInt("saleprice");
			 		int point = rs.getInt("point");
			 		int pqty = rs.getInt("pqty");
			 		String pcompanyname= rs.getString("pcopcompanynamentents");
			 		String pexpiredate= rs.getString("pexpiredate");
			 		String allergy= rs.getString("pconallergytents");
			 		String pcontents= rs.getString("pcontents");
			 		int weight = rs.getInt("weight");
			 		int salecount = rs.getInt("salecount");
			 		int plike = rs.getInt("pqplikety");
			 		String pdate= rs.getString("pdate");
			 		int pimgnum = rs.getInt("pimgnum");
			 		String pacimage= rs.getString("pacimage");
			 		String paccontents= rs.getString("paccontents");
			 		String pimgfilename= rs.getString("pimgfilename");
			 		int pacnum = rs.getInt("pipacnummgnum");
			 		
			 	    pvo = new ProductVO();
			 		
			 		pvo.setPnum(pnum);
			 		pvo.setFk_pacname(pacname);
			 		pvo.setFk_sdname(fk_sdname);
			 		pvo.setFk_ctname(fk_ctname);
			 		pvo.setFk_stname(fk_stname);
			 		pvo.setFk_etname(fk_etname);
			 		pvo.setPname(v_pname);
			 		pvo.setPrice(saleprice);
			 		pvo.setSaleprice(saleprice);
			 		pvo.setPoint(point);
			 		pvo.setPqty(pqty);
			 		pvo.setPcompanyname(pcompanyname);
			 		pvo.setPexpiredate(pexpiredate);
			 		pvo.setAllergy(allergy);
			 		pvo.setPcontents(pcontents);
			 		pvo.setWeight(weight);
			 		pvo.setSalecount(salecount);
			 		pvo.setPlike(plike);
			 		pvo.setPdate(pdate);
			 		pvo.setPimgnum(pimgnum);
			 		pvo.setPacimage(pacimage);
			 		pvo.setPaccontents(paccontents);
			 		pvo.setPimgfilename(pimgfilename);
			 		pvo.setPacnum(pacnum);
			 					 	
			 	}
			 	
		} finally {
			close();
		}
		return pvo;

	}
	
	
	@Override
	
	public List<ProductVO> getProductsByPspecAppend(String stname,String sdname) throws SQLException{
		List<ProductVO> productList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
					"        , sdname, ctname, stname, etname, pname, price\n"+
					"        , saleprice, point, pqty, pcontents\n"+
					"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					"from\n"+
					"(\n"+
					"    select rownum as rnum,pacnum, case when pacname like '없음' then pname else pacname end AS pacname, paccontents, pacimage, pnum\n"+
					"            , sdname, ctname, stname, etname, pname, price\n"+
					"            , saleprice, point, pqty, pcontents\n"+
					"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
					"    from \n"+
					"    (\n"+
					"        select pacnum, pacname, paccontents, pacimage, pnum\n"+
					"                , sdname, ctname, stname, etname, pname, price\n"+
					"                , saleprice, point, pqty, pcontents\n"+
					"                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate\n"+
					"        from prod_view\n"+
					"        order by pdate desc, pname asc\n"+
					"    ) E\n"+
					"        where stname = ? and sdname = ?\n"+
					"        order by rnum asc, pname asc \n"+
					" ) F";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			pstmt.setString(2, sdname);

			rs = pstmt.executeQuery();

			int cnt = 0;
			while(rs.next()) {	

				cnt++;				
				if(cnt==1) productList = new ArrayList<ProductVO>();

				 int pnum = rs.getInt("rnum");
				 int pacnum = rs.getInt("pacnum");
				 String pacname = rs.getString("pacname");
				 String pacimage = rs.getString("pacimage");
				 String v_stname = rs.getString("stname");
				 int price = rs.getInt("price");
				 int saleprice = rs.getInt("saleprice");
				 int plike = rs.getInt("plike");
				 int salecount = rs.getInt("salecount");

				 ProductVO pvo = new ProductVO();
				 
				 pvo.setPnum(pnum);
				 pvo.setPacnum(pacnum);
				 pvo.setPacname(pacname);
				 pvo.setPacimage(pacimage);
				 pvo.setFk_stname(v_stname);
				 pvo.setPrice(saleprice);
				 pvo.setSalecount(salecount);
				 pvo.setSaleprice(saleprice);
				 pvo.setPlike(plike);				 
				 
				 productList.add(pvo);
				
			} // end of while-------------------
						
		} finally {
			close();
		}
		
		return productList;	
	}
	
	// ** AJAX를 이용한 index에서 스펙대로 제품 리스트를 보여주는 추상 메소드
	@Override
	public List<ProductVO> getProductsByStnameAppend(String stname, int startRno, int endRno) throws SQLException {
		List<ProductVO> productList = null;
		
		try {
			conn = ds.getConnection();
			
/*			String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
					"        , sdname, ctname, stname, etname, pname, price\n"+
					"        , saleprice, point, pqty, pcontents\n"+
					"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					" from \n"+
					" (\n"+
					"    select rownum as rnum,pacnum,  case when pacname = '없음' then pname else pacname end as pacname,paccontents, pacimage, pnum \n"+
					"            , sdname, ctname, stname, etname, pname, price \n"+
					"            , saleprice, point, pqty, pcontents \n"+
					"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					"    from view_Product \n"+
					"        where stname = ? \n"+
					"        order by rnum asc, pname asc \n"+
					" ) F where rnum between ? and ? ";*/
			 String sql = " select etname,rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
					 "        , sdname, ctname, stname, etname, pname, price \n"+
					 "        , saleprice, point, pqty, pcontents\n"+
					 "        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					 "from \n"+
					 "( \n"+
					 "    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
					 "            , sdname, ctname, stname, etname, pname, price \n"+
					 "            , saleprice, point, pqty, pcontents \n"+
					 "            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					 "    from \n"+
					 "    ( \n"+
					 "        select pacnum, pacname, paccontents, pacimage, pnum \n"+
					 "                , sdname, ctname, stname, etname, pname, price \n"+
					 "                , saleprice, point, pqty, pcontents\n"+
					 "                , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					 "        from \n"+
					 "        ( \n"+
					 "            select pacnum, pacname, paccontents, pacimage, pnum \n"+
					 "                    , sdname, ctname, stname, etname, pname, price \n"+
					 "                    , saleprice, point, pqty, pcontents\n"+
					 "                    , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					 "            from \n"+
					 "            ( \n"+
					 "                select row_number() over(partition by pacnum order by saleprice) as rno \n"+
					 "                    , b.pacnum, b.pacname, b.paccontents, b.pacimage, a.pnum \n"+
					 "                    , fk_sdname as sdname, a.fk_ctname as ctname, a.fk_stname as stname, a.fk_etname as etname \n"+
					 "                    , a.pname, a.price, a.saleprice, a.point, a.pqty, a.pcontents \n"+
					 "                    , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount, a.plike, a.pdate \n"+
					 "                from product a JOIN product_package b\n"+
					 "                ON a.fk_pacname = b.pacname\n"+
					 "            ) V \n"+
					 "            where rno = 1 and pacnum != 1 \n"+
					 "            union all \n"+
					 "            select pacnum, pacname, paccontents, pimgfilename, pnum \n"+
					 "                    , sdname, ctname, stname, etname, pname \n"+
					 "                    , price, saleprice, point, pqty, pcontents \n"+
					 "                    , pcompanyname, pexpiredate, allergy, weight, salecount \n"+
					 "                    , plike, pdate\n"+
					 "            from \n"+
					 "            ( \n"+
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
					 "    ) E\n"+
					 "       where stname = ? and pacname != '없음' \n"+
					 "       order by rnum asc, pname asc \n"+
					 ") F \n"+
					 " where rnum between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			pstmt.setInt(2, startRno);
			pstmt.setInt(3, endRno);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1) {
					productList = new ArrayList<ProductVO>();
				}
				
			     int rnum = rs.getInt("rnum");
				 int pnum = rs.getInt("pacnum");
				 String pacname = rs.getString("pacname");
				 String paccontents = rs.getString("paccontents");
				 String pacimage = rs.getString("pacimage");
				 String ctname = rs.getString("ctname");
				 String sdname = rs.getString("sdname");
				 int price = rs.getInt("price");
				 int plike = rs.getInt("plike");
				 int saleprice = rs.getInt("saleprice");
				 
				 ProductVO pvo = new ProductVO();
				 pvo.setRnum(rnum);
				 pvo.setPnum(pnum);
				 pvo.setFk_pacname(pacname);
				 pvo.setPaccontents(paccontents);
				 pvo.setPacimage(pacimage);
				 pvo.setFk_ctname(ctname);
				 pvo.setFk_sdname(sdname);
				 pvo.setPrice(price);
				 pvo.setPlike(plike);
				 pvo.setSaleprice(saleprice);
				 
				 productList.add(pvo);				 
				
			} // end of while-------------------
						
		} finally {
			close();
		}
		
		return productList;	
		
	}
	
	// *** Ajax 를 이용한 더보기 방식으로 페이징 처리를 위해서 pspec 별 제품의 갯수를 알아오는 메소드 생성하기 *** //
	@Override
	public int totalPspecCount(String stname) throws SQLException {
	int totalCount = 0;
		try{
			conn = ds.getConnection();
			String sql = "select count(*) AS CNT\n"+
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
					" where stname = ? and pacnum != 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			
			rs = pstmt.executeQuery();

			rs.next();
			
			totalCount = rs.getInt("CNT");	
		 } finally{
			close();
		 }
		
		return totalCount;		
		
	}
	
	public ProductVO noPackageProduct(int pnum) throws SQLException{
		ProductVO productDetailList = null;
		
		try {						
				conn = ds.getConnection();			
			
			String sql = " select pimgfilename,fk_pnum,fk_pacname,pname \n"+
				" from product_images A join product B \n"+
				" on fk_pnum = pnum\n"+
				" where fk_pnum = ? ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setInt(1, pnum);
				 	rs = pstmt.executeQuery();
				 	
				 	if(rs.next()) {
				 		productDetailList = new ProductVO();
				 		
				 		
						int v_pnum = rs.getInt("fk_pnum");
				 		String pimgfilename = rs.getString("pimgfilename");			
				 		String fk_pacname = rs.getString("fk_pacname");
				 		String pname = rs.getString("pname");
				 		productDetailList.setPnum(v_pnum);				 		
				 		productDetailList.setPimgfilename(pimgfilename);				 		
				 		productDetailList.setFk_pacname(fk_pacname);				 		
				 		productDetailList.setPname(pname);
							 				
	
				 	}
				 	
			} finally {
				close();
			}
			return productDetailList;

	}
	
	// == sdname 별 상춤 갯수 가져오는 메소드 ==
	@Override
	public int getTotalCount(String sdname) throws SQLException {
		int totalCount = 0;
		try{
			conn = ds.getConnection();
			String sql = " select count(*) AS CNT  \n"+
					" from view_Product\n"+
					" where sdname = ?";
					pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdname);
			
			rs = pstmt.executeQuery();

			rs.next();
			
			totalCount = rs.getInt("CNT");	
			
		 } finally{
			close();
		 }
		
		return totalCount;	
	}
	
	// ***페이징 처리를 한 상품 목록 가져오기 ***
	@Override
	public List<ProductVO> getSdnameProList(String sdname,int sizePerPage, int currentShowPageNo) throws SQLException{

	List<ProductVO> productList = null;
	
	try {
		conn = ds.getConnection();
		
		String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
				"        , sdname, ctname, stname, etname, pname, price\n"+
				"        , saleprice, point, pqty, pcontents\n"+
				"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				" from \n"+
				" (\n"+
				"    select rownum as rnum,pacnum,  case when pacname = '없음' then pname else pacname end as pacname,paccontents, pacimage, pnum \n"+
				"            , sdname, ctname, stname, etname, pname, price \n"+
				"            , saleprice, point, pqty, pcontents \n"+
				"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				"    from view_Product \n"+
				"        where sdname = ? \n"+
				"        order by rnum asc, pname asc \n"+
				" )F"+
				"where rnum between ? and ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sdname);
		pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식!!!
		pstmt.setInt(3, (currentShowPageNo*sizePerPage) );
		
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt++;
			
			if(cnt==1) {
				productList = new ArrayList<ProductVO>();
			}
			
		     int rnum = rs.getInt("rnum");
			 int pnum = rs.getInt("pacnum");
			 String pacname = rs.getString("pacname");
			 String paccontents = rs.getString("paccontents");
			 String pacimage = rs.getString("pacimage");
			 String ctname = rs.getString("ctname");
			 String v_sdname = rs.getString("sdname");
			 int price = rs.getInt("price");
			 int plike = rs.getInt("plike");
			 int saleprice = rs.getInt("saleprice");

			 ProductVO pvo = new ProductVO();
			 pvo.setRnum(rnum);
			 pvo.setPnum(pnum);
			 pvo.setFk_pacname(pacname);
			 pvo.setPaccontents(paccontents);
			 pvo.setPacimage(pacimage);
			 pvo.setFk_ctname(ctname);
			 pvo.setFk_sdname(v_sdname);
			 pvo.setPrice(price);
			 pvo.setPlike(plike);
			 pvo.setSaleprice(saleprice);
			 
			 productList.add(pvo);				 
			
		} // end of while-------------------
					
	} finally {
		close();
	}
	
		return productList;	
	}
	
	
	
	// ** admin 전체상품목록 보기(상품리스트 가져오는 메소드)
	@Override
	public List<ProductVO> adminProductList() throws SQLException {

		List<ProductVO> productList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select pnum,fk_pacname,fk_ctname,fk_stname,fk_etname,fk_sdname,pname,plike,price,price"+
					",saleprice,salecount,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight \n"+
					" from product A join product_package B\n"+
					" on A.fk_pacname=B.pacname";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) {
					productList = new ArrayList<ProductVO>();
				}
				 int pnum = rs.getInt("pnum");
				 String pacname = rs.getString("fk_pacname");
				 String pname = rs.getString("pname");
				 String ctname = rs.getString("fk_ctname");
				 String stname = rs.getString("fk_stname");
				 String etname = rs.getString("fk_etname");
				 int price = rs.getInt("price");
				 int plike = rs.getInt("plike");
				 int saleprice = rs.getInt("saleprice");
				 int point = rs.getInt("point");
				 int pqty = rs.getInt("pqty");
				 String pcontents = rs.getString("pcontents");
				 String pcompanyname = rs.getString("pcompanyname");
				 String pexpiredate = rs.getString("pexpiredate");
				 String allergy = rs.getString("allergy");
				 int weight = rs.getInt("weight");
				 int salecount = rs.getInt("salecount");

				 ProductVO pvo = new ProductVO();
				 pvo.setPnum(pnum);
				 pvo.setPname(pname);
				 pvo.setFk_pacname(pacname);
				 pvo.setFk_stname(stname);
				 pvo.setFk_ctname(ctname);
				 pvo.setFk_etname(etname);
				 pvo.setPrice(price);
				 pvo.setPlike(plike);
				 pvo.setSaleprice(saleprice);
				 pvo.setPoint(point);
				 pvo.setPqty(pqty);
				 pvo.setPcontents(pcontents);
				 pvo.setPcompanyname(pcompanyname);
				 pvo.setPexpiredate(pexpiredate);
				 pvo.setAllergy(allergy);
				 pvo.setWeight(weight);
				 pvo.setSalecount(salecount);
				 
				 productList.add(pvo);
				 
			} // end of while-------------------
						
		} finally {
			close();
		}
		
			return productList;	
	}
	
	// ** admin 패키지 제품 목록 불러오는 추상 메소드(패키지만 불러오는 메소드)
	@Override
	public List<ProductVO> adminProductPacList() throws SQLException {
		conn = ds.getConnection();
		
		List<ProductVO> packList = null;
		
		try {
					
					String sql = "select rnum, pacnum, pacname, paccontents, pacimage \n"+
					"        , sdname, ctname, stname, etname, price\n"+
					"        , saleprice, point, pqty, pcontents\n"+
					"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					" from \n"+
					" (\n"+
					"    select rownum as rnum,pacnum, pacname ,paccontents\n"+
					"            , pacimage \n"+
					"            , sdname, ctname, stname, etname, price \n"+
					"            , saleprice, point, pqty, pcontents \n"+
					"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					"    from view_Product \n"+
					"        order by rnum asc, pname asc \n"+
					" )F \n"+
					"where pacname !='없음'";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					int cnt =0;
					while(rs.next()) {
						cnt++;
						if(cnt ==1) packList = new ArrayList<ProductVO>();
						
						String pacname = rs.getString("pacname");
						int pacnum = rs.getInt("pacnum");
						String paccontents = rs.getString("paccontents");
						String pacimage = rs.getString("pacimage");

						ProductVO pvo = new ProductVO();
						
						pvo.setPacname(pacname);
						pvo.setPacnum(pacnum);
						pvo.setPaccontents(paccontents);
						pvo.setPacimage(pacimage);
						
						packList.add(pvo);
					}
			
		} finally {
			close();
		}
		return packList;
	}
	
	// admin 제품상세보기 제품 상세 정보 메소드
	@Override
	public ProductVO adminProductList(int pnum) throws SQLException {

		ProductVO pvo = new ProductVO();
		
		try {
			conn = ds.getConnection();
			String sql = " select pnum,plike,fk_sdname,fk_pacname,fk_ctname,fk_stname,fk_etname,"
					+ "pname,price,price,salecount,saleprice,point,pqty,pcontents,pcompanyname,"
					+ "pexpiredate,allergy,weight \n"+
					" from product A join product_package B\n"+
					" on A.fk_pacname=B.pacname\n"+
					"where pnum = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,pnum);
			
			rs = pstmt.executeQuery();			

			if(rs.next()) {

				 int v_pnum = rs.getInt("pnum");
				 String pacname = rs.getString("fk_pacname");
				 String pname = rs.getString("pname");
				 int price = rs.getInt("price");
				 int plike = rs.getInt("plike");
				 int saleprice = rs.getInt("saleprice");
				 int point = rs.getInt("point");
				 int pqty = rs.getInt("pqty");
				 String sdname = rs.getString("fk_sdname");
				 String ctname = rs.getString("fk_ctname");
				 String stname = rs.getString("fk_stname");
				 String etname = rs.getString("fk_etname");
				 String pcontents = rs.getString("pcontents");
				 String pcompanyname = rs.getString("pcompanyname");
				 String pexpiredate = rs.getString("pexpiredate");
				 String allergy = rs.getString("allergy");
				 int weight = rs.getInt("weight");
				 int salecount = rs.getInt("salecount");
				 pvo = new ProductVO();
				 pvo.setPnum(v_pnum);
				 pvo.setPname(pname);
				 pvo.setFk_pacname(pacname);
				 pvo.setPrice(price);
				 pvo.setFk_ctname(ctname);				 
				 pvo.setFk_etname(etname);
				 pvo.setFk_sdname(sdname);
				 pvo.setFk_stname(stname);
				 pvo.setPlike(plike);
				 pvo.setSaleprice(saleprice);
				 pvo.setPoint(point);
				 pvo.setPqty(pqty);
				 pvo.setPcontents(pcontents);
				 pvo.setPcompanyname(pcompanyname);
				 pvo.setPexpiredate(pexpiredate);
				 pvo.setAllergy(allergy);
				 pvo.setWeight(weight);
				 pvo.setSalecount(salecount);
				 
			} // end of while-------------------
						
		} finally {
			close();
		}
		return pvo;	
	}
	
	@Override
	public ProductVO adminProductDetailImg(int pnum) throws SQLException {
		ProductVO pvo = new ProductVO();
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_pnum, pimgfilename \n"+
					" from product_images \n"+
					" where fk_pnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,pnum);
			
			rs = pstmt.executeQuery();			

			if(rs.next()) {

				 int v_pnum = rs.getInt("fk_pnum");
				 String pimgfilename = rs.getString("pimgfilename");
				 
				 pvo.setPnum(v_pnum);
				 pvo.setPimgfilename(pimgfilename);
				 
			} // end of while-------------------
						
		} finally {
			close();
		}
		return pvo;	
	}
	
	// *** 이벤트 태그(etname) 목록 불러오기 ***
	@Override
	public List<ProductVO> etnameList() throws SQLException {
		List<ProductVO> etnameList = null;
		
		try {				
				conn = ds.getConnection();					
				 
				String sql = " select etnum,etname,etimagefilename \n"+
							" from event_tag \n"+
							" order by etnum ";
				
				 	pstmt = conn.prepareStatement(sql);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  etnameList = new ArrayList<ProductVO>();
				 	
				 		int etnum = rs.getInt("etnum");
				 		String fk_etname = rs.getString("etname");
				 		
				 		ProductVO pvo = new ProductVO();
				 		
				 		pvo.setFk_etname(fk_etname);
				 		pvo.setEtnum(etnum);
				 		etnameList.add(pvo);					 		
				 	}
				 	
			} finally {
				close();
			}

			return etnameList;
	}
	
	// *** 스펙 태그(stname) 목록 불러오기 ***
	@Override
	public List<ProductVO> stnameList() throws SQLException {
		
		conn = ds.getConnection();
		List<ProductVO> stnameList = null;	
		try {				
			String sql = " select stnum,stname\n"+
						"from spec_tag\n"+
						"order by stnum";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int cnt =0;
			while(rs.next()) {
				cnt++;
				if(cnt ==1) {
					stnameList = new ArrayList<ProductVO>();	
				}
				int stnum = rs.getInt("stnum");
				String stname = rs.getString("stname");
				
				ProductVO pvo = new ProductVO();
		 		
		 		pvo.setFk_etname(stname);
		 		pvo.setEtnum(stnum);
		 		
				
				stnameList.add(pvo);
			}
		}finally {
			close();
		}
		return stnameList;
	}
	
	// *** 소분류 상세(sdname) 목록 불러오기 ***
	@Override
	public List<ProductVO> sdnameList() throws SQLException {
		conn = ds.getConnection();
		
		List<ProductVO> sdnameList = null;		
		try {	
			String sql = " select sdnum,sdname\n"+
						"from small_detail\n"+
						"order by sdnum";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int cnt =0;
			while(rs.next()) {
				cnt++;
				if(cnt ==1) {
					sdnameList =  new ArrayList<ProductVO>();	
				}
				int sdnum = rs.getInt("sdnum");
				String sdname = rs.getString("sdname");
				
				ProductVO pvo = new ProductVO();
		 		
		 		pvo.setFk_sdname(sdname);
		 		pvo.setSdnum(sdnum);
		 		
				
				sdnameList.add(pvo);
			}
		}finally {
			close();
		}
		return sdnameList;
	}

	// *** 카테고리 태그(ctname) 목록 불러오기 ***
	@Override
	public List<ProductVO> ctnameList() throws SQLException {
		
		conn = ds.getConnection();
	
		
		List<ProductVO>  sdnameList = null;	
		try {			
			String sql = " select ctnum,ctname\n"+
						"from category_tag\n"+
						"order by ctnum";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt =0;
			while(rs.next()) {
				cnt++;
				if(cnt ==1) {
					sdnameList = new ArrayList<ProductVO>();	
				}
				int ctnum = rs.getInt("ctnum");
				String ctname = rs.getString("ctname");
				
				ProductVO pvo = new ProductVO();
				pvo.setCtnum(ctnum);
				pvo.setCtname(ctname);
				
				sdnameList.add(pvo);
			} 
		}finally {
			close();
		}
		return sdnameList;
	}
	
	// *** 검색한 제품 리스트 가져오기
	@Override
	public List<ProductVO> searchList(String search)throws SQLException {
		List<ProductVO> searchList = null;
		conn=ds.getConnection();
		
		try {
			String sql = "select pacnum, pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"           ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"from\n"+
					"(\n"+
					"    select rnum,pacnum, decode(pacname,'없음',pname\n"+
					"                                      ,pacname,pacname  ) AS pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"    from\n"+
					"    (\n"+
					"        select rownum as rnum,pacnum,pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"        from\n"+
					"        (\n"+
					"        select pacnum,pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"        from view_Product\n"+
					"        )V\n"+
					"    )T\n"+
					"    order by rnum desc\n"+
					" )\n"+
					"where pacname like '%' || ? || '%' or pcontents like '%'|| ? ||'%'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				cnt++;
				if(cnt==1) {
					searchList = new ArrayList<ProductVO>();
				}
				
				int pacnum = rs.getInt("pacnum");
				String pacname = rs.getString("pacname");
				String paccontents = rs.getString("paccontents");
				String pacimage = rs.getString("pacimage");
				int pnum = rs.getInt("pnum");
				String sdname = rs.getString("sdname");
				String ctname = rs.getString("ctname");
				String stname = rs.getString("stname");
				String etname = rs.getString("etname");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int saleprice = rs.getInt("saleprice");
				int point = rs.getInt("point");
				int pqty = rs.getInt("pqty");
				String pcontents = rs.getString("pcontents");
				String pcompanyname = rs.getString("pcompanyname");
				String pexpiredate = rs.getString("pexpiredate");
				String allergy = rs.getString("allergy");
				int weight = rs.getInt("weight");
				int salecount = rs.getInt("salecount");
				int plike = rs.getInt("plike");
				String pdate = rs.getString("pdate");
				
				ProductVO pvo = new ProductVO();
				
				pvo.setPacnum(pacnum);
				pvo.setFk_pacname(pcontents);
				pvo.setPaccontents(paccontents);
				pvo.setPacimage(pacimage);
				pvo.setPnum(pnum);
				pvo.setSdname(sdname);
				pvo.setEtname(etname);
				pvo.setPname(pname);
				pvo.setPrice(saleprice);
				pvo.setSaleprice(saleprice);
				pvo.setPoint(point);
				pvo.setPqty(pqty);
				pvo.setPcontents(pcontents);
				pvo.setPcompanyname(pcompanyname);
				pvo.setPexpiredate(pexpiredate);
				pvo.setAllergy(allergy);
				pvo.setWeight(weight);
				pvo.setSalecount(salecount);
				pvo.setPlike(plike);
				pvo.setPdate(pdate);
				
				searchList.add(pvo);
				
				
			}
		} finally {
			close();
		}
		return searchList;
	}
	
	// *** 검색이 없고, SDNAME 별로 상품 총갯수 구하는 메소드 ***
	@Override
	public int getTotalCountNoSearch(String sdname) throws SQLException {
		conn=ds.getConnection();
		
		int productCount = 0;
		try {
			String sql = " select count(*) AS count\n"+
					"from\n"+
					"(\n"+
					"    select rnum,pacnum, decode(pacname,'없음',pname\n"+
					"                                      ,pacname,pacname  ) AS pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"    from\n"+
					"    (\n"+
					"        select rownum as rnum,pacnum,pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"        from\n"+
					"        (\n"+
					"        select pacnum,pacname,paccontents,pacimage,pnum,sdname,ctname,stname,etname\n"+
					"               ,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate\n"+
					"        from view_Product\n"+
					"        )V\n"+
					"    )T\n"+
					"    order by rnum desc\n"+
					" )F\n"+
					" where sdname like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdname);
			rs = pstmt.executeQuery();
			
			rs.next();
			productCount = rs.getInt("count");
			
		} finally {
			close();
		}
		return productCount;
	}


	


	
	

}
=======
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
	@Override
	public List<HashMap<String, Object>> getProductDetail(int pnum) throws SQLException {
		
		List<HashMap<String,Object>> pvoList = null;
		try {
				conn = ds.getConnection();			

				String sql = " select A.pnum,A.fk_pacname,A.fk_sdname,A.fk_ctname,A.fk_stname,A.fk_etname,A.pname,A.price,A.saleprice,A.point,A.pqty,A.pcontents,A.pcompanyname \n"+
							"          ,A.pexpiredate,A.allergy,A.weight,A.salecount,A.plike,A.pdate,B.pacnum,B.pacname,B.paccontents,B.pacimage,C.pimgnum,C.pimgfilename,C.fk_pnum\n"+
							"    from product A JOIN product_package B\n"+
							"    on A.fk_pacname = B.pacname \n"+
							"        join product_images C \n"+
							"        on A.pnum = C.fk_pnum \n"+
							" 	where A.fk_pacname like '%' || ? || '%' ";
				
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, pnum);
				rs = pstmt.executeQuery();
				
				int cnt=0;
				while(rs.next()) {
					cnt++;					
					if(cnt == 1) pvoList = new ArrayList<HashMap<String,Object>>();
					
					int v_pnum = rs.getInt("pnum");
					String fk_pacname =  rs.getString("fk_pacname");
					String fk_sdname =  rs.getString("fk_sdname");
					String fk_ctname=  rs.getString("fk_ctname");
					String fk_stname =  rs.getString("fk_stname");
					String fk_etname =  rs.getString("fk_etname");
					String pname =  rs.getString("pname");
					int price =  rs.getInt("price");
					int saleprice =  rs.getInt("saleprice");
					int point =  rs.getInt("point");
					int pqty =  rs.getInt("pqty");
					String pcontents =  rs.getString("pcontents");
					String pcompanyname = rs.getString("pcompanyname");
					String pexpiredate =  rs.getString("pexpiredate");
					String allergy =  rs.getString("allergy");
					int weight=  rs.getInt("weight");
					int salecount=  rs.getInt("salecount");
					int plike =  rs.getInt("plike");
					String pdate =  rs.getString("pdate");
					int pacnum = rs.getInt("pacnum");
					String pacname = rs.getString("pacname");
					String paccontents = rs.getString("paccontents");
					String pacimage=rs.getString("pacimage");
					int pimgnum = rs.getInt("pimgnum");
					String pimgfilename = rs.getString("pimgfilename");
					int fk_pnum = rs.getInt("fk_pnum");
					
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("pnum",pnum);
					map.put("fk_pacname",fk_pacname);
					map.put("fk_sdname",fk_sdname);
					map.put("fk_ctname", fk_ctname);
					map.put("fk_stname",fk_stname);
					map.put("fk_etname",fk_etname);
					map.put("pname",pname);
					map.put("price", price);
					map.put("saleprice",saleprice);				
					map.put("point",point);
					map.put("pqty",pqty);
					map.put("pcontents",pcontents);
					map.put("pcompanyname",pcompanyname);
					map.put("pexpiredate",pexpiredate);
					map.put("allergy",allergy);
					map.put("weight",weight);
					map.put("salecount",salecount);
					map.put("plike",plike);
					map.put("pdate",pdate);
					map.put("pacnum",pacnum);
					map.put("paccontents",paccontents);
					map.put("pacimage",pacimage);
					map.put("pimgnum",pimgnum);
					map.put("pimgfilename",pimgfilename);
					map.put("fk_pnum",fk_pnum);
					
					pvoList.add(map);					
				}		
			} finally {
				close();
			}
			return pvoList;
	}
	
	// === Header에서 sdname 별 상품 보기
	@Override
	public List<ProductVO> getpackageList(String sdname)throws SQLException {
		
		 List<ProductVO> productList = null; 		
		 
	 try {		

		conn = ds.getConnection();			
/*		 String sql = " select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
				"        , sdname, ctname, stname, etname, pname, price\n"+
				"        , saleprice, point, pqty, pcontents\n"+
				"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				" from\n"+
				" (\n"+
				"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
				"            , sdname, ctname, stname, etname, pname, price \n"+
				"            , saleprice, point, pqty, pcontents \n"+
				"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				"    from view_Product \n"+
				"        where sdname = ? \n"+
				"        order by rnum asc, pname asc \n"+
				") F ";*/
				String sql = " select pacname,pacnum, pacimage \n"+
				"        , sdname,stname,pname, pnum,price, saleprice"+
				" from\n"+
				" (\n"+
				"    select rownum as rnum,pacnum,pacname\n"+
				"    , paccontents, pacimage, pnum \n"+
				"            , sdname, ctname, stname, etname, pname, price \n"+
				"            , saleprice, point, pqty, pcontents \n"+
				"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
				"    from view_Product \n"+
				"        where sdname = ? \n"+
				"        order by rnum asc, pname asc \n"+
				") F ";
		 	pstmt = conn.prepareStatement(sql);
		 	pstmt.setString(1, sdname);
		 	rs = pstmt.executeQuery();
		 	
		 	int cnt = 0;
		 	while(rs.next()) {
		 		cnt++;
		 		if(cnt ==1)  productList = new ArrayList<ProductVO>();
		 		
		 		String stname = rs.getString("stname");
		 		String pacname = rs.getString("pacname");
		 		String pacimage = rs.getString("pacimage");
		 		String pname = rs.getString("pname");
		 		String v_sdname = rs.getString("sdname");
		 		int saleprice = rs.getInt("saleprice");
		 		int price = rs.getInt("price");
		 		int pacnum = rs.getInt("pacnum");
		 		int pnum = rs.getInt("pnum");
		 		
		 		ProductVO pvo = new ProductVO();
		 		pvo.setFk_stname(stname);
		 		pvo.setPacname(pacname);
		 		pvo.setPname(pname);
		 		pvo.setPacimage(pacimage);
		 		pvo.setFk_sdname(v_sdname);
		 		pvo.setSaleprice(saleprice);
		 		pvo.setPrice(price);
		 		pvo.setPacnum(pacnum);
		 		pvo.setPnum(pnum);
		 		productList.add(pvo);		 		
		 	}		 	
	} finally {
		close();
	}
		return productList;
	}
	

	// ** Index.do 에서 NEW 상품 보기 추상 메소드 **
	@Override
	public List<HashMap<String, String>> getNewProductList() throws SQLException {
		List<HashMap<String, String>> newProductList = null;
	System.out.println("ProductDAO 1");
		try {	
			
				conn = ds.getConnection();			
			
				String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'NEW' and pacname != '없음' \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  newProductList = new ArrayList<HashMap<String,String>>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String sdname = rs.getString("sdname");
				 		String saleprice = rs.getString("saleprice");
				 		String pacnum = rs.getString("pacnum");
				 		
				 		HashMap<String,String> map = new HashMap<String, String>();
				 		
				 		map.put("pacname", pacname);
				 		map.put("pacimage",pacimage);
				 		map.put("sdname", sdname);
				 		map.put("saleprice",saleprice);
				 		map.put("pacnum",pacnum);
				 		
				 		newProductList.add(map);		 		
				 		
				 	}
				 	
			} finally {
				close();
			}

			return newProductList;
	}

		
	// ** Index.do 에서 BEST 상품 보기 추상 메소드 **
	@Override
	public List<HashMap<String, String>> getBestProductList() throws SQLException {
	List<HashMap<String, String>> newProductList = null;
	System.out.println("ProductDAO 1");
		try {	
			
				conn = ds.getConnection();			
			
				String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'BEST' and pacname != '없음' \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  newProductList = new ArrayList<HashMap<String,String>>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String sdname = rs.getString("sdname");
				 		String saleprice = rs.getString("saleprice");
				 		String pacnum = rs.getString("pacnum");
				 		HashMap<String,String> map = new HashMap<String, String>();
				 		
				 		map.put("pacname", pacname);
				 		map.put("pacimage",pacimage);
				 		map.put("sdname", sdname);
				 		map.put("pacnum",pacnum);
				 		map.put("saleprice",saleprice);
				 		
				 		newProductList.add(map);		 		
				 		
				 	}
				 	
			} finally {
				close();
			}

			return newProductList;
	}

	// ** Index.do 에서 상품 상세 리스트로 진입 하는 메소드 **
	// 상품 패키지에 대한 정도
	@Override
	public ProductVO getIndexProductDetail(int pacnum) throws SQLException{
		ProductVO productDetailList = null;
		
			try {						
					conn = ds.getConnection();			
				
					String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
							"        , sdname, ctname, stname, etname, pname, price\n"+
							"        , saleprice, point, pqty, pcontents\n"+
							"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
							" from\n"+
							" (\n"+
							"    select rownum as rnum,pacnum,pacname, paccontents, pacimage, pnum \n"+
							"            , sdname, ctname, stname, etname, pname, price \n"+
							"            , saleprice, point, pqty, pcontents \n"+
							"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
							"    from view_Product \n"+
							"        where pacnum = ? \n"+
							"        order by rnum asc, pname asc \n"+
							" ) F"; 
					 
					 	pstmt = conn.prepareStatement(sql);
					 	pstmt.setInt(1, pacnum);
					 	rs = pstmt.executeQuery();
					 	
					 	if(rs.next()) {
					 		productDetailList = new ProductVO();
					 		
					 		int rnum = rs.getInt("rnum");
					 		int v_pacnum = rs.getInt("pacnum");
					 		String pacname = rs.getString("pacname");
					 		String paccontents = rs.getString("paccontents");
					 		String pacimage = rs.getString("pacimage");
					 		int pnum = rs.getInt("pnum");
					 		String sdname = rs.getString("sdname");
					 		String ctname = rs.getString("ctname");
					 		String stname = rs.getString("stname");
					 		String etname = rs.getString("etname");
					 		String pname = rs.getString("pname");
					 		int price = rs.getInt("price");
					 		int saleprice = rs.getInt("saleprice");
					 		int point = rs.getInt("point");
					 		int pqty = rs.getInt("pqty");
					 		String pcontents = rs.getString("pcontents");
					 		String pcompanyname = rs.getString("pcompanyname");
					 		String pexpiredate = rs.getString("pexpiredate");
					 		String allergy = rs.getString("allergy");					 		
					 		int weight = rs.getInt("weight");
					 		int salecount = rs.getInt("salecount");
					 		int plike = rs.getInt("plike");
					 		String pdate = rs.getString("pdate");
					 		
					 		productDetailList.setRnum(rnum);
					 		productDetailList.setPacnum(v_pacnum);
					 		productDetailList.setPacname(pacname);
					 		productDetailList.setPaccontents(paccontents);
					 		productDetailList.setPacimage(pacimage);
					 		productDetailList.setPnum(pnum);
					 		productDetailList.setFk_sdname(sdname);
					 		productDetailList.setFk_ctname(ctname);
					 		productDetailList.setFk_stname(stname);
					 		productDetailList.setFk_etname(etname);
					 		productDetailList.setPname(pname);
					 		productDetailList.setPrice(price);
					 		productDetailList.setSaleprice(saleprice);
					 		productDetailList.setPoint(point);
					 		productDetailList.setPqty(pqty);
					 		productDetailList.setPcontents(pcontents);
					 		productDetailList.setPcompanyname(pcompanyname);
					 		productDetailList.setPexpiredate(pexpiredate);
					 		productDetailList.setAllergy(allergy);
					 		productDetailList.setWeight(weight);
					 		productDetailList.setSalecount(salecount);
					 		productDetailList.setPlike(plike);
					 		productDetailList.setPdate(pdate);
		
					 							 	}
					 	
				} finally {
					close();
				}
				return productDetailList;
	}
	
	// ** 상품 패키지 단품명, 사
	@Override
	public List<ProductVO> getProductDateilList(int pacnum) throws SQLException {
		List<ProductVO> productDetailList = null;

		try {	
				
				conn = ds.getConnection();			
			
				String sql = " select pnum,fk_pacname,price,saleprice,point,pqty,pcontents,pcompanyname\n"+
						" ,pexpiredate,pname,allergy,weight,salecount\n"+
						"	,plike,pdate,pimgnum,pimgfilename,pacnum \n"+
						" from product A join product_images  B \n"+
						" on A.pnum = B.fk_pnum \n"+
						" join product_package C \n"+
						" on A.fk_pacname = C.pacname \n"+
						" where pacnum = ? ";
																
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setInt(1, pacnum);
				 	rs = pstmt.executeQuery();
				 	
				 	int cnt =0;
				 	while(rs.next()) {
				 		
				 		cnt++;
				 		if(cnt == 1) productDetailList = new ArrayList<ProductVO>();
				 		
				 		int pnum = rs.getInt("pnum");
				 		int v_pacnum =rs.getInt("pacnum");
				 		String pacname = rs.getString("fk_pacname");
				 		String pname = rs.getString("pname");
				  		int price = rs.getInt("price");
				 		int saleprice = rs.getInt("saleprice");
				 		int point = rs.getInt("point");
				 		int pqty = rs.getInt("pqty");
				 		String pcontents = rs.getString("pcontents");
				 		String pcompanyname = rs.getString("pcompanyname");
				 		String pexpiredate = rs.getString("pexpiredate");		 		
				 		String allergy = rs.getString("allergy");
				 		int weight = rs.getInt("weight");
				 		int salecount = rs.getInt("salecount");
				 		int plike = rs.getInt("plike");
				 		String pdate = rs.getString("pdate");	
				 		int pimgnum = rs.getInt("pimgnum");
				 		String pimgfilename = rs.getString("pimgfilename");
				 		
				 		
				 		ProductVO pvo = new ProductVO();
				 		pvo.setPacnum(v_pacnum);
				 		pvo.setPacname(pacname);
				 		pvo.setPnum(pnum);
				 		pvo.setPname(pname);
				 		pvo.setPrice(price);
				 		pvo.setSaleprice(saleprice);
				 		pvo.setPoint(point);
				 		pvo.setPqty(pqty);
				 		pvo.setPcontents(pcontents);
				 		pvo.setPcompanyname(pcompanyname);
				 		pvo.setPexpiredate(pexpiredate);
				 		pvo.setAllergy(allergy);
				 		pvo.setWeight(weight);
				 		pvo.setSalecount(salecount);
				 		pvo.setPlike(plike);
				 		pvo.setPdate(pdate);
				 		pvo.setPimgnum(pimgnum);
				 		pvo.setPimgfilename(pimgfilename);
				 		productDetailList.add(pvo);
				 	}				 	
			} finally {
				close();
			}
			return productDetailList;
	}

	//** 상품 리스트에서 Best 상품 불러오기 
	@Override
	public List<ProductVO> getProductDetailSpecList(String sdname) throws SQLException {	
		
		List<ProductVO> productBestList = null;
			try {			
				conn = ds.getConnection();			
			
				String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
						"        , sdname, ctname, stname, etname, pname, price\n"+
						"        , saleprice, point, pqty, pcontents\n"+
						"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						" from\n"+
						" (\n"+
						"    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum \n"+
						"            , sdname, ctname, stname, etname, pname, price \n"+
						"            , saleprice, point, pqty, pcontents \n"+
						"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
						"    from view_Product \n"+
						"        where stname = 'BEST' and sdname = ? \n"+
						"        order by rnum asc, pname asc \n"+
						" ) F ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setString(1, sdname);
				 	rs = pstmt.executeQuery();
				 	int cnt = 0;
				 	while(rs.next()) {
				 		cnt++;
				 		if(cnt ==1)  productBestList = new ArrayList<ProductVO>();
				 		
				 		String pacname = rs.getString("pacname");
				 		String pacimage = rs.getString("pacimage");
				 		String v_sdname = rs.getString("sdname");
				 		int saleprice = rs.getInt("saleprice");
				 		int pacnum = rs.getInt("pacnum");
				 		
				 		System.out.println(pacimage);
				 		System.out.println(pacname);
				 		
				 		ProductVO pvo = new ProductVO();
				 		
				 		pvo.setPacname(pacname);
				 		pvo.setPacimage(pacimage);
				 		pvo.setFk_sdname(v_sdname);
				 		pvo.setSaleprice(saleprice);
				 		pvo.setPacnum(pacnum);
				 		
				 		productBestList.add(pvo);					 	 		
				 	}				 	
			} finally {
				close();
			}
			return productBestList;
		}
	
	
	public List<ProductVO> getProductDetailImage(String pacname) throws SQLException{
		
		List<ProductVO> productBestList = null;
		try {			
			conn = ds.getConnection();			
		
			String sql = " select pimgnum,pimgfilename,fk_pacname,pnum,pname,saleprice,point,pcontents,pcompanyname,pexpiredate, allergy,salecount,weight \n"+
					" from product A join product_images B \n"+
					" on B.fk_pnum = A.pnum \n"+
					" where fk_pacname= ? ";
			
			 
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.setString(1, pacname);
			 	rs = pstmt.executeQuery();
			 	int cnt = 0;
			 	while(rs.next()) {
			 		cnt++;
			 		if(cnt ==1)  productBestList = new ArrayList<ProductVO>();
			 		
			 		String v_pacname = rs.getString("fk_pacname");
			 		int pimgnum = rs.getInt("pimgnum");
			 		String pimgfilename = rs.getString("pimgfilename");
			 		String pname = rs.getString("pname");
			 		int pnum = rs.getInt("pnum");
			 		int saleprice = rs.getInt("saleprice");
	
			 		ProductVO pvo = new ProductVO();
			 		
			 		pvo.setPacname(v_pacname);
			 		pvo.setPimgfilename(pimgfilename);
			 		pvo.setPimgnum(pimgnum);
			 		pvo.setSaleprice(saleprice);
			 		pvo.setPnum(pnum);
			 		pvo.setPname(pname);
			 		
			 		productBestList.add(pvo);					 	 		
			 	}				 	
		} finally {
			close();
		}
		return productBestList;

	}
	

	
	@Override
	
	public List<ProductVO> getProductsByPspecAppend(String stname,String sdname) throws SQLException{
		System.out.println("DAODAO1");
		List<ProductVO> productList = null;
		
		try {
			conn = ds.getConnection();

			String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
					"        , sdname, ctname, stname, etname, pname, price\n"+
					"        , saleprice, point, pqty, pcontents\n"+
					"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					" from\n"+
					" (\n"+
					"    select rownum as rnum,pacnum,\n"+
					"            case when pacname = '없음' then pname else pacname end as pacname, paccontents, pacimage, pnum \n"+
					"            , sdname, ctname, stname, etname, pname, price \n"+
					"            , saleprice, point, pqty, pcontents \n"+
					"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					"    from view_Product \n"+
					"        where stname = ? and sdname = ?\n"+
					"        order by rnum asc, pname asc \n"+
					" ) F";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			pstmt.setString(2, sdname);

			rs = pstmt.executeQuery();
			System.out.println("DAODAO3");
			int cnt = 0;
			while(rs.next()) {	
				System.out.println("DAODAO5");
				cnt++;				
				if(cnt==1) productList = new ArrayList<ProductVO>();
				System.out.println("DAODAO4");
				 int pnum = rs.getInt("rnum");
				 int pacnum = rs.getInt("pacnum");
				 String pacname = rs.getString("pacname");
				 String pacimage = rs.getString("pacimage");
				 String v_stname = rs.getString("stname");
				 int price = rs.getInt("price");
				 int saleprice = rs.getInt("saleprice");
				 int plike = rs.getInt("plike");
				 int salecount = rs.getInt("salecount");

				 ProductVO pvo = new ProductVO();
				 
				 pvo.setPnum(pnum);
				 pvo.setPacnum(pacnum);
				 pvo.setPacname(pacname);
				 pvo.setPacimage(pacimage);
				 pvo.setFk_stname(v_stname);
				 pvo.setPrice(saleprice);
				 pvo.setSalecount(salecount);
				 pvo.setSaleprice(saleprice);
				 pvo.setPlike(plike);				 
				 
				 productList.add(pvo);
				
			} // end of while-------------------
						
		} finally {
			close();
		}
		
		return productList;	
	}
	
	// ** AJAX를 이용한 index에서 스펙대로 제품 리스트를 보여주는 추상 메소드
	@Override
	public List<ProductVO> getProductsByStnameAppend(String stname, int startRno, int endRno) throws SQLException {
		List<ProductVO> productList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select rnum, pacnum, pacname, paccontents, pacimage, pnum \n"+
					"        , sdname, ctname, stname, etname, pname, price\n"+
					"        , saleprice, point, pqty, pcontents\n"+
					"        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					" from \n"+
					" (\n"+
					"    select rownum as rnum,pacnum,  case when pacname = '없음' then pname else pacname end as pacname,paccontents, pacimage, pnum \n"+
					"            , sdname, ctname, stname, etname, pname, price \n"+
					"            , saleprice, point, pqty, pcontents \n"+
					"            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate \n"+
					"    from view_Product \n"+
					"        where stname = ? \n"+
					"        order by rnum asc, pname asc \n"+
					" ) F where rnum between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			pstmt.setInt(2, startRno);
			pstmt.setInt(3, endRno);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1) {
					productList = new ArrayList<ProductVO>();
				}
				
			     int rnum = rs.getInt("rnum");
				 int pnum = rs.getInt("pacnum");
				 String pacname = rs.getString("pacname");
				 String paccontents = rs.getString("paccontents");
				 String pacimage = rs.getString("pacimage");
				 String ctname = rs.getString("ctname");
				 String sdname = rs.getString("sdname");
				 int price = rs.getInt("price");
				 int plike = rs.getInt("plike");
				 int saleprice = rs.getInt("saleprice");
				 System.out.println(pacname); 
				 ProductVO pvo = new ProductVO();
				 pvo.setRnum(rnum);
				 pvo.setPnum(pnum);
				 pvo.setFk_pacname(pacname);
				 pvo.setPaccontents(paccontents);
				 pvo.setPacimage(pacimage);
				 pvo.setFk_ctname(ctname);
				 pvo.setFk_sdname(sdname);
				 pvo.setPrice(price);
				 pvo.setPlike(plike);
				 pvo.setSaleprice(saleprice);
				 
				 productList.add(pvo);				 
				
			} // end of while-------------------
						
		} finally {
			close();
		}
		
		return productList;	
		
	}
	
	// *** Ajax 를 이용한 더보기 방식으로 페이징 처리를 위해서 pspec 별 제품의 갯수를 알아오는 메소드 생성하기 *** //
	@Override
	public int totalPspecCount(String stname) throws SQLException {
	int totalCount = 0;
	System.out.println(stname);
		try{
			conn = ds.getConnection();
			String sql = " select count(*) AS CNT \n"+
					" from view_Product \n"+
					" where stname = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stname);
			
			rs = pstmt.executeQuery();

			rs.next();
			
			totalCount = rs.getInt("CNT");			
		 } finally{
			close();
		 }
		
		return totalCount;		
		
	}
	
	public ProductVO noPackageProduct(int pnum) throws SQLException{
		ProductVO productDetailList = null;
		
		try {						
				conn = ds.getConnection();			
			
			String sql = " select pimgfilename,fk_pnum,fk_pacname,pname \n"+
				" from product_images A join product B \n"+
				" on fk_pnum = pnum\n"+
				" where fk_pnum = ? ";
				 
				 	pstmt = conn.prepareStatement(sql);
				 	pstmt.setInt(1, pnum);
				 	rs = pstmt.executeQuery();
				 	
				 	if(rs.next()) {
				 		productDetailList = new ProductVO();
				 		
				 		
						int v_pnum = rs.getInt("fk_pnum");
				 		String pimgfilename = rs.getString("pimgfilename");			
				 		String fk_pacname = rs.getString("fk_pacname");
				 		String pname = rs.getString("pname");
				 		productDetailList.setPnum(v_pnum);				 		
				 		productDetailList.setPimgfilename(pimgfilename);				 		
				 		productDetailList.setFk_pacname(fk_pacname);				 		
				 		productDetailList.setPname(pname);
							 				
	
				 	}
				 	
			} finally {
				close();
			}
			return productDetailList;

	}
	}
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git



