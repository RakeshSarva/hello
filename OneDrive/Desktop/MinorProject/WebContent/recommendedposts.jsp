<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	html,body{
		width:100%;
		height:100%;
		background-color:lightgray;
	}
	.hlo{
		width:50%;
		height:fit-content;
		display:flex;
		padding:10px;
	}
	.pic{
		width:70%;
		height:40%;
		border:2px solid black;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		margin:auto;
		margin-bottom:50px;
	}
	img{
		width:100%;
		height:60%;
	}
	.data{
		width:50%;
		height:20%;
		border:2px solid black;
		box-shadow:6px 6px 12px rgba(0,0,0,0.5);
		background-color:lightgreen;
		margin:auto;
		padding-left:300px;
	}
	.whole img{
		widht:300px;
		height:200px;
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
		String h = "Select * from productdetails";
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
		<form action="recommendedposts.jsp" method="post">				
				 <div>
						<div class="pic">
							<img  alt="can't find" src="images/userverify1.jpg">
						</div>
						<div class="data">
							<h3 style="padding:10px;">Search the required items: </h3>
							Item name: <input type="text" style="padding:10px;" name="name" placeholder="enter item to search"><br>
							<input style="margin-left:120px;margin-top:20px;" type="submit" value="submit">
						</div>
				</div>
		</form>
		
</body>
</html>