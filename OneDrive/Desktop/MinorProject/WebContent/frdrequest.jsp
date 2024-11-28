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
		background-color:lightgray;
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
	}
</style>
</head>
<body>
	<%
		try
		{
			String user="";
			Cookie[] thecookie = request.getCookies();
			if(thecookie!=null){
				for(Cookie tempcookie : thecookie){
					if("MinorProject.firstname".equals(tempcookie.getName())){
						user=tempcookie.getValue();
						break;
					}
				}
			}
			String frd="";
			Cookie[] thecookie1 = request.getCookies();
			if(thecookie1!=null){
				for(Cookie tempcookie : thecookie1){
					if("MinorProject.name1".equals(tempcookie.getName())){
						frd=tempcookie.getValue();
						break;
					}
				}
			}
			System.out.println(user);
			System.out.println(frd);
			String hlo = user;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			Statement stmt = con.createStatement();
			String sql = "select * from table1";
			ResultSet resultSet = stmt.executeQuery(sql);
			if(hlo.equalsIgnoreCase(user))
			{
				while(resultSet.next())
				{
					if(frd.equalsIgnoreCase(resultSet.getString("firstname"))){
		%>
			<div class="hlo">
						<table class="whole">
							<tr>
								<td>First name:  <%=resultSet.getString("firstname")%></td>
							</tr>
							<tr>
								<td>Last name:  <%=resultSet.getString("lastname")%></td>
							</tr>
						</table>
			</div>
		<% 			break;
					}
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
</body>
</html>