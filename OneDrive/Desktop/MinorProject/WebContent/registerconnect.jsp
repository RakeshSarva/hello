<%@ page import = "java.sql.*"%>
<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String phoneno = request.getParameter("phoneno");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String password = request.getParameter("password");
String re_enterpassword = request.getParameter("re_enterpassword");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
	PreparedStatement ps = con.prepareStatement("insert into table1(firstname,lastname,email,phoneno,address,gender,password,re_enterpassword) values(?,?,?,?,?,?,?,?)");
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,email);
	ps.setString(4,phoneno);
	ps.setString(5,address);
	ps.setString(6,gender);
	ps.setString(7,password);
	ps.setString(8,re_enterpassword);
	int x = ps.executeUpdate();
	if(x>0){
		out.println("done successfully");
	}
	else{
		out.println("failed");
	}
}
catch(Exception e){
	out.println(e);
}
finally{
	out.println("hi");
}
%>
