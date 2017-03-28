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
		request.setCharacterEncoding("UTF-8");
		
		String url = "";
		Dao dao = new Dao();
		
		if(request.getParameter("sendId") != null && request.getParameter("sendPw")!=null ){
			
			
			list = dao.login(request.getParameter("sendId"),request.getParameter("sendPw"));
			
			for(int i = 0; i<list.size(); i++){
				if(id.equals(list.get(i).get("id").toString()) && pw.equals(list.get(i).get("pw".toString()))){
					session.setAttribute("memNo", Integer.parseInt(list.get(i).get("no").toString()));
					if(id.equals("root") && pw.equals("1")){
						url = "/MySite/root.jsp";
					}else{
						url = "/MySite/list.jsp";
					}
					
					break;
				}else
				{
					url = "/MySite/index.jsp?flag=discord";
					//url = "/MySite/index.jsp";
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
			url = "/MySite/cart.jsp?key=refresh";
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
		}else if(request.getParameter("checkId") != null){
			list = dao.idCheck();
			String str = request.getParameter("checkId").toString();
			//System.out.println(str);
			for(int i = 0; i<list.size(); i++){
				if(request.getParameter("checkId").toString().equals(list.get(i).get("id").toString())){
					url = "/MySite/membership.jsp?key=id";
					break;
				}else
				{	
					url = "/MySite/membership.jsp?key=ok";
				}
			}
		}else if(request.getParameter("order_index") != null){
			
			map.put("name",request.getParameter("order_name"));
			map.put("memNo",request.getParameter("order_memNo"));
			map.put("itNo",request.getParameter("order_itNo"));
			map.put("addr",request.getParameter("order_addr"));
			map.put("tel",request.getParameter("order_tel"));
			map.put("totalPrice",request.getParameter("order_totalPrice"));
			
			dao.insertOrder(map);
			url = "/MySite/finish.jsp";
			map.clear();
			
		}else if(request.getParameter("item_insert_index") != null){
			map.put("title",request.getParameter("hidden_insertTitle"));
			map.put("content",request.getParameter("hidden_insertContent"));
			map.put("ldate",request.getParameter("hidden_insertLdate"));
			map.put("artist",request.getParameter("hidden_insertArtist"));
			map.put("price",request.getParameter("hidden_insertPrice"));
			map.put("url",request.getParameter("hidden_insertUrl"));
			
			int ItemNo = dao.setItemNo();
			map.put("ItemNo",ItemNo);
			System.out.println(map);
			dao.insertItem(map);
			dao.insertImage(map);
			url = "/MySite/root.jsp";
			map.clear();
		}else if(request.getParameter("logout")!= null){
			session.invalidate();
			url = "/MySite/index.jsp";
		}else if(request.getParameter("send_order_memNo") != null){
			list = dao.selectOrder(Integer.parseInt(request.getParameter("send_order_memNo").toString()));
			session.setAttribute("selectOrder", list);
			url = "/MySite/order.jsp";
		}
		
		response.sendRedirect(url);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}
}