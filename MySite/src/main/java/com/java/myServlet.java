package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Sv")
public class myServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		String id = request.getParameter("sendId");
		String pw = request.getParameter("sendPw");
		String id_check = request.getParameter("id_check");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//String textFlag = "";
		String url = "";
		Dao dao = new Dao();
		
		if(request.getParameter("sendId") != null && request.getParameter("sendPw")!=null ){
			
			
			list = dao.login(request.getParameter("sendId"),request.getParameter("sendPw"));
			
			for(int i = 0; i<list.size(); i++){
				if(id.equals(list.get(i).get("id").toString()) && pw.equals(list.get(i).get("pw".toString()))){
					session.setAttribute("memNo", Integer.parseInt(list.get(i).get("no").toString()));
					url = "/MySite/list.jsp";
					break;
				}else
				{	
					int flag = 0;
					//url = "/MySite/index.jsp?flag="+flag;
					url = "/MySite/index.jsp";
				}
			}
			
		}else if(request.getParameter("sendSearch") != null){
			
			list = dao.searchList(request.getParameter("sendSearch"));
			//textFlag = "searchList";
			session.setAttribute("searchList", list);
			url = "/MySite/list.jsp";
			
		}else if(request.getParameter("insert") != null){
			
			map.put("memNo",request.getParameter("cartMemNo"));
			map.put("itemNo",request.getParameter("cartItemNo"));
			map.put("count",request.getParameter("cartCount"));
			dao.insertCart(map);
			url = "/MySite/list.jsp";
			map.clear();
		}else if(request.getParameter("send_cart_memNo") != null){
			list = dao.selectCart(Integer.parseInt(request.getParameter("send_cart_memNo").toString()));
			session.setAttribute("selectCart", list);
			url = "/MySite/cart.jsp";
		}else if(request.getParameter("insertInfo")!= null){
			
			map.put("name",request.getParameter("submit_name"));
			map.put("id",request.getParameter("submit_id"));
			map.put("pw",request.getParameter("submit_pw"));
			map.put("addr",request.getParameter("submit_addr"));
			map.put("tel",request.getParameter("submit_tel"));
		
			dao.insertInfo(map);
			url = "/MySite/index.jsp";
			map.clear();
		}else if(request.getParameter("delete_cartNo") != null){
			dao.deleteCart(Integer.parseInt(request.getParameter("delete_cartNo")));
			url = "/MySite/cart.jsp";
		}else if(request.getParameter("id_check") != null){
			list = dao.idCheck();
			for(int i = 0; i<list.size(); i++){
				if(id_check.equals(list.get(i).get("id").toString())){
					url = "/MySite/membership.jsp";
					break;
				}else
				{	
					url = "/MySite/membership.jsp";
				}
			}
		}
		
		response.sendRedirect(url);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}
}