<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<html>
<head></head>
<body>
	<%
	String name1=request.getParameter("name");
	ResultSet resultSet;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
		PreparedStatement ps=con.prepareStatement("DELETE  FROM productdetails WHERE name=?");
		ps.setString(1,name1);
		ps.executeUpdate();
		String sql ="select * from productdetails";
		Statement stmt = con.createStatement();
		resultSet = stmt.executeQuery(sql);
		while(resultSet.next()){
			if(resultSet.getString("name").equalsIgnoreCase(name1));
			{
				out.println("the post is failed to delete");
			
			}
		}
		out.println("the post deleted successfully");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	%>
</body>
</html>