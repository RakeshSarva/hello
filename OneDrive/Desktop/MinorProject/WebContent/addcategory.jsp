<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  String category=request.getParameter("category1"); 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		PreparedStatement ps = con.prepareStatement("insert into categories(category) values(?)");
		ps.setString(1,category);
		int x = ps.executeUpdate();
		if(x>0){
			response.sendRedirect("productcategory.jsp");
		}
		con.close();
		}
	catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>