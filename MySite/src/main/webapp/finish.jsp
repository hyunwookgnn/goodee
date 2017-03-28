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
     h3{
        text-align: center;    
     }
        #comeback{
            margin: 0 45%;
            height: 40px;
            width: 100px;
            background-color: dodgerblue;
            font-size: 20px;
            color:white;
            border: dodgerblue 3px solid;
            cursor: pointer;
        }
</style>
<script type="text/javascript">
	function goList(){
		location.href="/MySite/list.jsp";
	}
	function logout(i){
		location.href = "/MySite/myServlet?logout="+i;
	}
</script>
</head>
<body>
	<div class="wrap">
            
            <div class="logo">
                <h1>Logo</h1>
                <input type="text">
                <button>Search</button>
            </div>
            <div class="option">
                <button>장바구니</button>
                <button>주문내역</button>
                <button onclick="logout(1);">로그아웃</button>
            </div>
            <div class="center">
               <h3> 주문이 완료 되었습니다!!</h3>
                  <button id="comeback" onclick="goList();">돌아가기</button>
                </div>
             
            </div>
</body>
</html>