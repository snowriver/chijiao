package com.forbes.struts.action.ucenter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.service.ucenter.AuthCode;
import com.forbes.service.user.UserInfoManager;
import com.forbes.service.useraction.UserActionTask;
import com.forbes.service.useraction.action.UserLoginAction;
import com.forbes.thread.TaskManager;

public class UCenterAction extends Action {
	
    private String key = "123456";
	
	private String API_RETURN_SUCCEED	= "1";
	private String API_RETURN_FAILED	= "-1";
	private String API_RETURN_FORBIDDEN	= "-2";
	
	private  UserInfoManager userInfoManager;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try{
			String code = request.getParameter("code");
			System.out.println("----code:" + code );
			
			if ( code == null ){
				return mapping.findForward("index");
				
			}
			System.out.println("----code:" + code );
			String parseStr = AuthCode.authcodeDecode(code, key);
			System.out.println("-------------ucneter:" + parseStr);
			String action = getParam(parseStr,"action");
			
			if( action.equals("test")){
				request.setAttribute("RS", API_RETURN_SUCCEED);
			}
			else if (action.equals("updateapps")) {
				request.setAttribute("RS", API_RETURN_SUCCEED);
			}
			else if (action.equals("deleteuser")) {

			}else if (action.equals("renameuser")) {

			}else if (action.equals("updatepw")) {

			}else if (action.equals("synlogin")) {
				String uid = getParam(parseStr,"uid");
				UcMembers client = userInfoManager.getUcMember(Integer.parseInt(uid));
				System.out.println("synlogin: user id = " + client.getUid());
				login(client, request);
											
				request.setAttribute("RS", API_RETURN_SUCCEED);
			}else if (action.equals("synlogout")) {
				request.getSession().invalidate();
				request.setAttribute("RS", API_RETURN_SUCCEED);
			}else if (action.equals("updatepw")) {

			}
			
		}catch( Exception e ){			
			request.setAttribute("RS", API_RETURN_FAILED);
			
		}
		return mapping.findForward("ucrs");
	}
	public String getParam(String str,String keyName ){
		if ( str == null || str.length() < 0 ){
			return null;
		}
		try {
			String[] strs = str.split("&");
			for (String tmpStr : strs) {
				String[] keyVal = tmpStr.split("=");
				if (keyVal.length > 0) {
					if (keyVal[0].equals(keyName)) {
						if (keyVal.length == 2) {
							return keyVal[1];
						} else {
							return "";
						}
					}
				}
			}
		} catch (Exception e) {
			return null;
		}
		return null;
	}
    public void login(UcMembers client,HttpServletRequest request){
    	if( client != null ){
			//if( client.getActive().equals("Y") ) {
				
                //把用户信息注入acegi
				//Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
				/*User acegiUser = new User(client.getId().toString(),client.getPassword(),true,true,true,true,new GrantedAuthorityImpl[0]); 
				Authentication authtication = new UsernamePasswordAuthenticationToken(acegiUser,null);
				SecurityContextHolder.getContext().setAuthentication(authtication);
				//System.out.println("---------acegi login ok");
				AuthorizeTag.resetRights(client.getId().toString());*/
				
				
				request.getSession().setAttribute("CLIENT", client);
				

                //産生活動日志
				UserActionTask actionTask = new UserActionTask();
				UserLoginAction action = new UserLoginAction( client );
				actionTask.setAction(action);
				//异步执行，放入任務管理器中
				TaskManager.getInstance().addTask( actionTask );
				
				
			//}
			
		}
    }

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public UserInfoManager getUserInfoManager() {
		return userInfoManager;
	}
	public void setUserInfoManager(UserInfoManager userInfoManager) {
		this.userInfoManager = userInfoManager;
	}


}