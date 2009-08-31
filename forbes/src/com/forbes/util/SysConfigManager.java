package com.forbes.util;

import java.util.Map;
import java.util.TreeMap;
import java.util.List;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.forbes.hibernate.bean.SysConfig;
import com.forbes.hibernate.dao.SysConfigDAO;

public class SysConfigManager {
	
	public static ApplicationContext ctx = null;
	public static Map scMap = new TreeMap();
	public static Map gMap  = new TreeMap();

	static {
		init();
	}

	public static void init(){
		try {

			ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
			SysConfigDAO sysConfigDAO = (SysConfigDAO )ctx.getBean("SysConfigDAO");

			List scList = sysConfigDAO.findAll();

			for( Object obj : scList ){
				SysConfig scObj = ( SysConfig )obj;

				/*Map groupMap = (TreeMap)gMap.get( scObj.getGroup() );

				if( groupMap == null ){
					groupMap = new TreeMap();
				}

				groupMap.put(scObj.getKey(), obj );
				gMap.put(scObj.getGroup(), groupMap );

				Map valMap = (TreeMap)scMap.get("" + scObj.getKey() );

				if( valMap == null ){
					valMap = new TreeMap();
				}*/
				scMap.put(scObj.getVarname(), obj );
			}
		}catch( Exception e){
			e.printStackTrace();
		}
	}
	
	public void reset(){
		scMap.clear();
		gMap.clear();
		init();
	}
	
	public static Object getValue ( String key ){
		SysConfig config = (SysConfig)scMap.get(key);
		if (config!=null) {
			if(config.getType().equals("boolean")) {
				return new Boolean(config.getValue());
			} 
			else if(config.getType().equals("integer")) {
				return new Integer(config.getValue());
			} else {
				return config.getValue();
			}			
		} else {
			return null;
		}
	}
	
	
	
	public static void main( String args [] ){
		
		System.out.println( (String)SysConfigManager.getValue("cfg_uc_center_url") );
		
	}

}
