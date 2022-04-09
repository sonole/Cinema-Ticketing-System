package my.restful.web.services;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import my.db.MySQL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Path("ChatService")
public class Chat {

	@POST
	@Path("/pushMessage/{id}/{type}/{user}/{sysadmin}/{msg}")
	@Produces("text/plain")
	public String pushMessage(@PathParam("id") int id, @PathParam("type") String type,
			@PathParam("user") String user, @PathParam("sysadmin") String sysadmin, @PathParam("msg") String msg)
	{
		String out = "ERROR";
		if( type.equals("U") || type.equals("A")) {				//To minima to stelnei o user ston admin
			MySQL mysqlConnect = new MySQL();
			String query ="";
			msg = msg.replace("%20", " ");
			try {
				query = "INSERT INTO chatrooms (chatID, type, user, sysadmin, message, date) VALUES (?, ?, ?, ?, ?, NOW())";
				if (id == 0 ) {			
					if (getChatNo() == 0) {
						id = 1;                  //to proto chatroom
					} else {
						id = getChatNo();
						id++;					//to epomeno megalitoro diathesimo
					}
					String check = openChat(user, sysadmin);
					if (!check.equals("0")) {   								//chatroom alreeady exist
						id = Integer.valueOf(check);
					}
				}
			    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
				statement.setInt(1, id);
				statement.setString(2, type);
			    statement.setString(3, user);
			    statement.setString(4, sysadmin);
			    statement.setString(5, msg);				
			    statement.executeUpdate();
			    out = "msg send!";
			} catch (SQLException e) {
			    e.printStackTrace();
			} finally {
			    mysqlConnect.disconnectDB();
			}
		} 
		return out;
				
	}
	
	@GET
	@Path("/admins")
	@Produces("text/plain")
	public String getAdmins()
	{
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM users WHERE sysadmin=1";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    ResultSet rs = statement.executeQuery(); 
		    int i = 0;
		    while (rs.next()) {
		    	String username = rs.getString("username");
		    	String firstname = rs.getString("firstname");
		    	String lastname = rs.getString("lastname");
		    	String name = firstname + " " + lastname;
		    	if ( i == 0 ) {
		    		out  ="<label for='sysadmin'>Select admin to communicate:</label>";
			    	out +="<select style='border: 2px dotted white;' name='sysadmin' id='sysadmin'>";
			    	out +="<option value=''>--</option>";
			    	out +="<option value='"+username+"'>"+name+"</option>";
		    	} else if ( i > 0 ) {
		    		out +="<option value='"+username+"'>"+name+"</option>";
		    	}
		    	i++;
		    }
		    if (!out.equals("ERROR")) {
		    	out +="</select>";
		    }
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		 
		return out;
				
	}
	
	@GET
	@Path("/admins2")
	@Produces("text/plain")
	public String getAdmins2()
	{
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM users WHERE sysadmin=1";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    ResultSet rs = statement.executeQuery(); 
		    int i = 0;
		    while (rs.next()) {
		    	String username = rs.getString("username");
		    	String firstname = rs.getString("firstname");
		    	String lastname = rs.getString("lastname");
		    	String name = firstname + " " + lastname;
		    	if ( i == 0 ) {
		    		out  ="<label for='sysadmin2'>Select admin to communicate:</label>";
			    	out +="<select style='border: 2px dotted white;' name='sysadmin2' id='sysadmin2'>";
			    	out +="<option value=''>--</option>";
			    	out +="<option value='"+username+"'>"+name+"</option>";
		    	} else if ( i > 0 ) {
		    		out +="<option value='"+username+"'>"+name+"</option>";
		    	}
		    	i++;
		    }
		    if (!out.equals("ERROR")) {
		    	out +="</select>";
		    }
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		 
		return out;
				
	}
	
	@GET
	@Path("/chat/{id}")
	@Produces("text/plain")
	public String getMsgs(@PathParam("id") int chatid)
	{
		String out = "";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM chatrooms WHERE chatID=?";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setInt(1, chatid);
		    ResultSet rs = statement.executeQuery(); 
		    while (rs.next()) {
		    	String type = rs.getString("type");
		    	String user = rs.getString("user");
		    	String sysadmin = rs.getString("sysadmin");
		    	String msg = rs.getString("message");
		    	String date = rs.getString("date");
		    	if (type.equals("U")) {     // MSG FROM USER
		    		out += "<div class='chatbox'>";
		    		out += "<p>"+msg+"</p>";
		    		out += "<span style='float: right;color: #aaa;'>"+user+" | "+date+"</span>";
		    		out += "</div>";
		    	} else {
		    		out += "<div class='chatbox darker'>";
		    		out += "<p>"+msg+"</p>";
		    		out += "<span style='float: left;color: #999;'>"+sysadmin+" | "+date+"</span>";
		    		out += "</div>";
		    	}
		    }
		   
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		if(!out.equals("")) {
			return out;
		}
		return "ERROR";
	}
	
	@GET
	@Path("/openChat/{user}/{sysadmin}")
	@Produces("text/plain")
	public String openChat(@PathParam("user") String user, @PathParam("sysadmin") String sysadmin)
	{
		String chatID = "0";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM chatrooms WHERE user=? AND sysadmin=?";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, user);
		    statement.setString(2, sysadmin);
		    ResultSet rs = statement.executeQuery(); 
		    while (rs.next()) {
		    	int i = rs.getInt("chatID");
		    	chatID = String.valueOf(i);
		    }
		   
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return chatID;
	}
	
	@GET
	@Path("/adminMsgList/{sysadmin}")
	@Produces("text/plain")
	public String getAdminMsgList(@PathParam("sysadmin") String sysadmin) {
		String err="ERROR";
		String out="";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM chatrooms WHERE sysadmin=?";
		int i=0;
		List<String> list=new ArrayList<String>();  

		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, sysadmin);
		    ResultSet rs = statement.executeQuery(); 
		    
		    int y = -1;
		    while (rs.next()) {
		    	int id = rs.getInt("chatID");
		    	if(id > y) {
		    		y = id;
		    		i++;
		    		err = "";
			    	String user = rs.getString("user");
			    	list.add(user);
		    	}			  
		    }		   
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}

		if(list.size() > 0) {
			String query1= "SELECT * FROM users WHERE username=?";
		    String name ="ERROR";
		    try {
		    	out +="<form id='users' method='post'><select style='border: 2px dotted white;' name='selChat' id='selChat'>";
		    	out +="<option value=''>--</option>";
		    	for(int z=0; z<i; z++) {
			    	PreparedStatement statement1 = mysqlConnect.connectDB().prepareStatement(query1);
			    	statement1.setString(1, list.get(z));
			    	ResultSet rs1 = statement1.executeQuery();  	
			    	while (rs1.next()) {
			    		String fname = rs1.getString("firstname");
			    		String lname = rs1.getString("lastname");
			    		name = fname+" "+lname;
			    		out += "<option style='width:100%;background-color: #04AA6D;color:white;font-size: 16px;text-align: center;' value='"+list.get(z)+"'>"+name+"</option>";
			    	}
		    	}
		    	out +="</select></br></br><button type='submit' style='width:100%;background-color: #04AA6D;color:white;font-size: 16px;text-align: center;padding: 10px 22px;'>Open Chat</button></form>";

		    } catch (SQLException e) {
		   		e.printStackTrace();
		    }
		}

		return err+out;
	}
	
	private int getChatNo() {
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM chatrooms";
		int i=0;
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    ResultSet rs = statement.executeQuery(); 
		    
		    while (rs.next()) {
		    	i++;
		   }		   
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		return i;
	}
}
