package product.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class A_ProductRegisterEndAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		InterProductDAO pdao = new ProductDAO();
		HttpSession session = req.getSession();
		ServletContext sclCtx = session.getServletContext();
		String imagesDir = sclCtx.getRealPath("/img/productImg");
		
		MultipartRequest mtreq = null;	
		
		mtreq = new MultipartRequest(req, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
						
		String pacname =mtreq.getParameter("pacname");
		String sdname = mtreq.getParameter("sdname");
		String ctname = mtreq.getParameter("ctname");
		String stname = mtreq.getParameter("stname");
		String etname = mtreq.getParameter("etname");
		String pname = mtreq.getParameter("pname");
		String str_point = mtreq.getParameter("point");
		String str_pqty = mtreq.getParameter("pqty");
		String pcontents =mtreq.getParameter("pcontents");
		String pcompanyname =mtreq.getParameter("pcompanyname");
		String pexpiredate = mtreq.getParameter("pexpiredate");
		String allergy = mtreq.getParameter("allergy");
		String str_saleprice = mtreq.getParameter("saleprice");
		String str_price = mtreq.getParameter("price");
		String str_weight = mtreq.getParameter("weight");
		String attachCount = mtreq.getParameter("attachCount");
	
		int m =1;
		int point = Integer.parseInt(str_point);
		int pqty = Integer.parseInt(str_pqty);
		int saleprice = Integer.parseInt(str_saleprice);
		int price = Integer.parseInt(str_price);
		int weight = Integer.parseInt(str_weight);
		
		int pnum = pdao.getNextPnum();
		
		ProductVO pvo = new ProductVO();
		pvo.setPnum(pnum);
		pvo.setPacname(pacname);
		pvo.setSdname(sdname);
		pvo.setStname(stname);
		pvo.setCtname(ctname);
		pvo.setEtname(etname);
		pvo.setPname(pname);
		pvo.setSaleprice(saleprice);
		pvo.setPrice(price);
		pvo.setPoint(point);
		pvo.setPqty(pqty);
		pvo.setPcontents(pcontents);
		pvo.setPcompanyname(pcompanyname);
		pvo.setPexpiredate(pexpiredate);
		pvo.setAllergy(allergy);
		pvo.setWeight(weight);
		int n=0;
		
		n = pdao.adminProductInsert(pvo);
		for(int i=0;i<Integer.parseInt(attachCount);i++) {
			String attachFilename = mtreq.getFilesystemName("attach"+i);
			m = pdao.product_imagefile_Insert(pnum, attachFilename);
			
			if(m == 0) break;
		}	
		
		String msg="";
		String loc="";
		if(n*m ==1) {
			msg= "제품등록 최종 성공!";
			loc=req.getContextPath()+"/admin_index.do";	
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
		}else {
			msg="제품등록 최종 실패!";
			loc = req.getContextPath()+"/admin_index.do";		
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		}
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
	}

	

}
