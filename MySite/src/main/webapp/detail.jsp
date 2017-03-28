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
<style type="text/css">
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
            cursor: pointer;
        }
        input .detail{
            border: 1px solid;
            border-color: dodgerblue;
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
function search(){
	document.getElementById("sendSearch").value = document.getElementById("searchText").value;
	document.getElementById("searchForm").submit();
}

function insertCart(memNo, itemNo){
	document.getElementById("cartMemNo").value = memNo;
	document.getElementById("cartItemNo").value = itemNo;
	document.getElementById("cartCount").value = document.getElementById("count").value;
	document.getElementById("cartForm").submit();
}
function buy(no,itNo) {
	document.getElementById("list_send_no").value = no;
	document.getElementById("go_buy_index").value = 3;
	document.getElementById("go_buy_count").value = document.getElementById("count").value;
	document.getElementById("go_buy_itNo").value = itNo;
	document.getElementById("form").submit();
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
</script>
</head>
<body>

<%!
			List<HashMap<String,Object>> list;
		%>
		<%
			int index = Integer.parseInt(request.getParameter("list_detail_no"));
			int itemNo = Integer.parseInt(request.getParameter("list_item_no"));
			list = new ArrayList<HashMap<String,Object>>();
			list = (List<HashMap<String,Object>>)session.getAttribute("list");
			
		%>
	 <div class="wrap">
            
            <div class="logo">
                <h1 onclick="goList();">Logo</h1>
                <form action="/MySite/myServlet" id="searchForm">
                	<input type="text" id="searchText">
                	<button onclick="search();">Search</button>
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
                        <p> 발매일 : <%=list.get(index).get("ldate")%></p>
                        <p> 가격 : <%=list.get(index).get("price")%>원</p>
                        <p>수량 : <input type="number" name="count" id="count" class="detail"> </p>
                        <button onclick="insertCart('<%=session.getAttribute("memNo")%>','<%=itemNo%>');">장바구니</button>
                        <button onclick="buy('<%=index%>','<%=itemNo%>');">바로구매</button>
                        <form action="/MySite/buy.jsp" methoed="post" id="form">
                        	<input type="hidden" id="list_send_no" name="list_send_no">
                        	<input type="hidden" id="go_buy_index" name="go_buy_index">
                        	<input type="hidden" id="go_buy_count" name="go_buy_count">
                        	<input type="hidden" id="go_buy_itNo" name="go_buy_itNo">
                        </form>
                        <form action="/MySite/myServlet" id="cartForm">
                        	<input type="hidden" id="cartMemNo" name="cartMemNo">
                        	<input type="hidden" id="cartItemNo" name="cartItemNo">
                        	<input type="hidden" id="cartCount" name="cartCount">
                        	<input type="hidden" name="insert">
                        </form>
                        
                    </div>
                </div>
                <div class="center_bottom">
                    <h1 style="margin:5%;">앨범 소개</h1>
                    <p style="margin:5%;"><%=list.get(index).get("content")%> </p>
                </div>
            </div>
        </div>
</body>
</html>