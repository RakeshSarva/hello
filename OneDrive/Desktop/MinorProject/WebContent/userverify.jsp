<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
	<%
		String name = request.getParameter("firstname");
		String userpassword = request.getParameter("password");
		Cookie cookie1 = new Cookie("MinorProject.firstname",name);
		cookie1.setMaxAge(60*60*24*365);
		ResultSet resultSet = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			Statement stmt = con.createStatement();
			String sql ="select * from table1";
			resultSet = stmt.executeQuery(sql);
			Boolean x;
			while(resultSet.next())
			{
				if(resultSet.getString("firstname").equalsIgnoreCase(name) && resultSet.getString("password").equalsIgnoreCase(userpassword))
				{
					response.addCookie(cookie1);
					response.sendRedirect("user.jsp");
				}
			
			}
			response.sendRedirect("wronguser.html");
			con.close();
		}
		catch(Exception e){
			out.println(e);
		}
	    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>