package Hlo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


@MultipartConfig(maxFileSize=16*1024*1024)
@WebServlet("/MyProductServlet/")
public class MyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name="";
		String itemcost="";
		String itemcolor="";
		String category="";
		String quality="";
		String mfd="";
		String weight="";
		Blob image=null;
		try{
			String id = request.getParameter("id");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			Statement stmt = con.createStatement();
			String sql = "select * from addtocart";
			ResultSet resultSet = stmt.executeQuery(sql);
				while(resultSet.next()){
					if(id.equalsIgnoreCase(resultSet.getString("id"))){
						name=resultSet.getString("name");
						itemcost=resultSet.getString("itemcost");
						itemcolor=resultSet.getString("itemcolor");
						category=resultSet.getString("category");
						quality=resultSet.getString("quality");
						mfd=resultSet.getString("manufacturedate");
						weight=resultSet.getString("weight");
						image = resultSet.getBlob("image");
					}
				}
				PreparedStatement prst = con.prepareStatement("insert into receivedproducts(name,itemcost,itemcolor,category,quality,manufacturedate,weight,image) values(?,?,?,?,?,?,?,?)");
				prst.setString(1,name);
				prst.setString(2,itemcost);
				prst.setString(3,itemcolor);
				prst.setString(4,category);
				prst.setString(5,quality);
				prst.setString(6,mfd);
				prst.setString(7,weight);
				prst.setBlob(8,image);
				int x = prst.executeUpdate();
				if(x>0){
					System.out.println("Now it is your product");
				}
				else{
					System.out.println("Not added to your productlist");
				}
		}
		catch(Exception e){
			System.out.println(e);
		}
		}
}
