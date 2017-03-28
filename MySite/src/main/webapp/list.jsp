<%@page import="java.util.ArrayList"%>
<%@page import="com.java.Dao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.wrap{
            position: relative;
            max-width: 1000px;
            height: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        .logo{
            position: absolute;
            color:dodgerblue;
            top:20px;
            width: 600px;
            height: 100px;
            left:200px;
        }
        .logo h1{
            width: 120px;
            font-size:50px;
            float: left;
            cursor: pointer;
        }
        .logo input{
            position: absolute;
            bottom:0;
            left:130px;
            height: 50px;
            width: 300px;
            border: dodgerblue 3px solid;
            font-size: 20px;
            padding-left:5px; 
        }
        .logo button{
            float: left;
            position: absolute;
            bottom: 0;
            left: 450px;
            height: 58px;
            width: 100px;
            background-color: dodgerblue;
            font-size: 20px;
            color:white;
            border: dodgerblue 3px solid;
            cursor: pointer;
        }
            
        .center{
            position: relative;
            top:230px;
            width: 800px;
            height: 800px;
            margin-left:auto;
            margin-right: auto;
            margin-bottom: 100px;
        }
        .center_top{
            width: 100%;
            height: 40%;
        }
        .center_bottom{
            width: 100%;
            height: 60%;
        }
        .img_section{
            width: 50%;
            height: 100%;
            float: left;
        }
        .info_section{
            width: 50%;
            height: 92%;
            float: left;
        }
        .img_section img{
            width: 80%;
            margin:0 10%;
        }
       
        .info_section button{
            background-color: dodgerblue;
            border:0;
            width: 40%;
            height: 15%;
            font-size: 20px;
            color: white;
        } 
         .center_box{
            width: 800px;
            height: 160px;
        }
        .check{
            width: 10%;
            height: 100%;
            text-align: center;
            float: left;
        }
        .checkbox{
            margin-top: 70px;
            cursor: pointer;
        }
        .num{
            left:10%;
            width: 10%;
            height: 100%;
            text-align: center;
            float: left;
        }
        .num p{
            margin: 63px 0 0 0;
        }
        .album_img{
            left:10%;
            width: 20%;
            height: 100%;
            text-align: center;
            float: left;
        }
        .album_img img{
            width: 50%;
            height: 50%;
            display: block;
            margin-top: 40px;
            margin-left: auto;
            margin-right: auto;
            cursor: pointer;
        }
        .info{
            width: 40%;
            left:10%;
            height: 100%;
            float: left;
        }
        .buy{
            width: 20%;
            left:10%;
            height: 100%;
            float: left;
        }
        .buy button{
            background-color: white;
            margin: 39% 2% 0 3%;
            border:1px solid;
            width: 42%;
            height: 20%;
            font-size: 13px;
            color: dodgerblue;
            cursor: pointer;
        }
        .option button{
	        background-color: white;
	        border:1px solid;
	        width: 32%;
	        height: 20%;
	        font-size: 13px;
	        color: dodgerblue;
	        cursor: pointer;
	     }
	     .option{
	         margin: 0 10%;
	     }
</style>
<script type="text/javascript">
	function buy(no) {
		document.getElementById("list_send_no").value = no;
		document.getElementById("go_buy_index").value = 1;
		document.getElementById("form").submit();
	}
	
	function search(){
		document.getElementById("sendSearch").value = document.getElementById("searchText").value;
		document.getElementById("searchForm").submit();
	}
	
	function goDetail(no,itemNo){
		document.getElementById("list_detail_no").value = no;
		document.getElementById("list_item_no").value = itemNo;
		document.getElementById("detailForm").submit();
	}
	function insertCart(memNo, itemNo){
		document.getElementById("cartMemNo").value = memNo;
		document.getElementById("cartItemNo").value = itemNo;
		document.getElementById("cartCount").value = 1;
		document.getElementById("cartForm").submit();
	}
	function goCart(memberNo){
		document.getElementById("send_cart_memNo").value = memberNo;
		document.getElementById("send_cart_form").submit();
	}
	function goList(){
		location.href = "/MySite/list.jsp";
	}
	function logout(i){
		location.href = "/MySite/myServlet?logout="+i;
	}
	function goOrder(memNo){
		document.getElementById("send_order_memNo").value = memNo;
		document.getElementById("send_order_form").submit();
	}
</script>
</head>
<body>
	<div class="wrap">
            
            <div class="logo">
                <h1 onclick="goList();">Logo</h1>
                <button onclick="search();">Search</button>
                <form action="/MySite/myServlet" id="searchForm">
                	<input type="text" id="searchText">
                	
                	<input type="hidden" id="sendSearch" name="sendSearch">
            	</form>
            </div>
            <div class="option">
                <button onclick="goCart('<%=session.getAttribute("memNo")%>');">장바구니</button>
                <button onclick="goOrder('<%=session.getAttribute("memNo")%>');">주문내역</button>
                <button onclick="logout(1);">로그아웃</button>
                <form action="/MySite/myServlet" id="send_cart_form">
                	<input type="hidden" id="send_cart_memNo" name="send_cart_memNo">
                </form>
                <form action="/MySite/myServlet" id="send_order_form">
                	<input type="hidden" id="send_order_memNo" name="send_order_memNo">
                </form>
            </div>
            <%!
            	List<HashMap<String,Object>> list;
            	Dao dao;
            %>
           <div class="center">
            <%
            	dao = new Dao();
            	list = new ArrayList<HashMap<String,Object>>();
//     			int itemNo = Integer.parseInt(request.getParameter("list_item_no"));
            	if(session.getAttribute("searchList") != null){
            		list = (List<HashMap<String,Object>>)session.getAttribute("searchList");
            	}else{
            		list = dao.selectList();
            	}
            	
            
            	for(int i = 0;i<list.size(); i++){
            		%>
						<div class="center_box">
		                    <div class="check">
		                        <input type="checkbox" class="checkbox">
		                    </div>
		                    <div class="num">
		                        <p><%=i+1 %></p>
		                    </div>
		                    <div class="album_img">
		                        <img src="<%=list.get(i).get("img") %>" onclick="goDetail('<%=i%>','<%=list.get(i).get("no")%>');">
		                    	<form action="/MySite/detail.jsp" methoed="post" id="detailForm">
		                        	<input type="hidden" id="list_detail_no" name="list_detail_no">
		                        	<input type="hidden" id="list_item_no" name="list_item_no">
		                        </form>
		                    </div>
		                    <div class="info">
		                        <p style="margin-top:50px"><%=list.get(i).get("title") %></p> 
		                        <p><%=list.get(i).get("artist") %> / <%=list.get(i).get("price") %>원</p>
		                    </div>
		                    <div class="buy">
		                        <button onclick="buy('<%=list.get(i).get("no")%>');">구매</button>
		                        <button onclick="insertCart('<%=session.getAttribute("memNo")%>','<%=list.get(i).get("no")%>');">장바구니</button>
		                        
		                        <form action="/MySite/buy.jsp" methoed="post" id="form">
		                        	<input type="hidden" id="list_send_no" name="list_send_no">
		                        	<input type="hidden" id="go_buy_index" name="go_buy_index">
		                        </form>
		                        
		                        <form action="/MySite/myServlet" id="cartForm">
		                        	<input type="hidden" id="cartMemNo" name="cartMemNo">
		                        	<input type="hidden" id="cartItemNo" name="cartItemNo">
		                        	<input type="hidden" id="cartCount" name="cartCount">
		                        	<input type="hidden" name="insert">
		                        </form>
		                </div>            		
            		<%
            	}
            	//System.out.println(session.getAttribute("memNo"));
            	session.setAttribute("list", list);
            %>
            
                
                </div>
            
            </div>
        </div>
</body>
</html>