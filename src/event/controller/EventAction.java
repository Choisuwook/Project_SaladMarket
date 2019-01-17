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
		
		List<EventVO> eventList = edao.getEventList();
	
		req.setAttribute("eventList", eventList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/event.jsp");

	}

}
