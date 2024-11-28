package Hlo;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;


@WebServlet("/AccessImage/")
public class AccessImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
			String sql = "select image from productdetails where id=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1,Integer.parseInt(request.getParameter("id")));
			ResultSet resultSet = stmt.executeQuery();
			while(resultSet.next()) {
				Blob blob = resultSet.getBlob("image");
				byte[] imageBytes = blob.getBytes(1,(int)blob.length());
				response.setContentType("image/jpeg");
				OutputStream os = response.getOutputStream();
				os.write(imageBytes);
				os.flush();
				os.close();
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			if(con!=null) {
				try {
					con.close();
				}
				catch(Exception e) {
					System.out.println(e);
				}
			}
		}
	}

}
