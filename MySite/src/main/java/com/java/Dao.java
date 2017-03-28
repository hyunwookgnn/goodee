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
	
	public List<HashMap<String,Object>> searchList(String searchText){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.searchList",searchText);
         } finally {
            session.close();
         }
		return list;
	}
	
	public List<HashMap<String,Object>> selectCart(int searchNum){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.selectCart",searchNum);
         } finally {
            session.close();
         }
		return list;
	}
	
	public List<HashMap<String,Object>> selectOrder(int searchNum){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.selectOrder",searchNum);
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
	
	public List<HashMap<String,Object>> idCheck(){
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("test.selectInfo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void insertCart(HashMap<String,Object> map){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.insertCart", map);
		}finally {
            session.close();
         }
	}
	
	public void insertInfo(HashMap<String,Object> map){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.insertInfo", map);
		}finally {
            session.close();
         }
	}
	
	public void insertOrder(HashMap<String,Object> map){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.insertOrder", map);
		}finally {
            session.close();
         }
	}
	
	public int setItemNo(){
		SqlSession session = ssf.openSession(true);
		int ItemNo = 0;		
		try {
			ItemNo = session.selectOne("test.selectItemNo");
		}finally {
            session.close();
         }
		return ItemNo;
	}
	
	public void insertItem(HashMap<String,Object> map){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.insertItem", map);
		}finally {
            session.close();
         }
	}
	
	public void insertImage(HashMap<String,Object> map){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.insertImage", map);
		}finally {
            session.close();
         }
	}
	
	public void deleteCart(int deleteNo){
		SqlSession session = ssf.openSession(true);
					
		try {
			session.insert("test.deleteCart", deleteNo);
		}finally {
            session.close();
         }
	}
}
