package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class Dao {
	
	public SqlSessionFactory ssf = (SqlSessionFactory) com.java.SqlSessionFactory.getSession(); 
	
	public Dao(){}
	
	public List<HashMap<String,Object>> selectList(){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.selectList");
         } finally {
            session.close();
         }
		return list;
	}
	
	public List<HashMap<String,Object>> login(String id, String pw){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.selectInfo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
