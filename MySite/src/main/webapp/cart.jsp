<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.java.Dao"%>
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
        	cursor: pointer;
            width: 120px;
            font-size:50px;
            float: left;
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
            width: 30%;
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
	function buy(cartNo,itNo) {
		document.getElementById("send_cartNo").value = cartNo;
		document.getElementById("go_buy_index").value = 2;
		document.getElementById("cart_go_buy_itNo").value = itNo;
		document.getElementById("buyForm").submit();
	}
	function cartDelete(cartNo){
		document.getElementById("delete_cartNo").value = cartNo;
		document.getElementById("deleteForm").submit();
	}
	function goCart(memberNo){
		document.getElementById("send_cart_memNo").value = memberNo;
		document.getElementById("send_cart_form").submit();
	}
	function goList(){
		location.href = "/MySite/list.jsp?key=refresh";
	}
	function logout(i){
		location.href = "/MySite/myServlet?logout="+i;
	}
	function goOrder(memNo){
		document.getElementById("send_order_memNo").value = memNo;
		document.getElementById("send_order_form").submit();
	}
	function goDetail(no,itemNo){
		document.getElementById("list_detail_no").value = no;
		document.getElementById("list_item_no").value = itemNo;
		document.getElementById("detailForm").submit();
	}
	function search(){
		document.getElementById("sendSearch").value = document.getElementById("searchText").value;
		document.getElementById("searchForm").submit();
	}
</script>
</head>

<body>
<div class="wrap">
            
            <div class="logo">
                <h1 onclick="goList();">Logo</h1>
                <input type="text">
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
            	//if(request.getParameter("key").toString().equals("refresh")){
            		list = dao.selectCart(Integer.parseInt(session.getAttribute("memNo").toString()));
            	//}else{
            	//	list = (List<HashMap<String,Object>>)session.getAttribute("selectCart");	
            	//}
            	
            	
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
                        <p style="margin-top:50px"><%=list.get(i).get("artist") %>, <%=list.get(i).get("title") %></p>  
                        <p><%=list.get(i).get("price") %>원 / <%=list.get(i).get("count") %>개 / <%=list.get(i).get("totalPrice")%>원</p>
                    </div>
                    <div class="buy">
                        <button onclick="buy('<%=i%>','<%=list.get(i).get("itemNo")%>')">구매</button>
                        <button onclick="cartDelete('<%=list.get(i).get("cartNo")%>');">삭제</button>
                        <form action="/MySite/buy.jsp" methoed="get" id="buyForm">
                        	<input type="hidden" id="send_cartNo" name="send_cartNo">
                        	<input type="hidden" id="go_buy_index" name="go_buy_index">
                        	<input type="hidden" id="cart_go_buy_itNo" name="cart_go_buy_itNo">
                        </form>
                        <form action="/MySite/myServlet" id="deleteForm">
                        	<input type="hidden" id="delete_cartNo" name = "delete_cartNo">
                        </form>
                    </div>
                </div>
                <%
                }
               %>
            </div>
    </div>
   
</body>
</html>