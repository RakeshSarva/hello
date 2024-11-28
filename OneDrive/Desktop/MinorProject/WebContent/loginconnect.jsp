<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("name");
String password = request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
	PreparedStatement ps = con.prepareStatement("insert into table2(username,password) values(?,?)");
	ps.setString(1,username);
	ps.setString(2,password);
	int x = ps.executeUpdate();
	if(x>0){
		out.println("login in successful");
	}
	else{
		out.println("login in failed");
	}
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