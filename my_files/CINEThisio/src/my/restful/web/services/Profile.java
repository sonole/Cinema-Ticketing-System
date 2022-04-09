package my.restful.web.services;

import my.db.MySQL;
import my.objects.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Path("/ProfileService")
public class Profile {
	
	@GET
	@Path("/userInfo/{user}")
	@Produces("application/xml")
	public List<User> userInfo(@PathParam("user") String user) 
	{
		//String xml = "";
		List<User> list = new ArrayList<User>();
		MySQL mysqlConnect = new MySQL();
		//Ypothetoume oti den tha exoume diplotima usernames kai ara den tha exoume problima (primary key = userID)
		String query = "SELECT uid, username, password, firstname, lastname, email, sysadmin FROM users WHERE username=?";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    ResultSet rs = statement.executeQuery(); 
		    while (rs.next()) {
		    	int uid = rs.getInt("uid");
		    	String username = rs.getString("username");
		    	String password = rs.getString("password");
		    	String firstname = rs.getString("firstname");
		    	String lastname = rs.getString("lastname");
		    	String email = rs.getString("email");
		    	int sysadmin = rs.getInt("sysadmin");
		    	
		    	User user1 = new User();
				user1.setUid(uid);
				user1.setUsername(username);
				user1.setPassword(password);
				user1.setFirstname(firstname);
				user1.setLastname(lastname);
				user1.setEmail(email);
				user1.setSysadmin(sysadmin);
				list.add(user1);
				
				return list;
		    	/*
		    	xml = "<user id=\""+uid+"\" sysadmin=\""+sysadmin+"\" >"    //vazoume ta id & sysadmin san attributes
		    			+ "<username>"+username+"</username>"
		    			+ "<password>"+password+"</password>"
		    			+ "<fname>"+firstname+"</fname>"
		    			+ "<lname>"+lastname+"</lname>"
		    			+ "<email>"+email+"</email>"
					+ "</user>";
					*/
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		return list;
	}
	
	@PUT
	@Path("userInfo/{user}/{pass}/{fname}/{lname}/{email}")
	@Produces("text/plain")
	public String userInfo(@PathParam("user") String user, @PathParam("pass") String pass, @PathParam("fname") String fname, 
			@PathParam("lname") String lname, @PathParam("email") String email) 
	{
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "UPDATE users SET password = MD5(?), firstname = ?, lastname = ?, email = ? WHERE username = ?;";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, pass);
		    statement.setString(2, fname);
		    statement.setString(3, lname);
		    statement.setString(4, email);
		    statement.setString(5, user);				
			statement.executeUpdate();
		    out = "user info updated";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	@POST
	@Path("logs/{user}")
	@Produces("text/plain")
	public String logs(@PathParam("user") String user) 
	{	
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "INSERT INTO logs (username, date) VALUES (?, NOW())";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    statement.executeUpdate();
		    out = "user logged";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		return out;
	}
	
	@GET
	@Path("logs/{user}/{type}")
	@Produces("text/plain")
	public String logs(@PathParam("user") String user, @PathParam("type") String type)
	{
		String out0 = "ERROR";
		String out1 = "<h3>Retrieving log file for user "+user+"...</h3>"; 
		String out2 = "";
		String query ="";
		int limit = 10;
		if(type.equals("*")) {
			//return all l
			query = "SELECT * FROM logs WHERE username=? ORDER BY date DESC";
		} else {
			limit = Integer.parseInt(type);
			query = "SELECT * FROM logs WHERE username=? ORDER BY date DESC LIMIT ?";
		} 
		MySQL mysqlConnect = new MySQL();
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    if(!type.equals("*")) {
		    	statement.setInt(2, limit);
		    }
		    ResultSet rs = statement.executeQuery(); 
		    while (rs.next()) {
		    	String date = rs.getString("date");
		    	out2 += "<span>"+date+"</span><br>";
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		if(!out2.equals("")) {
			return out1+out2;
		}
		return out1+out0;
	}

}
