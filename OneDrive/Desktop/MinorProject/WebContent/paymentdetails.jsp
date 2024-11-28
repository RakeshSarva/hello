<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 50px;
	}

	#textContainer {
	    margin-bottom: 20px;
	    border:2px solid black;
	    padding:15px;
	    background-color:#8eb1a8;
	    widht:300px;
	    height:fit-content;
	}
	#text2 input{
		margin:4px;
	}
	button {
	    padding: 10px 20px;
	    font-size: 16px;
	    cursor: pointer;
	}
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	}

	.switch input { 
	  opacity: 0;
	  width: 0;
	  height: 0;
	}

	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}

	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}

	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}

/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	.pic{
		width:150px;
		height:150px;
	}
	td{
		margin:auto;
	}
	.hlo{
		display:flex;
		padding:10px;
		margin:auto;
	}
	img{
		width:250px;
		height:150px;
		margin-top:20px;
		margin-bottom:20px;
	}
	.whole{
		width:400px;
		height:400px;
		border:2px solid black;
		background-color:lightgray;
		color:black;
		padding-left:40px;
		margin:auto;
	}
	h1{
		color:green;
		text-decoration:underline;
		 font-family: Cambria;
	}
	.btn{
		width:50px;
		height:25px;
		text-decoration:none;
		border:2px solid black;
		border-radius:3px;
		color:#e199d9;
		background-color:#6e7a82;
	}
	#paybtn{
		text-decoration:none;
		widht:fit-content;
		height:35px;
		border:2px solid black;
		border-radius:3px;
		background-color:#373135;
		color:white;
		margin-top:10px;
	}
</style>
	<script>
    function toggleText() {
        const text1 = document.getElementById("text1");
        const text2 = document.getElementById("text2");

        if (text1.style.display === "none") {
            text1.style.display = "block";
            text2.style.display = "none";
        } else {
            text1.style.display = "none";
            text2.style.display = "block";
        }
    }
    </script>
</head>
<body>
	<%
	String id = request.getParameter("id");
		try{
		Cookie id1 = new Cookie("id1",id);
		id1.setMaxAge(60*60*24*365);
		response.addCookie(id1);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		Statement stmt = con.createStatement();
		String sql = "select * from addtocart";
		ResultSet resultSet = stmt.executeQuery(sql);
		while(resultSet.next()){
			if(id.equalsIgnoreCase(resultSet.getString("id"))){
	%>
		<div class="hlo">
						<table class="whole">
							<tr>
								<td class="pic"><img src="AccessImage?id=<%=id%>" alt="image"></td>
							</tr>
							<tr>
								<td>Name:  <%=resultSet.getString("name")%></td>
							</tr>
							<tr>
								<td>Weight:  <%=resultSet.getString("weight")%></td>
							</tr>
							<tr>
								<td>Item color:  <%=resultSet.getString("itemcolor")%></td>
							</tr>
							<tr>
								<td>Category:  <%=resultSet.getString("category")%></td>
							</tr>
							<tr>
								<td>Quality:  <%=resultSet.getString("quality")%></td>
							</tr>
							<tr>
								<td>Manufacture date:  <%=resultSet.getString("manufacturedate")%></td>
							</tr>
							<tr>
								<td>Item cost:  <%=resultSet.getString("itemcost")%></td>
							</tr>
							
						</table>
					</div>
	<%		
			}
		}
		con.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	%>
		<label  class="switch"><input type="checkbox" onclick="toggleText()">Toggle Text <span class="slider"></span></label> 
			<form method="post" action="paymentdone.jsp">
			    <div id="textContainer" style="width:300px;margin:auto;margin-top:15px;">
			       	<div id="text1">
			       		Enter UPI id: <input type="text" placeholder="UPI id" size="20">
			       		<button id="paybtn" style="padding-top:8px;margin-top:15px;">Make Payment</button>
			       	</div>
					<div id="text2" style="display:none;">
						Card type: <input type="text" placeholder="type of card" size="20"><br>
						Card no: <input type="text" placeholder="enter card number" size="16"><br>
						VCC no: <input type="text" placeholder="enter vcc number" size="3"><br>
						Exp date: <input type="date" placeholder="enter expire date" >
						<button id="paybtn">Make Payment</button>
					</div>
			    </div>
			</form>
</body>
</html>