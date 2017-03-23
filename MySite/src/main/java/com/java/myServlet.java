package com.java;

import java.io.IOException;
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
		String id = request.getParameter("sendId");
		String pw = request.getParameter("sendPw");
		
		String url = "";
		Dao dao = new Dao();
		
		list = dao.login(request.getParameter("sendId"),request.getParameter("sendPw"));
		
		for(int i = 0; i<list.size(); i++){
			if(id.equals(list.get(i).get("id").toString()) && pw.equals(list.get(i).get("pw".toString()))){
				session.setAttribute("memNo", Integer.parseInt(list.get(i).get("no").toString()));
				url = "/MySite/list.jsp";
				break;
			}else
			{	
				int flag = 0;
				url = "/MySite/index.jsp?flag="+flag;
			}
		}
		response.sendRedirect(url);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
