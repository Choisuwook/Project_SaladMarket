package my.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;

public class MyUtil {
		//*** ?다음 주소까지 포함한 현재 URL주소***
	public static String getCurrentURL(HttpServletRequest request) {
		
	String currentURL = request.getRequestURL().toString();
	// 물음표 앞까지의 주소 , 실제 페이지
	// http://localhost:9090/MyWeb/member/memberDetail.jsp
	String queryString = request.getQueryString();
	// 물음표 다음의 주소, 데이터값.
 	//sizePerPage=5&currentShowPageNo=5&searchType=name&searchWord=%EC%9C%A0%EB%AF%B8&period=-1%3E
	
	currentURL += "?"+queryString;
	//http://localhost:9090/MyWeb/member/memberDetail.jsp?sizePerPage=5&currentShowPageNo=5&searchType=name&searchWord=%EC%9C%A0%EB%AF%B8&period=-1%3E
 	
	String ctxtPath = request.getContextPath();
	// /MyWeb
	
	int beginIndex = currentURL.indexOf(ctxtPath)+ctxtPath.length();
	//21(http://localhost:9090/) + '/MyWeb' 의 길이 = 6
	
	currentURL = currentURL.substring(beginIndex+1);//1을 하는 이유는 MyWeb 다음의 /도 포함하고 있기 때문이다.
	
	return currentURL;
	}// end of getCurrentURL
	
	
	// *** 검색어 및 날짜구간 (period)이 포함된 페이지바 만들기 ***
	   public static String getSearchPageBar(String url,int currentShowPageNo,int sizePerPage,int totalPage,int blockSize,String searchType,String searchWord, int period) {
		      String pageBar="";
		      // blockSize 1개의 블럭당 보여줄 페이지 번호의 갯수
		      int loop = 1; // 1부터증가하여 1개 블럭을 이루는 페이지 번호의 갯수(지금은 10개)
		      int pageNo = ((currentShowPageNo-1)/blockSize) * blockSize+1;
		      //이전만들기
		      if(pageNo!=1){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+(pageNo-1)
		               +"&sizePerPage="+sizePerPage
		               +"&searchType="+searchType
		               +"&searchWord="+searchWord
		               +"&period="+period+"\"> [이전] </a>&nbsp;";
		      }
		      while(!(pageNo>totalPage||loop>blockSize)) {
		         if(pageNo==currentShowPageNo) {
		            pageBar+="&nbsp;<span style=\"color:red; font-size:13pt font-weight: bold;\">"+pageNo+"&nbsp;";
		         }
		         else {
		            pageBar+="&nbsp;<a href=\" "+url
		                  +"?currentShowPageNo="+pageNo
		                  +"&sizePerPage="+sizePerPage
		                  +"&searchType="+searchType
		                  +"&searchWord="+searchWord
		                  +"&period="+period+"\">"+pageNo+"</a>&nbsp;"; // Get방식
		         }
		         pageNo++;
		         loop++;
		      }
		      //다음만들기
		      if(!(pageNo>totalPage)){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+pageNo
		               +"&sizePerPage="+sizePerPage
		               +"&searchType="+searchType
		               +"&searchWord="+searchWord
		               +"&period="+period+"\"> [다음] </a>&nbsp;";
		      }
		      return pageBar;
		   }
	   
	// *** 검색어 및 날짜구간 (period)이 포함된 페이지바 만들기 ***
	   public static String getSearchPageBar(String url,int currentShowPageNo,int sizePerPage,int totalPage,int blockSize, int period) {
		      String pageBar="";
		      // blockSize 1개의 블럭당 보여줄 페이지 번호의 갯수
		      int loop = 1; // 1부터증가하여 1개 블럭을 이루는 페이지 번호의 갯수(지금은 10개)
		      int pageNo = ((currentShowPageNo-1)/blockSize) * blockSize+1;
		      //이전만들기
		      if(pageNo!=1){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+(pageNo-1)
		               +"&sizePerPage="+sizePerPage
		               +"&period="+period+"\"> [이전] </a>&nbsp;";
		      }
		      while(!(pageNo>totalPage||loop>blockSize)) {
		         if(pageNo==currentShowPageNo) {
		            pageBar+="&nbsp;<span style=\"color:red; font-size:13pt font-weight: bold;\">"+pageNo+"&nbsp;";
		         }
		         else {
		            pageBar+="&nbsp;<a href=\" "+url
		                  +"?currentShowPageNo="+pageNo
		                  +"&sizePerPage="+sizePerPage
		                  +"&period="+period+"\">"+pageNo+"</a>&nbsp;"; // Get방식
		         }
		         pageNo++;
		         loop++;
		      }
		      //다음만들기
		      if(!(pageNo>totalPage)){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+pageNo
		               +"&sizePerPage="+sizePerPage
		               +"&period="+period+"\"> [다음] </a>&nbsp;";
		      }
		      return pageBar;
		   }


}
