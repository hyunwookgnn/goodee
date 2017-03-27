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
                    
        .center_bottom p{
            margin: 5%;
        }
        #charge{
            margin:2% 0 2% 35%;
            background-color: dodgerblue;
            border:0;
            width: 15%;
            height: 22px;
            cursor: pointer;
            color: white;
        }
        input .buy_input{
            border: 1px solid;
           
        }
        .center_input{
            position: absolute;
            top : 300px;
            width: 80%;
            left : 10%;
        }
</style>

<script>
	function submit(){
		if(document.getElementById("pw").value == document.getElementById("pw_check").value){
			document.getElementById("submit_name").value = document.getElementById("nm").value;
			document.getElementById("submit_id").value = document.getElementById("id").value;
			document.getElementById("submit_pw").value = document.getElementById("pw").value;
			document.getElementById("submit_addr").value = document.getElementById("addr").value;
			document.getElementById("submit_tel").value = document.getElementById("tel").value;
			document.getElementById("submit_form").submit();
		}else{
			alert("비밀번호가 일치하지 않습니다.")
		}
	}
	function id_check(){
		location.href = "/MySite/myServlet?id_check="+document.getElementById("id");
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
            
            <div class="center_input">
                    <h2 style="margin:5%;">회원 가입</h2>
                    <p>이름     : <input type="text" name="nm" id="nm"><br><br>
                        ID : <input type="text" name="id" id="id"> <button onclict="id_check();">중복확인</button><br><br>
                        PW     : <input type="password" name="pw" id="pw"><br><br>
                        PW check     : <input type="password" name="pw_check" id="pw_check"><br><br>
                        주소     : <input type="text" name="addr" id="addr" size="80px"><br><br>
                       
                       전화번호 : <input type="text" name="tel" id="tel" size="40px"><br><br>
                        <button id="submit" onclick="submit();">가입 완료</button>
                    </p>
                    <form action="/MySite/myServlet" method="post" id="submit_form">
                    	<input type="hidden" id="submit_name" name="submit_name">
                    	<input type="hidden" id="submit_id" name="submit_id">
                    	<input type="hidden" id="submit_pw" name="submit_pw">
                    	<input type="hidden" id="submit_addr" name="submit_addr">
                    	<input type="hidden" id="submit_tel" name="submit_tel">
                    	<input type="hidden" name="insertInfo" id="insertInfo"> 
                    </form>
                </div>
         </div>
</body>
</html>