<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	html,body{
		width:100%;
		height:100%;
		background-color:#88d4c5;
	}
	.hlo{
		width:20%;
		height:fit-content;
		display:flex;
		padding:5px;
		border:2px solid black;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		margin:auto;
		padding:20px;
		margin-bottom:20px;
		justify-content:center;
		background-color:#cc9bc7;
	}
	.pic{
		width:70%;
		height:50%;
		border:2px solid black;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		margin:auto;
		margin-bottom:50px;
	}
	img{
		width:100%;
		height:30%;
	}
	.data{
		width:50%;
		height:20%;
		border:2px solid black;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		background-color:lightblue;
		margin:auto;
		padding-left:300px;
	}
	.addbtn{
		width:100px;
		height:30px;
		border-radius:10px;
		decoration:none;
		color:white;
		background-color:indigo;
	}
	td{
	padding:10px;
	}
	.pic img{
	 width:1065px;
	 height:500px;
	}
	
	
</style>
</head>
<body>
		<%
		try{
		String name=request.getParameter("name");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		Statement s = con.createStatement();
		String h = "Select * from productdetails;";
		ResultSet resultSet=s.executeQuery(h);
		int id;
		while(resultSet.next())
		{
			if(name.equalsIgnoreCase(resultSet.getString("name")))
			{
				id=resultSet.getInt("id");
	%>
	<div class="hlo">
			<table class="whole">
				<tr>
					<td class="pic1"><img src="AccessImage?id=<%=id%>" alt="image"></td>
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
		<form action="searchposts.jsp" method="post">				
				 <div>
						<div class="pic">
							<img  alt="can't find" src="images/userverify1.jpg">
						</div>
						<div class="data">
							<h3 style="padding:10px;">Search for Posts: </h3>
							User Post name: <input type="text" style="padding:10px;" name="name" placeholder="enter item to search"><br>
							<input style="margin-left:120px;margin-top:20px;" type="submit" value="submit">
						</div>
				</div>
		</form>
		
</body>
</html>