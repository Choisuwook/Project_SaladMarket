package my.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;

public class MyUtil {
		//*** ?다음 주소까지 포함한 현재 URL주소***
	public static String getCurrentURL(HttpServletRequest request) {
		
	String currentURL = request.getRequestURL().toString();
	
	String queryString = request.getQueryString();

	currentURL += "?"+queryString;

	String ctxtPath = request.getContextPath();

	int beginIndex = currentURL.indexOf(ctxtPath)+ctxtPath.length();
	currentURL = currentURL.substring(beginIndex+1);
	System.out.println(currentURL);
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
	   
	// *** 검색어 포함된 페이지바 만들기 ***
	   public static String getSearchPageBar(String url,int currentShowPageNo,int sizePerPage,int totalPage,String searchWord,int blockSize) {
		      String pageBar="";
		    
		      int loop = 1; 
		      int pageNo = ((currentShowPageNo-1)/blockSize) * blockSize+1;
		      if(searchWord == null) searchWord ="";
		      if(pageNo!=1){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+(pageNo-1)
		               +"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"\"> [이전] </a>&nbsp;";
		      }
		      while(!(pageNo>totalPage||loop>blockSize)) {
		         if(pageNo==currentShowPageNo) {
		            pageBar+="&nbsp;<span style=\"color:red; font-size:13pt font-weight: bold;\">"+pageNo+"&nbsp;";
		         }
		         else {
		            pageBar+="&nbsp;<a href=\" "+url
		                  +"?currentShowPageNo="+pageNo
		                  +"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"\">"+pageNo+"</a>&nbsp;"; // Get방식
		         }
		         pageNo++;
		         loop++;
		      }
		      
		      if(!(pageNo>totalPage)){
		         pageBar+="&nbsp;<a href=\" "+url
		               +"?currentShowPageNo="+pageNo
		               +"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"\"> [다음] </a>&nbsp;";
		      }
		      return pageBar;
		   }


}
