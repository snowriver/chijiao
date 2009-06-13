/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.ask;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.service.ask.AskAnswerManager;
import com.forbes.service.ask.AskSearchManager;



/** 
 * MyEclipse Struts
 * Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * @struts.action path="/client/ClientLogin" name="clientLoginForm" attribute="ClientLoginForm" input="/client/ClientLogin.jsp" scope="request" validate="true"
 * @struts.action-forward name="success" path="/client/ClientLoginOk.jsp"
 * @struts.action-forward name="fail" path="/client/ClientLoginFail.jsp"
 */
public class AnswerQuestionAction extends Action {
	/*#com.she.web.form.client.ClientLoginForm Dependency20*/
/*
	 * Generated Methods
	 */

	private AskSearchManager askSearchManager;
	
	private AskAnswerManager askAnswerManager;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ForbesException {
		
		//UserLoginForm userLoginForm = (UserLoginForm) form;// TODO Auto-generated method stub

		
		String id	 		 = request.getParameter("id");
		String content 		 = request.getParameter("content");
		String referto 		 = request.getParameter("referto");
		
		UcMembers user = (UcMembers)request.getSession().getAttribute("CLIENT");
		Ask a = askSearchManager.getAsk(Integer.parseInt(id));
		
		//System.out.println("user?null:"+(user==null) );
		//System.out.println("a.id:"+a.getId() );
	
			try {
				
				if((int)a.getUserId() != (int)user.getUid()) {
					if( !askAnswerManager.checkIfAnswer(user.getUid(), Integer.parseInt(id)) ) {
						//System.out.println("User.id = " + user.getUid());
						AskAnswer aa = new AskAnswer();
						//aa.setUser(user);
						aa.setUserId(user.getUid());
						aa.setAsk(a);
						aa.setContent(content);
						aa.setReferTo(referto);
						aa.setUserIp(request.getRemoteAddr());
						aa.setPubdate(new Date());
						
						aa.setIfAnswer(new Short("0"));
						aa.setLoginName(user.getUsername());
						aa.setAnonymous(new Short("0"));
						aa.setBadRate(new Short("0"));
						aa.setGoodRate(new Short("0"));
						aa.setIfCheck(new Short("0"));
														
						//System.out.println("1");
						askAnswerManager.answerQuestion(user, aa);
						//System.out.println("2");
						request.setAttribute("RESULT_MESSAGE", "SUCCESS" );
					}
					else {
						request.setAttribute("RESULT_MESSAGE", "ALREADY" );
					}
				}
				else {
					request.setAttribute("RESULT_MESSAGE", "SELF" );
				}
				//request.setAttribute("RETURN_URL", "ArticleView.do?id="+id );
				return mapping.findForward("ok");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("RESULT_MESSAGE", "FAIL" );
				return mapping.findForward("ok");
	
			}
	}

	public AskSearchManager getAskSearchManager() {
		return askSearchManager;
	}

	public void setAskSearchManager(AskSearchManager askSearchManager) {
		this.askSearchManager = askSearchManager;
	}

	public AskAnswerManager getAskAnswerManager() {
		return askAnswerManager;
	}

	public void setAskAnswerManager(AskAnswerManager askAnswerManager) {
		this.askAnswerManager = askAnswerManager;
	}
	
}