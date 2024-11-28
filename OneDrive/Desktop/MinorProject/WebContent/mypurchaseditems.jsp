<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	.whole{
		width:400px;
		height:400px;
		border:2px solid black;
		background-color:lightgray;
		color:black;
		margin:20px;
		padding-left:40px;
	}
	.hlo{
		display:flex;
		padding:10px;
	}
	img{
		width:250px;
		height:150px;
		margin-top:20px;
		margin-bottom:20px;
	}
	h1{
		color:green;
		text-decoration:underline;
		 font-family: Cambria;
	}
</style>
</head>
<body>
<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			Statement stmt = con.createStatement();
			String sql = "select * from receivedproducts";
			ResultSet resultSet = stmt.executeQuery(sql);
			int id=1;
%>
	<h1><font size="8">Delivered products</font></h1>
<%		
			while(resultSet.next()){
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
				id++;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
%>
</body>
</html>