package product.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterProductDAO {

	// ** 제품 상세페이지에 들어가는 제품 정보 불러오는 메소드 **
	List<HashMap<String, Object>> getProductDetail(int pnum) throws SQLException;

	// ** 제품 리스트를 가져오는 추상 메소드 ** 
	 List<ProductVO> getpackageList(String sdname) throws SQLException;
	
	 // ** Index.do 에서 NEW 상품 보기 추상 메소드 **
	 List<HashMap<String, String>> getNewProductList() throws SQLException;
	 
	 // ** Index.do 에서 BEST 상품 보기 추상 메소드 **
	 List<HashMap<String, String>> getBestProductList() throws SQLException;

	 // ** Index.do 에서 상품 상세 리스트로 진입 하는 추상 메소드 **
	 ProductVO  getIndexProductDetail(int pacnum) throws SQLException;
	 
	 // ** Header에서 제품 sdname으로 진입 시 제품 리스트를 보여주는 추상메소드
	// 상품 패키지 단품명, 사진 
	List<ProductVO> getProductDateilList(int pnum) throws SQLException;
	

	// ** 제품리스트에서 스펙대로 제품 리스트를 보여주는 추상 메소드
	List<ProductVO> getProductDetailSpecList(String sdname) throws SQLException;

	// ** AJAX를 이용한 제품리스트에서 스펙대로 제품 리스트를 보여주는 추상 메소드
	List<ProductVO> getProductsByPspecAppend(String stname,String sdname)throws SQLException;

	// ** AJAX를 이용한 index에서 스펙대로 제품 리스트를 보여주는 추상 메소드
	List<ProductVO> getProductsByStnameAppend(String stname, int startRno, int endRno) throws SQLException;
	
	// *** Ajax 를 이용한 더보기 방식으로 페이징 처리를 위해서 stname 별 제품의 갯수를 알아오는 메소드 생성하기 *** //
	int totalPspecCount(String stname) throws SQLException;
	// === 불러온 상품 패키지에 대한 상품 상세정보 불러오기(상품 상세 이미지, 상품 상세 이름)
	List<ProductVO> getProductDetailImage(String pacname) throws SQLException;
	
	// === 패키지 없는 상품 상세보기 
	ProductVO noPackageProduct(int pnum) throws SQLException;
} 


