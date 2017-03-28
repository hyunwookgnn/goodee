<%@page import="java.util.ArrayList"%>
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
            width: 0%;
            height: 15%;
            font-size: 20px;
            color: white;
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
	     .center_bottom p{
            margin: 5%;
        }
        #charge{
            margin:2% 0 2% 35%;
            background-color: dodgerblue;
            border:0;
            width: 10%;
            height: 22px;
            cursor: pointer;
            color: white;
        }
        input .buy_input{
            border: 1px solid;
           
        }
</style>
<script type="text/javascript">
function search(){
	document.getElementById("sendSearch").value = document.getElementById("searchText").value;
	document.getElementById("searchForm").submit();
}
function goCart(memberNo){
	document.getElementById("send_cart_memNo").value = memberNo;
	document.getElementById("send_cart_form").submit();
}
function goList(){
	location.href = "/MySite/list.jsp";
}
function insertBuy(memNo,itNo){
	document.getElementById("order_name").value = document.getElementById("nm").value;
	document.getElementById("order_addr").value = document.getElementById("addr").value;
	document.getElementById("order_tel").value = document.getElementById("tel").value;
	document.getElementById("order_totalPrice").value = document.getElementById("totalPrice").value;
	document.getElementById("order_memNo").value = memNo;
	document.getElementById("order_itNo").value = itNo;
	document.getElementById("order_index").value = 1;
	document.getElementById("orderForm").submit();
}
function logout(i){
	location.href = "/MySite/myServlet?logout="+i;
}
function search(){
	document.getElementById("sendSearch").value = document.getElementById("searchText").value;
	document.getElementById("searchForm").submit();
}
function goOrder(memNo){
	document.getElementById("send_order_memNo").value = memNo;
	document.getElementById("send_order_form").submit();
}
</script>
</head>
<body>
		<%!
			List<HashMap<String,Object>> list;
			int cnt = 0;
			int totalPrice = 0;
			int index ;
			int itNo = 0;
		%>
		<%
			list = new ArrayList<HashMap<String,Object>>();
			int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
			if(Integer.parseInt(request.getParameter("go_buy_index")) == 1){
				cnt = 1;
				index = Integer.parseInt(request.getParameter("list_send_no"))+1;
				itNo = Integer.parseInt(request.getParameter("list_send_no"));
				list = (List<HashMap<String,Object>>)session.getAttribute("list");
				totalPrice = Integer.parseInt(list.get(index).get("price").toString());
			}else if(Integer.parseInt(request.getParameter("go_buy_index")) == 2){
				list = (List<HashMap<String,Object>>)session.getAttribute("selectCart");
				itNo = Integer.parseInt(request.getParameter("cart_go_buy_itNo"));
				index = Integer.parseInt(request.getParameter("send_cartNo"));
				cnt = Integer.parseInt(list.get(index).get("count").toString());
				totalPrice = cnt * Integer.parseInt(list.get(index).get("price").toString());
			}else if(Integer.parseInt(request.getParameter("go_buy_index")) == 3){
				index = Integer.parseInt(request.getParameter("list_send_no"));
				itNo = Integer.parseInt(request.getParameter("go_buy_itNo"));
				list = (List<HashMap<String,Object>>)session.getAttribute("list");
				cnt = Integer.parseInt(request.getParameter("go_buy_count"));
				totalPrice = cnt * Integer.parseInt(list.get(index).get("price").toString());
			}
		%>
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
           
              
            <div class="center">
                <div class="center_top">
                    <div class="img_section">
                        <img src="<%=list.get(index).get("img")%>">
                    </div>
                    <div class="info_section">
                        <h1><%=list.get(index).get("title")%></h1>
                        <p> 아티스트 : <%=list.get(index).get("artist")%></p>
<%--                         <p> 발매일 : <%=list.get(index).get("ldate")%></p> --%>
                        <p> 가격 : <%=list.get(index).get("price")%>원</p>
                        <p> 수량 : <%=cnt%> 개</p>
                      
                    </div>
                </div>
                
                <div class="center_bottom">
                    <h2 style="margin:5%;">주문 정보</h2>
                    <p>받는사람 : <input type="text" name="nm" id="nm"><br><br>
                       주소 : <input type="text" name="addr" id="addr" size="80px"><br><br>
<!--                         이메일 : <input type="text" name="mail" id="mail" size="40px"><br><br> -->
                        전화번호 : <input type="text" name="tel" id="tel" size="40px"><br><br>
                    </p>
                    <h2 style="margin:5%;">결제 내용</h2>
                    <p>총 결제 금액 :  <input type="text" id="totalPrice" class="buy_input" name="cash" id="cash" value="<%=totalPrice %>" size="30px" readonly> 원<button id="charge" onclick="insertBuy('<%=memNo%>','<%=itNo%>');">결제하기</button>
                    </p>
                    <form action="/MySite/myServlet" id="orderForm">
                    	<input type="hidden" id="order_name" name="order_name">
                    	<input type="hidden" id="order_addr" name="order_addr">
                    	<input type="hidden" id="order_tel" name="order_tel">
                    	<input type="hidden" id="order_totalPrice" name="order_totalPrice">
                    	<input type="hidden" id="order_index" name="order_index">
                    	<input type="hidden" id="order_memNo" name="order_memNo">
                    	<input type="hidden" id="order_itNo" name="order_itNo">
                    </form>
                </div>
            </div>
        </div>
     
</body>
</html>