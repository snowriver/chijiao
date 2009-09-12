package com.forbes.struts.action.ask;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.service.ask.AskAnswerManager;
import com.forbes.service.ask.AskManager;
import com.forbes.service.ask.AskSearchManager;
import com.forbes.util.Pager;


public class AskSearchAction extends DispatchAction {

	private AskSearchManager askSearchManager;
	
	private AskManager askManager;
	
	private AskAnswerManager askAnswerManager;
	
	
	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//System.out.println(" ask top ask list...");

		String status  = request.getParameter("status");
		String orderby = request.getParameter("orderby");
		try {
			
			List list = askSearchManager.getTopAsk(null, status, orderby, 0, 10);
			request.setAttribute( "ASK_LIST", list);
			
			return mapping.findForward("index");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward pop(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String status  = request.getParameter("status");
		String orderby = request.getParameter("orderby");
		try {
			
			List list = askSearchManager.getTopAsk(null, status, orderby, 0, 10);
			request.setAttribute( "ASK_LIST", list);
			
			return mapping.findForward("pop");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public AskSearchManager getAskSearchManager() {
		return askSearchManager;
	}

	public void setAskSearchManager(AskSearchManager askSearchManager) {
		this.askSearchManager = askSearchManager;
	}
	
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String typeid    = request.getParameter("typeid");
		String status    = request.getParameter("status");
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		String pageNo    = request.getParameter("pno");
		
		String flag     = request.getParameter("flag");
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("typeid", typeid);
		map.put("status", status);
		map.put("orderby", orderby);
		map.put("flag", flag);
		
		try {
			
			int iPageNo = 1;
			try {
				if( pageNo != null ){
					iPageNo = Integer.parseInt( pageNo );
				}
			} catch( Exception e ){ }

			List list = null;
			Pager pager = new Pager();
			pager.setCntOfPage( 5 );
			pager.setCurPage( iPageNo );
			
			list = askSearchManager.getAskByPage(pager, iPageNo, null, typeid, status, keyword, orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ASK_LIST", list);
			
			return mapping.findForward("search");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String  id = request.getParameter("id");
		
		System.out.print(id);
		try {
			
			Ask ask = askSearchManager.getAsk(Integer.parseInt(id));
			ask.setViews(ask.getViews() + 1);
			askManager.updateAsk(ask);
			request.setAttribute( "ASK", ask);
			
			AskAnswer aa = null;
			if(ask.getBestAnswer() != null)
				aa = askAnswerManager.getAskAnswer(ask.getBestAnswer());
			
			request.setAttribute( "BEST_ASK_ANSWER", aa);
			return mapping.findForward("view");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public AskManager getAskManager() {
		return askManager;
	}

	public void setAskManager(AskManager askManager) {
		this.askManager = askManager;
	}

	public AskAnswerManager getAskAnswerManager() {
		return askAnswerManager;
	}

	public void setAskAnswerManager(AskAnswerManager askAnswerManager) {
		this.askAnswerManager = askAnswerManager;
	}
	
}