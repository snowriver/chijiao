package com.forbes.util;


import java.util.Map;
import java.util.Iterator;
import java.util.TreeMap;
import java.util.Collection;
import java.util.List;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.forbes.hibernate.bean.Dictionary;
import com.forbes.hibernate.dao.DictionaryDAO;

public class DictionaryManager {
	private static DictionaryManager dm = new DictionaryManager();
	private Map dicMap = new TreeMap();
	private Map dicValMap = new TreeMap();
	private DictionaryManager(){
		init();
	}
	public void init(){
		try{
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
		DictionaryDAO dictionaryDAO = (DictionaryDAO )ctx.getBean("DictionaryDAO");
		List dicList = dictionaryDAO.findAll();
	
		for( Object obj : dicList ){
			Dictionary dicObj = ( Dictionary )obj;
			Map gMap = (TreeMap)dicMap.get("" + dicObj.getDgroup() );
			
			if( gMap == null ){
				gMap = new TreeMap();
				dicMap.put(dicObj.getDgroup(), gMap );
			}
			gMap.put(dicObj.getDkey(), obj );
			
            Map valMap = (TreeMap)dicValMap.get("" + dicObj.getDgroup() );
			
			if( valMap == null ){
				valMap = new TreeMap();
				dicValMap.put(dicObj.getDgroup(), valMap );
			}
			valMap.put(dicObj.getDvalue(), obj );
			
		}
		}catch( Exception e){
			e.printStackTrace();
		}
	}
	public  void reset(){
		dicMap.clear();
		init();
		
	}
	public  Map  getGoupByVal( String group ){
		return (Map)dicValMap.get( group );

		
	}
	public Collection getValList( String group ){
		Map gMap = (Map)dicMap.get( group );
		return gMap.values();
	}
	public Dictionary getVal( String group, String key){
		Map gMap = (Map)dicMap.get( group );
		return ( Dictionary )gMap.get( key );
	}
	public Dictionary getKey( String group, String val){
		Map gMap = (Map)dicMap.get( group );
		Iterator it = gMap.keySet().iterator();
		while( it.hasNext() ){
			Dictionary dict = (Dictionary)gMap.get(it.next());
			if( dict.getDvalue().toString().equals( val )){
				return dict;
			}
		}
		return null;
	}
	public String getId( String group, String key){
		Map gMap = (Map)dicMap.get( group );
		return (( Dictionary )gMap.get( key )).getId().toString();
	}
	public static DictionaryManager getInstance(){
		return dm;
	}
	public static void main( String args [] ){
		
	}
	public Map getDicValMap() {
		return dicValMap;
	}
	public void setDicValMap(Map dicValMap) {
		this.dicValMap = dicValMap;
	}
}
