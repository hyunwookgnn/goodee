<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	//int flag = Integer.parseInt(request.getParameter("flag"));
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
        html, body{
            margin: 0;
            padding: 0;
        }
        .wrap{
            position: relative;
            width: 800px;
            height: 800px;
            top:100px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .wrap h1{
            padding-top: 10px;
            padding-bottom: 100px;
            color : dodgerblue;
        }
        .login{
            width: 400px;
            height: 400px;
            margin-left:200px;
            
        }
        .login input{
            width: 300px;
            height: 50px;
            margin-bottom: 10px;
            border: dodgerblue 3px solid;
        }
        .btn_grp{
            width: 300px;
            margin-left: 50px;
            margin-top: 20px;
            height: 70px;
        }
        .btn_grp button{
            height: 100%;
            width: 49%;
            background-color: dodgerblue;
            border: 0;
            font-size: 20px;
            color: white;
            cursor: pointer;
        }
        .login p{
            cursor: pointer;
            color : dodgerblue;
        }
    </style>
    
    <script>
    	function login(){
    		document.getElementById("sendId").value = document.getElementById("id").value;
    		document.getElementById("sendPw").value = document.getElementById("pw").value;
    		document.getElementById("loginForm").submit();
    	}
    	
    	function goMembership(){
    		location.href="/MySite/membership.jsp";
    	}
    	
//     	function onload(){
<%--     		if(<%=flag%> == 0){ --%>
//     			alert("아이디 비밀번호가 잘못되었습니다!!")
//     		}
//     	}
    </script>
</head>
<body>
        <div class="wrap">
            <h1>Title</h1>
            
            <div class="login">
            <form action="/MySite/myServlet" method="post" id="loginForm">
                <input type="text" placeholder="아이디를 입력하세요" id="id">
                <input type="password" placeholder="비밀번호를 입력하세요" id="pw">
                <input type="hidden" id="sendId" name="sendId">
                <input type="hidden" id="sendPw" name="sendPw">
            </form>
            <div class="btn_grp">
                    <button onclick="goMembership();">회원가입</button>
                    <button onclick="login();">로그인</button>
          
        
        </div>
    </body>
</html>