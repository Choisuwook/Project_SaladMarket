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



