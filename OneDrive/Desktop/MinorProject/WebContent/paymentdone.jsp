<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	.hlo{
		widht:600px;
		height:fit-content;
		border:2px solid black;
		color:black;
		background-color:#bff1fc;
		margin:auto;
	}
	form{
		width:600px;
		margin:auto;
	}
	#btn{
		text-decoration:none;
		border:2px solid black;
		border-radius:2px;
	}
</style>
</head>
<body>
	<%	
	%>
	<div class="hlo">
		<form  action="hi.jsp" method="post">
			<h2>Payment is done</h2>
			<p>verify the product status</p>
			Is payment done:<br>
			<input type="radio" name="payment" value="yes">yes
			<input type="radio" name="payment" value="no">no <br>
			Is Delivery done:<br>
			<input type="radio" name="delivery" value="yes">yes
			<input type="radio" name="delivery" value="no">no<br> 
			Is product is without any damage: <br>
			<input type="radio" name="damage" value="yes">yes
			<input type="radio" name="damage" value="no">no<br> 
			Did you satisfied by our service: <br>
			<input type="radio" name="service" value="yes">yes
			<input type="radio" name="service" value="no">no<br> 
			<button>Get the product</button>
		</form>
	</div>
</body>
</html>