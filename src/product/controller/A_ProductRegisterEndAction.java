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
		
		String pacname =req.getParameter("pacname");
		String sdname = req.getParameter("sdname");
		String ctname = req.getParameter("ctname");
		String stname = req.getParameter("stname");
		String etname = req.getParameter("etname");
		String pname = req.getParameter("pname");
		String point = req.getParameter("point");
		String pqty = req.getParameter("pqty");
		String pcontents =req.getParameter("pcontents");
		String pcompanyname =req.getParameter("pcompanyname");
		String pexpiredate = req.getParameter("pexpiredate");
		String allergy = req.getParameter("allergy");
		String weight = req.getParameter("weight");
		String attachCount = req.getParameter("attachCount");

		System.out.println(attachCount);
		System.out.println(weight);
		HttpSession session = req.getSession();
		ServletContext sclCtx = session.getServletContext();
		String imagesDir = sclCtx.getRealPath("/img/productImg");
				
		System.out.println("이미지 경로"+imagesDir);
		
		MultipartRequest mtreq = null;
		mtreq = new MultipartRequest(req, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
				
		int m =1;
		int pnum = pdao.getNextPnum();
		for(int i=0;i<Integer.parseInt(attachCount);i++) {
			String attachFilename = mtreq.getFilesystemName("attach"+i);
			m = pdao.product_imagefile_Insert(pnum, attachFilename);
			
			if(m == 0) break;
		}
		ProductVO pvo = new ProductVO();
		pvo.setPacname(pacname);
		pvo.setSdname(sdname);
		pvo.setCtname(ctname);
		pvo.setEtname(etname);
		pvo.setPname(pname);
		pvo.setPoint(Integer.parseInt(point));
		pvo.setPqty(Integer.parseInt(pqty));
		pvo.setPcontents(pcontents);
		pvo.setPcompanyname(pcompanyname);
		pvo.setPexpiredate(pexpiredate);
		pvo.setAllergy(allergy);
		pvo.setWeight(Integer.parseInt(weight));
		
		int n=0;
		
		n = pdao.adminProductInsert(pvo);
		String msg="";
		String loc="";
		if(n*m ==1) {
			msg= "제품등록 최종 성공!";
			loc=req.getContextPath()+"/admin_index.do";			
		}else {
			msg="제품등록 최종 실패!";
			loc = req.getContextPath()+"/admin_index.do";		
		}
	}

}
