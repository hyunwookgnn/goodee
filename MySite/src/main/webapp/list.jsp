<%@page import="java.util.ArrayList"%>
<%@page import="com.java.Dao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
</style>
</head>
<body>
	<div class="wrap">
            
            <div class="logo">
                <h1>Logo</h1>
                <input type="text">
                <button>Search</button>
            </div>
            <%!
            	List<HashMap<String,Object>> list;
            	Dao dao;
            %>
           <div class="center">
            <%
            	dao = new Dao();
            	list = new ArrayList<HashMap<String,Object>>();
            	list = dao.selectList();
            	
            	for(int i = 0;i<list.size(); i++){
            		%>
						<div class="center_box">
		                    <div class="check">
		                        <input type="checkbox" class="checkbox">
		                    </div>
		                    <div class="num">
		                        <p><%=list.get(i).get("no") %></p>
		                    </div>
		                    <div class="album_img">
		                        <img src="<%=list.get(i).get("img") %>">
		                    </div>
		                    <div class="info">
		                        <p style="margin-top:50px"><%=list.get(i).get("title") %></p> 
		                        <p><%=list.get(i).get("artist") %> / <%=list.get(i).get("price") %>원</p>
		                    </div>
		                    <div class="buy">
		                        <button>구매</button>
		                        <button>장바구니</button>
		                </div>            		
            		<%
            	}
            	System.out.println(session.getAttribute("memNo"));
            %>
            
                
                </div>
            
            </div>
        </div>
</body>
</html>