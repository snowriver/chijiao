/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.client;


import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.Favorite;
import com.forbes.hibernate.bean.FavoriteType;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.service.favorite.FavoriteManager;
import com.forbes.util.Pager;


/** 
 * MyEclipse Struts
 * Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * @struts.action path="/client/ClientLogin" name="clientLoginForm" attribute="ClientLoginForm" input="/client/ClientLogin.jsp" scope="request" validate="true"
 * @struts.action-forward name="success" path="/client/ClientLoginOk.jsp"
 * @struts.action-forward name="fail" path="/client/ClientLoginFail.jsp"
 */
public class ClientManageVideoFavoriteAction extends DispatchAction {
	/*#com.she.web.form.client.ClientLoginForm Dependency20*/
/*
	 * Generated Methods
	 */
	
	private  FavoriteManager favoriteManager;
	
	
	/** 
	 * 客户登錄
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String id  = request.getParameter("id");
		
		User user  = (User)request.getSession().getAttribute("CLIENT");
		
		try{
			FavoriteType favoriteType = favoriteManager.getFavoriteType(new Short("3"));
			
			if(favoriteManager.checkFavorite(favoriteType, id)) {
				Favorite favorite = new Favorite();
				favorite.setFavoriteType(favoriteType);
				favorite.setUserId(user.getId());
				favorite.setObjectId(Integer.parseInt(id));
				
				favoriteManager.addFavorite(favorite);
				request.setAttribute("RESULT_MESSAGE", "添加成功！");
			}
			else {
				request.setAttribute("RESULT_MESSAGE", "您收藏的视频已经存在！");
			}
			

			return mapping.findForward("add");
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UcMembers user = (UcMembers)request.getSession().getAttribute("CLIENT");
		
		String pageNo    = request.getParameter( "pno" );
		String keyword   = request.getParameter( "keyword" );
		Short favType    = 3;
		
		//System.out.println("----------favType:" + favType);
		
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		
		int iPageNo = 1;
		try{
			iPageNo = Integer.parseInt( pageNo );
		}catch( Exception e){
			
		}
		
		try{
			Pager pager = new Pager();
			pager.setCntOfPage( 10 );
			pager.setCurPage( iPageNo );
			List favs = favoriteManager.getFavoriteByPage(pager, iPageNo, user.getUid(), favType, keyword);
			
			request.setAttribute( "PARA", map );
			request.setAttribute("VIDEO_FAVORITE_LIST", favs );
			request.setAttribute("PAGER", pager );			

			return mapping.findForward("list");
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String id  = request.getParameter("id");
		
		try{
			Favorite favorite = favoriteManager.getFavorite(Integer.parseInt(id));
			
			favoriteManager.deleteFavorite(favorite);
			//request.setAttribute("RESULT_MESSAGE", "删除成功！");

			return mapping.findForward(null);
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public FavoriteManager getFavoriteManager() {
		return favoriteManager;
	}


	public void setFavoriteManager(FavoriteManager favoriteManager) {
		this.favoriteManager = favoriteManager;
	}

	
}