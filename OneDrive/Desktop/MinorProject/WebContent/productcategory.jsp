<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	html,body{
		width:100%;
 		height:100%;
 		background-color:#6ca7bb;
	}
	img{
 		width:100%;
 		height:30%;
 		border:3px solid black;
 	}
	.categories{
		width:30%;
		height:fit-content;
		margin:auto;
		margin-bottom:30px;
	}
	.addcategory{
		width:30%;
		height:35%;
		background-color:#f8d8aa;
		border: 2px solid black;
		margin:auto;
		padding:10px;
		text-align:center;
	}
	.database{
		width:fit-content;
		height:25px;
		padding:3px;
		background-color:#a3e194;
		border:2px solid green;
	}
	.pic{
		width:60%;
		height:30%;
		margin-bottom:30px;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		margin:auto;
	}
</style>
</head>
<body>
	<div>
		<div class="pic"><img src="images/recommandation.jpg" alt="can't load image"></div>
		<div class="categories">
			<h2 style="margin-left:40px;">The Categories of the Products are:</h2>
			<table class="items">
			<% ResultSet resultSet = null;
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
				Statement stmt = con.createStatement();
				String sql ="select * from categories";
				resultSet = stmt.executeQuery(sql); 
				while(resultSet.next()){
				%>
					<ul type="disc">
						<li><p class="database"><%=resultSet.getString("category")%></p></li>
					</ul>
				<% }
				 con.close();
				 }
				 catch(Exception e){
					 out.println(e);
				 }
				 %>
			</table>	
		</div>
	<form action="addcategory.jsp">
		<div class="addcategory">
			<b style="margin:20px;"><font size="5">Add the type of Category</font></b><br>
			<font size="5">Category:<input style="margin:20px;" type="text" name="category1" placeholder="enter the category"></font><br>
			<button style="background-color:#6ea841;"><font size="4">Add Category</font></button><br>
		</div>
	</form>
	</div>
</body>
</html>