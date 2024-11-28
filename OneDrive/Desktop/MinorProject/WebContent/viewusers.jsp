		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		
		<!DOCTYPE html>
	<html>
	<head>
	<style type="text/css">
		.data{
			width:fit-content;
			height:fit-content;
			padding:30px;
			background-color:darkgrey;
			border:3px solid black;
			margin:auto;
			color:white;
		}
	</style>
	</head>
	<body style="background-color:rgb(114, 162, 173);">
	<div class="data">
		<h1 style="margin-left:200px;">The Users are:</h1>
		<table border="1">
		<tr>
		<td>First name</td>
		<td>Last name</td>
		<td>Email</td>
		<td>Phone no</td>
		<td>Address</td>
		<td>Gender</td>
		<td>Password</td>
		
		</tr>
		<%
		String username = request.getParameter("firstname");
		String usermail;
		ResultSet resultSet = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			Statement stmt = con.createStatement();
			String sql ="select * from table1";
			resultSet = stmt.executeQuery(sql);
			while(resultSet.next())
			{
		%>
		<tr>
		<td><%=resultSet.getString("firstname") %></td>
		<td><%=resultSet.getString("lastname") %></td>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("phoneno") %></td>
		<td><%=resultSet.getString("address") %></td>
		<td><%=resultSet.getString("gender") %></td>
		<td><%=resultSet.getString("password") %></td>
		</tr>
		<%
		}
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table> 
	</div>
	</body>
	</html>