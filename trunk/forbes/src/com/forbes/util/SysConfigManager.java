package com.forbes.util;

import java.util.Map;
import java.util.TreeMap;
import java.util.Collection;
import java.util.List;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.forbes.hibernate.bean.SysConfig;
import com.forbes.hibernate.dao.SysConfigDAO;

public class SysConfigManager {
	
	public static ApplicationContext ctx = null;
	//public static SysConfigManager scm = new SysConfigManager();
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

				Map groupMap = (TreeMap)gMap.get( scObj.getGroup() );

				if( groupMap == null ){
					groupMap = new TreeMap();
				}

				groupMap.put(scObj.getKey(), obj );
				gMap.put(scObj.getGroup(), groupMap );

				Map valMap = (TreeMap)scMap.get("" + scObj.getKey() );

				if( valMap == null ){
					valMap = new TreeMap();
				}
				scMap.put(scObj.getKey(), obj );
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
	
	public SysConfig getValue( String group, String key){
		Map groupMap = (Map)gMap.get( group );
		return ( SysConfig )groupMap.get( key );
	}
	
	public SysConfig getValue( String key) {
		return ( SysConfig )scMap.get( key );
	}
	
	public String getId( String group, String key) {
		Map groupMap = (Map)gMap.get( group );
		return (( SysConfig )groupMap.get( key )).getId().toString();
	}
	
	public String getId( String key ) {
		return (( SysConfig )scMap.get( key )).getId().toString();
	}
	
	public TreeMap getGroup( String group ) {
		return ( TreeMap )gMap.get( group );
	}
	
	/*public static SysConfigManager getInstance(){
		return scm;
	}*/
	
	public static void main( String args [] ){
		/*SysConfig sc = (SysConfig)SysConfigManager.scMap.get("cfg_adminemail");
		System.out.println( SysConfigManager.scMap.get("cfg_adminemail"));
		
		Map gm = (TreeMap)SysConfigManager.gMap.get(1);
		System.out.println( gm.size() );*/
		//System.out.println( SysConfigManager.scMap.get("cfg_adminemail"));
		//System.out.println(((SysConfig)SysConfigManager.getInstance().getVal("cfg_adminemail")).getValue());
	}

}
