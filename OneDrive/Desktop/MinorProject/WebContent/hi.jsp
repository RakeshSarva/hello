<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String id="";
		Cookie[] thecookie = request.getCookies();
		if(thecookie!=null){
			for(Cookie tempcookie : thecookie){
				if("id1".equals(tempcookie.getName())){
					id=tempcookie.getValue();
					break;
				}
			}
		}
		System.out.println(id);
		String payment=request.getParameter("payment");
		System.out.println(payment);
		String delivery=request.getParameter("delivery");
		String damage=request.getParameter("damage");
		String service=request.getParameter("service");
		try{
		if(payment.equalsIgnoreCase("yes") && delivery.equalsIgnoreCase("yes") && damage.equalsIgnoreCase("yes") && service.equalsIgnoreCase("yes")){
%>
						<a href="MyProductServlet?id=<%=id%>" id="btn">Good to go</a>
	
 <% 
		}
		}
		catch(Exception e){
			System.out.println(e);
		}
 %>
</body>
</html>