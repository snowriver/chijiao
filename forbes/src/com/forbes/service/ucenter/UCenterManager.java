package com.forbes.service.ucenter;
import java.net.URLEncoder;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.util.HttpInvoke;
import com.forbes.util.SysConfigManager;

public class UCenterManager{
	
	private String appId = (String)SysConfigManager.getValue("cfg_uc_app_id");
	private String ucUrl = (String)SysConfigManager.getValue("cfg_uc_center_url");
	private String ucIp = (String)SysConfigManager.getValue("cfg_uc_ip");
	private String key = (String)SysConfigManager.getValue("cfg_uc_key");
	private boolean syn = (Boolean)SysConfigManager.getValue("cfg_uc_syn_log");
	
	private HttpInvoke httpInvoke = new HttpInvoke();
	
	public void login(String loginName, String password){
		if( !syn ){
			return;
		}
		String data = "username=" + loginName + "&password=" + password+"&isuid=0";
		String url = ucUrl + "?" +"m=user&a=login&inajax=2&input=" 
		             + URLEncoder.encode(AuthCode.authcodeEncode(data, key)) + "&appid="+appId;
        try{
        	//System.out.println("login data = " + data );
        	//System.out.println("login url  = " + url );
		    String rs = httpInvoke.getURL(url, "POST");
		   // System.out.println(rs);
        }catch( Exception e ){
        	e.printStackTrace();
        }
	}
	public String synlogin(String uid){
		if( !syn ){
			return "";
		}
		String data = "uid=" + uid;
		String url = ucUrl + "?" +"m=user&a=synlogin&inajax=2&input=" 
		             + URLEncoder.encode(AuthCode.authcodeEncode(data, key)) + "&appid="+appId;
        try{
        	System.out.println("synlogin data = " + data );
        	System.out.println("synlogin url  = " + url );
		    String rs = httpInvoke.getURL(url, "POST");
		    System.out.println(rs);
		    return rs;
        }catch( Exception e ){
        	e.printStackTrace();
        	return "";
        }
	}
	public void register( UcMembers  client, String password ){
		if( !syn ){
			return;
		}
		String data = "uid=" + client.getUid() + "&username=" + client.getUsername() + "&password=" 
		             + password +"&email=" + client.getEmail() ;
		String url = ucUrl + "?" +"m=user&a=register&inajax=2&input=" 
		             + URLEncoder.encode(AuthCode.authcodeEncode(data, key)) + "&appid="+appId;
        try{
        	System.out.println("register data = " + data );
        	System.out.println("register url  = " + url );
		    String rs = httpInvoke.getURL(url, "POST");
		    System.out.println(rs);
        }catch( Exception e ){
        	e.printStackTrace();
        }
	}
	public String synLogout( UcMembers client ){
		if( !syn ){
			return null;
		}
		String data= "uid=" + client.getUid(); 
		String url = ucUrl + "?" + "m=user&a=synlogout&inajax=2&input="
				+ URLEncoder.encode(AuthCode.authcodeEncode(data, key))
				+ "&appid=" + appId;
		try {
			System.out.println("synLogout data = " + data );
			System.out.println("synLogout url  = " + url );
			String rs = httpInvoke.getURL(url, "POST");
			System.out.println(rs);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void delUser( UcMembers client ){
		if( !syn ){
			return;
		}
		
	}
	public void editUser( UcMembers client ){
		if( !syn ){
			return;
		}
		String data = "username=" + client.getUsername() + "&oldpw=&newpw"
				+ client.getPassword() + "&email=" + client.getEmail()+ "&ignoreoldpw=1";
		String url = ucUrl + "?" + "m=user&a=edit&inajax=2&input="
				+ URLEncoder.encode(AuthCode.authcodeEncode(data, key))
				+ "&appid=" + appId;
		try {
			System.out.println("editUser data = " + data );
			System.out.println("editUser url  = " + url );
			String rs = httpInvoke.getURL(url, "POST");
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getUcIp() {
		return ucIp;
	}
	public void setUcIp(String ucIp) {
		this.ucIp = ucIp;
	}

	public String getUcUrl() {
		return ucUrl;
	}
	public void setUcUrl(String ucUrl) {
		this.ucUrl = ucUrl;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	//public static void main( String args [] ){
		//UCenterManager um = new UCenterManager();
		/*User client = new User();
		client.setId(new Integer(11));
		client.setLoginName("admin");
		client.setPassword("admin");
		client.setEmail("webmastor@yourdomain.com");*/
		//um.synlogin("1");
		//um.login(client.getLoginName(),client.getPassword());
		//um.login("admin", "admin");
		
		//um.synlogin("1");
	//}
}
