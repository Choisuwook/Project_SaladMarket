package event.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import common.controller.AbstractController;
import event.model.*;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class EventDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		InterEventDAO dao = new EventDAO();

		InterProductDAO pdao = new ProductDAO();

		String etnum = req.getParameter("etnum");
		String etname = req.getParameter("etname");

		List<HashMap<String,Object>> productList = dao.getProImgPnameFile(etname);

		int paclEventCount = dao.getEventTotalCount(etname);
		System.out.println(paclEventCount);
		int noPacEventCout = dao.getNoPacEventTotalCount(etname);
		int totalEventCount = paclEventCount+noPacEventCout;
		req.setAttribute("totalEventCount", totalEventCount);

		req.setAttribute("etname", etname);
		req.setAttribute("productList", productList);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/eventDetail.jsp");

	}

}