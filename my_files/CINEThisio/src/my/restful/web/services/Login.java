package my.restful.web.services;

import my.db.MySQL;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


@Path("/LoginService")
public class Login {
	
	@GET
	@Path("/userAuth/{user}/{pass}")
	@Produces("text/plain")
	public Response userAuth(@PathParam("user") String user, @PathParam("pass") String pass) 
	{
		String out = "ERROR";
		int statusCode = 404;
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT COUNT(*) AS count FROM users WHERE username=? and password=MD5(?)";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    statement.setString(2, pass);
		    ResultSet rs = statement.executeQuery(); 
		    rs.next();
		    if ( rs.getInt("count") == 1 ) {
		    	//out = "Log In SUCCESSFUL";
		    	statusCode = 200;
		    	if (isSysAdmin(user)) {
		    		out = "ADMIN:TRUE";
		    	} else {
		    		out = "ADMIN:FALSE";
		    	}
		    } else {
		    	out = "Wrong username or password!";
		    	statusCode = 400;
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return Response.status(statusCode).entity(out).build();
	}
	
	private boolean isSysAdmin(String user) {
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT COUNT(*) AS count FROM users WHERE username=? and sysadmin=1";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    ResultSet rs = statement.executeQuery(); 
		    rs.next();
		    if ( rs.getInt("count") == 1 ) {
		    	return true;
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		return false;
	}
}
