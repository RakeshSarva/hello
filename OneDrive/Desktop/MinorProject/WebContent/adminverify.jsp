<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
		String admin = request.getParameter("name");
		String password = request.getParameter("password");
		if((admin.equalsIgnoreCase("rakesh"))&&(password.equalsIgnoreCase("rakesh")))
		{
			response.sendRedirect("admin.html");
		}
		else{
			response.sendRedirect("wrongadmin.html");
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