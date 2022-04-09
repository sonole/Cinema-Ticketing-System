package my.restful.web.services;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import my.db.MySQL;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Path("RegisterService")
public class Register {
	
	@POST
	@Path("/user/{fname}/{lname}/{email}/{usr}/{pwd}")
	@Produces("text/plain")
	public String userAuth(@PathParam("fname") String fname, @PathParam("lname") String lname, 
			@PathParam("email") String email, @PathParam("usr") String usr, @PathParam("pwd") String pwd) 
	{
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "INSERT INTO users (username, password, firstname, lastname, email, sysadmin) VALUES (?, MD5(?), ?, ?, ?, ?)";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, usr);
		    statement.setString(2, pwd);
		    statement.setString(3, fname);
		    statement.setString(4, lname);
		    statement.setString(5, email);
		    statement.setBoolean(6, false);
		    statement.executeUpdate();
		    out = "Sign Up SUCCESSFUL";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return(out);
	}
	
}
