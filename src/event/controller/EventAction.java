package event.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import event.model.EventDAO;
import event.model.EventVO;
import event.model.InterEventDAO;

public class EventAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterEventDAO edao = new EventDAO();
<<<<<<< HEAD
		String etname = req.getParameter("etname");
		
		List<EventVO> eventList = edao.getEventList();

		req.setAttribute("eventList", eventList);		
=======
		
		List<EventVO> eventList = edao.getEventList();
	
		req.setAttribute("eventList", eventList);
		
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/event.jsp");

	}

}
