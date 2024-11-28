package Hlo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;






@MultipartConfig(maxFileSize=16*1024*1024)
@WebServlet("/BasicServlet/")
public class BasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String cost=request.getParameter("cost");
		String color=request.getParameter("color");
		String category=request.getParameter("category");
		String rating=request.getParameter("rating");
		String manufacturedate=request.getParameter("mfd");
		String weight=request.getParameter("weight");
		
		try {
			Part filePart = request.getPart("image");
			if(filePart != null)
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			PreparedStatement ps = con.prepareStatement("insert into productdetails(name,itemcost,itemcolor,category,quality,manufacturedate,weight,image) values(?,?,?,?,?,?,?,?)");
			InputStream is = filePart.getInputStream();
			ps.setString(1,name);
			ps.setString(2,cost);
			ps.setString(3,color);
			ps.setString(4,category);
			ps.setString(5,rating);
			ps.setString(6,manufacturedate);
			ps.setString(7,weight);
			ps.setBlob(8,is);
			int x = ps.executeUpdate();
			if(x==0) {
				System.out.println("post not updated in db");
			}
			else {
				System.out.println("post updated in db");
			}
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
