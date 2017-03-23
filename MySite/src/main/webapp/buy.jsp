<%@page import="java.util.ArrayList"%>
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
</head>
<body>
		<%!
			List<HashMap<String,Object>> list;
		%>
		<%
			int index = Integer.parseInt(request.getParameter("list_send_no"))-1;
			list = new ArrayList<HashMap<String,Object>>();
			list = (List<HashMap<String,Object>>)session.getAttribute("list");
			System.out.println(list);
			System.out.println(list.get(index).get("img"));
		%>
	        <div class="wrap">
            
            <div class="logo">
                <h1>Logo</h1>
                <input type="text">
                <button>Search</button>
            </div>
              
            <div class="center">
                <div class="center_top">
                    <div class="img_section">
                        <img src="<%=list.get(index).get("img")%>">
                    </div>
                    <div class="info_section">
                        <h1><%=list.get(index).get("title")%></h1>
                        <p> ��Ƽ��Ʈ : <%=list.get(index).get("artist")%></p>
                        <p> �߸��� : <%=list.get(index).get("ldate")%></p>
                        <p> ���� : <%=list.get(index).get("price")%>��</p>
<!--                         <p> ���� : ��</p> -->
                      
                    </div>
                </div>
                
                <div class="center_bottom">
                    <h2 style="margin:5%;">�ֹ� ����</h2>
                    <p>�̸� : <input type="text" name="nm" id="nm"><br><br>
                       �ּ� : <input type="text" name="addr" id="addr" size="80px"><br><br>
                        �̸��� : <input type="text" name="mail" id="mail" size="40px"><br><br>
                        ��ȭ��ȣ : <input type="text" name="tel" id="tel" size="40px"><br><br>
                    </p>
                    <h2 style="margin:5%;">���� ����</h2>
                    <p>�� ���� �ݾ� :  <input type="text" class="buy_input" name="cash" id="cash" size="30px" readonly> ��<button id="charge">�����ϱ�</button>
                    </p>
                </div>
            </div>
        </div>
        
        <%System.out.println(request.getParameter("list_send_no")); %>
</body>
</html>