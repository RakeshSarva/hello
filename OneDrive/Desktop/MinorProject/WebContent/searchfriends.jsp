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
		background-color:lightblue;
		margin:auto;
		padding-left:300px;
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
	.addbtn{
		width:100px;
		height:30px;
		border-radius:4px;
		decoration:none;
		color:white;
		background-color:indigo;
		padding:5px;
		margin-left:10px;
	}
	td{
	padding:10px;
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
		String hlo = name;
		String name1=request.getParameter("name1");
		Cookie user = new Cookie("hlo",hlo);
		user.setMaxAge(60*60*24*365);
		response.addCookie(user);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		Statement s = con.createStatement();
		String h = "Select * from table1";
		ResultSet resultSet=s.executeQuery(h);
		int id=1;
		while(resultSet.next())
		{
			if(name1.equalsIgnoreCase( resultSet.getString("firstname")) && !name1.equalsIgnoreCase(name))
			{
	%>
		<form  method="post">
				<div class="hlo">
						<table class="whole">
							<tr>
								<td>First name:  <%=resultSet.getString("firstname")%></td>
							</tr>
							<tr>
								<td>Last name:  <%=resultSet.getString("lastname")%></td>
							</tr>
							<tr><td><a style="text-decoration:none;" href="demofrd.jsp?frd=<%=name1%>" class="addbtn">Add Friend</a></td></tr>
						</table>
				</div>
		</form>	
	<%
		}
		}
		con.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	%>
	
		
		<form action="searchfriends.jsp" method="post">				
				 <div>
						<div class="pic">
							<img  alt="can't find" src="images/background.jpg">
						</div>
						<div class="data">
							<h3 style="padding:10px;">Search for Friends: </h3>
							User name: <input type="text" style="padding:10px;" name="name1" placeholder="enter item to search"><br>
							<input style="margin-left:120px;margin-top:20px;" type="submit" value="submit">
						</div>
				</div>
		</form>
		
</body>
</html>