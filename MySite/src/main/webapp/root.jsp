<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.insertInput{
            width: 500px;
        }
        #insertButton{
            background-color: white;
            border:1px solid;
            margin: 0 40%;
            width: 20%;
            height: 30px;
            font-size: 13px;
            color: dodgerblue;
            cursor: pointer;
        }
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
</style>
<script type="text/javascript">
	function insert() {
		document.getElementById("hidden_insertTitle").value = document.getElementById("insertTitle").value;
		document.getElementById("hidden_insertContent").value = document.getElementById("insertContent").value;
		document.getElementById("hidden_insertLdate").value = document.getElementById("insertLdate").value;
		document.getElementById("hidden_insertArtist").value = document.getElementById("insertArtist").value;
		document.getElementById("hidden_insertPrice").value = document.getElementById("insertPrice").value;
		document.getElementById("hidden_insertUrl").value = document.getElementById("insertUrl").value;
		document.getElementById("item_insert_index").value = 1;
		document.getElementById("insertForm").submit();
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
            
            <div class="center">
               타이틀: <input type="text" id="insertTitle" name="insertTitle" class="insertInput"><br><br>
               내용:   <input type="text" id="insertContent" name="insertContent" class="insertInput"><br><br>
               발매일: <input type="text" id="insertLdate" name="insertLdate" class="insertInput"><br><br>
               가수:   <input type="text" id="insertArtist" name="insertArtist" class="insertInput"><br><br>
               가격: <input type="text" id="insertPrice" name="insertPrice" class="insertInput"><br><br>
               이미지: <input type="text" id="insertUrl" name="insertUrl" class="insertInput"><br><br>
               <button onclick="insert();" id="insertButton">추가하기</button>
               <form action="/MySite/myServlet" id="insertForm" method="get">
               	<input type="hidden" id="hidden_insertTitle" name="hidden_insertTitle">
               	<input type="hidden" id="hidden_insertContent" name="hidden_insertContent">
               	<input type="hidden" id="hidden_insertLdate" name="hidden_insertLdate">
               	<input type="hidden" id="hidden_insertArtist" name="hidden_insertArtist">
               	<input type="hidden" id="hidden_insertPrice" name="hidden_insertPrice">
               	<input type="hidden" id="hidden_insertUrl" name="hidden_insertUrl">
                <input type="hidden" id="item_insert_index" name="item_insert_index">
               </form>
            </div>
        </div>
</body>
</html>