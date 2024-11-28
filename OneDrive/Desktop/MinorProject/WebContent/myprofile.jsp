<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{
	background-image:url(images//myprofilebg.jpg);
	background-size:cover;
	}
td{
	color:white;
	padding:20px;
}
.main{
	border:5px solid black;
	margin:auto;
	width:500px;
	padding:20px;
	background-color:rgba(0,0,0,0.3);
	box-shadow:6px 6px 12px rgba(0,0,0,0.5);
	border-radius:20px;
}

</style>
</head>
<body>
<%
	try{
		String name="";
		Cookie[] thecookie = request.getCookies();
		if(thecookie!=null){
			for(Cookie tempcookie : thecookie){
				if("MinorProject.firstname".equals(tempcookie.getName())){
					name=tempcookie.getValue();
					break;
				}
			}
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		Statement stmt = con.createStatement();
		String sql = "select * from table1";
		ResultSet resultSet = stmt.executeQuery(sql);
		while(resultSet.next()){
			if(name.equalsIgnoreCase(resultSet.getString("firstname"))){
	%>
	<div class="main">
		<table>
				<tr>
					<td><font size="6">First name: <%=resultSet.getString("firstname")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Last name: <%=resultSet.getString("lastname")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Email: <%=resultSet.getString("email")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Phone no: <%=resultSet.getString("phoneno")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Address: <%=resultSet.getString("address")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Gender: <%=resultSet.getString("gender")%></font></td>
				</tr>
				<tr>
					<td><font size="6">Password: <%=resultSet.getString("password")%></font></td>
				</tr>
		</table>
	</div>
	<% 
			}
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
	%>
</body>
</html>