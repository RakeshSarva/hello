<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	.pic{
		width:100px;
		height:100px;
	}
	.block{
		width:250px;
		height:250px;
		margin:10px;
		padding:10px;
		border:2px solid black;
		background-color:lightblue;
	}
	img{
		width:200px;
		height:150px;
	}
</style>
</head>
<body>
	<%
		try
		{
		ResultSet resultSet;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		Statement st = con.createStatement();
		String sql = "Select * from productdetails";
		resultSet = st.executeQuery(sql);
		int id;
		while(resultSet.next())
		{
			id=resultSet.getInt("id");
	%>
		<table class="block">
		<tr>
					<td class="pic"><img src="AccessImage?id=<%=id%>" alt="image"></td>
		</tr>
		<tr>
					<td>Review: <%=resultSet.getInt("quality") %> out of 5</td>
		</tr>
		</table>
		<%
		}
		con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		%>
</body>
</html>