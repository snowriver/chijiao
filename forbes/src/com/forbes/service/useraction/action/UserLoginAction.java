package com.forbes.service.useraction.action;

import java.util.Date;
import java.text.SimpleDateFormat;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserActionLog;
import com.forbes.hibernate.bean.UserActionType;
import com.forbes.service.useraction.AbstractAction;

public class UserLoginAction extends AbstractAction{
	
	private UcMembers user ;
	//private int ACTIVE_MARK=1;
	public UserLoginAction(UcMembers user){
		this.user = user;
	}
	public void process(){
		SimpleDateFormat sf = new SimpleDateFormat();
		sf.applyPattern("yyyy-MM-dd HH:mm:ss");
		UserActionType usrActionType = this.getUserActionType("1");
		
		String data = ""+ sf.format(new Date());
		
		UserActionLog actionLog = new UserActionLog();
		actionLog.setUserId( user.getUid() );
		actionLog.setUserActionType( usrActionType );
		actionLog.setActionData( data );
		actionLog.setDescs("用户登录");
		actionLog.setInsertDate( new Date() );
		this.saveUserActionLog( actionLog );
		//analysis();
		
	}
	/*public void analysis(){

        //用戶分數
		AnalysisUsrMark mark = new AnalysisUsrMark();
		mark.setUsrId( user.getId() );
		mark.setDayDiff((short)0);
		mark.setActiveMark(ACTIVE_MARK);
		this.saveUsrMark(mark);
	}*/
}
