package my.restful.web.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import my.db.MySQL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Path("AdminService")
public class Admin {
	
	@GET
	@Path("/users")
	@Produces("text/plain")
	public String getUsers()
	{
		int i = 0;
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM users";
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
		return String.valueOf(i);
	}
	
	@GET
	@Path("/movies")
	@Produces("text/plain")
	public String getMovies()
	{
		int i = 0;
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM movie";
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
		return String.valueOf(i);
	}
	
	@GET
	@Path("/theaters")
	@Produces("text/plain")
	public String getTheaters()
	{
		int i = 0;
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM theater";
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
		return String.valueOf(i);
	}
	
	@GET
	@Path("/messages/{sysadmin}")
	@Produces("text/plain")
	public String getTodaysMessages(@PathParam("sysadmin") String sysadmin)
	{
		int i = 0;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = formatter.format(date)+"%";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM chatrooms WHERE type='U' AND sysadmin=? AND date LIKE ?";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, sysadmin);
		    statement.setString(2, today);
		    ResultSet rs = statement.executeQuery(); 
		    while (rs.next()) {
		    	i++;
		    }
	    }catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}		 
		return String.valueOf(i);
	}
	
	@GET
	@Path("/selectMovie")
	@Produces("text/plain")
	public String selectMovie() {
		
		String err = "ERROR";
		String out = ""; 
		MySQL mysqlConnect = new MySQL();
		
		String query = "SELECT * FROM movie";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			ResultSet rs = statement.executeQuery(); 
			out += "<select name='smID' id='smID' required>";
	    	out +="<option value=''>--</option>";
			while (rs.next()) {
				int mID = rs.getInt("mID");
				String title = rs.getString("title");
				out +="<option value='"+mID+"'>"+title+"</option>";
				err = "";
			}
			out += "</select>";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		if (err.equals(""))
			return out;
		else
			return err;
	}
	
	@GET
	@Path("/selectTheater")
	@Produces("text/plain")
	public String selectTheater() {
		
		String err = "ERROR";
		String out = ""; 
		MySQL mysqlConnect = new MySQL();
		
		String query = "SELECT * FROM theater";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			ResultSet rs = statement.executeQuery(); 
			out += "<select name='stID' id='stID' required>";
	    	out +="<option value=''>--</option>";
			while (rs.next()) {
				int tID = rs.getInt("tID");
				out +="<option value='"+tID+"'>ID: "+tID+"</option>";
				err = "";
			}
			out += "</select>";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		if (err.equals(""))
			return out;
		else
			return err;
	}
	
	@GET
	@Path("/selectSchedule")
	@Produces("text/plain")
	public String selectSchedule() {
		
		String err = "ERROR";
		String out = ""; 
		MySQL mysqlConnect = new MySQL();
		
		String query = "SELECT * FROM schedule";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			ResultSet rs = statement.executeQuery(); 
			out += "<select name='ssID' id='ssID' required>";
	    	out +="<option value=''>--</option>";
			while (rs.next()) {
				int sID = rs.getInt("sID");
				out +="<option value='"+sID+"'>ID: "+sID+"</option>";
				err = "";
			}
			out += "</select>";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		if (err.equals(""))
			return out;
		else
			return err;
	}
		

	@GET
	@Path("/theater/{tID}")
	@Produces("text/plain")
	public String getTheaterSpots(@PathParam("tID") String tID) {
		String out = "ERROR";
		int ttID = Integer.valueOf(tID);
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM theater WHERE tID=?";
		try {
			 PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			 statement.setInt(1, ttID);
			 ResultSet rs = statement.executeQuery(); 
			 while (rs.next()) {
				 int totalSpots = rs.getInt("totalSpots");
				 out = String.valueOf(totalSpots);
			 }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	@POST
	@Path("/movie/{mtitle}/{myear}/{mstars}/{mdesc}/{mmin}/{mage}")
	@Produces("text/plain")
	public String addMovie(@PathParam("mtitle") String mtitle, @PathParam("myear") String myear,  @PathParam("mstars") String mstars, 
			@PathParam("mdesc") String mdesc, @PathParam("mmin") String mmin, @PathParam("mage") String mage) 
	{
		mtitle = mtitle.replace("%20", " ");
		int mmyear = Integer.valueOf(myear);
		mstars =mstars.replace("%20", " ");
		mdesc = mdesc.replace("%20", " ");
		int mmmin = Integer.valueOf(mmin);
		int mmage = Integer.valueOf(mage);
		
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "INSERT INTO movie (title, year, stars, description, duration, age) VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, mtitle);
		    statement.setInt(2, mmyear);
		    statement.setString(3, mstars);
		    statement.setString(4, mdesc);
		    statement.setInt(5, mmmin);
		    statement.setInt(6, mmage);
		    statement.executeUpdate();
		    out = "Movie added SUCCESSFUL";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	
	@PUT
	@Path("/movie/{mmID}/{mtitle}/{myear}/{mstars}/{mdesc}/{mmin}/{mage}")
	@Produces("text/plain")
	public String editMovie(@PathParam("mmID") String mmID,@PathParam("mtitle") String mtitle, @PathParam("myear") String myear,  @PathParam("mstars") String mstars, 
			@PathParam("mdesc") String mdesc, @PathParam("mmin") String mmin, @PathParam("mage") String mage) 
	{
		int mID = Integer.valueOf(mmID);
		mtitle = mtitle.replace("%20", " ");
		int mmyear = Integer.valueOf(myear);
		mstars =mstars.replace("%20", " ");
		mdesc = mdesc.replace("%20", " ");
		int mmmin = Integer.valueOf(mmin);
		int mmage = Integer.valueOf(mage);
		
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "UPDATE movie SET title = ?, year = ?, stars = ?, description = ?, duration=?, age=? WHERE mID = ?;";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, mtitle);
		    statement.setInt(2, mmyear);
		    statement.setString(3, mstars);
		    statement.setString(4, mdesc);
		    statement.setInt(5, mmmin);
		    statement.setInt(6, mmage);
		    statement.setInt(7, mID);
		    statement.executeUpdate();
		    out = "Movie has been updated!";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	
	@POST
	@Path("/theater/{tID}/{tSpots}")
	@Produces("text/plain")
	public String addTheater(@PathParam("tID") String tID, @PathParam("tSpots") String tSpots)
	{
	
		int ttID = Integer.valueOf(tID);
		int ttSpots = Integer.valueOf(tSpots);
		
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		
		String query = "INSERT INTO theater (tID, totalSpots) VALUES (?, ?)";
		
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setInt(1, ttID);
		    statement.setInt(2, ttSpots);
		    statement.executeUpdate();
		    out = "Theater added SUCCESSFUL";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	
	@PUT
	@Path("/theater/{tID}/{tSpots}")
	@Produces("text/plain")
	public String editTheater(@PathParam("tID") String tID, @PathParam("tSpots") String tSpots) 
	{
		int ttID = Integer.valueOf(tID);
		int ttSpots = Integer.valueOf(tSpots);
		
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "UPDATE theater SET totalSpots=? WHERE tID = ?;";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setInt(1, ttSpots);
		    statement.setInt(2, ttID);
		    statement.executeUpdate();
		    out = "Theater has been updated!";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	
	@POST
	@Path("/schedule/{tID}/{mID}/{dateOfAir}/{movieUP}")
	@Produces("text/plain")
	public String addSchedule(@PathParam("tID") String tID, @PathParam("mID") String mID,
			@PathParam("dateOfAir") String dateOfAir, @PathParam("movieUP") String movieUP) 
	{	
		String out =  "ERROR";
	
		int ttID = Integer.valueOf(tID);
		int mmID = Integer.valueOf(mID);
		dateOfAir = dateOfAir.replace("%3A", ":");
		dateOfAir = dateOfAir.replace("T", " ");
		int totalTheaterSpots = Integer.valueOf(getTheaterSpots(tID));
		int availbleSpots = totalTheaterSpots;	
		int mUP = Integer.valueOf(movieUP);
		
		MySQL mysqlConnect = new MySQL();
		String query = "INSERT INTO schedule (theaterID, movieID, dateOfAir, availbleSpots, totalSpots, movieUP) VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setInt(1, ttID);
		    statement.setInt(2, mmID);
		    statement.setString(3, dateOfAir);
		    statement.setInt(4, availbleSpots);
		    statement.setInt(5, totalTheaterSpots);
		    statement.setInt(6, mUP);
		    statement.executeUpdate();
		    out = "Movie added to schedule";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	@PUT
	@Path("/schedule/{sID}/{date}/{mUP}")
	@Produces("text/plain")
	public String editSchedule(@PathParam("sID") String sID, @PathParam("date") String date, @PathParam("mUP") String mUP) 
	{
		int ssID = Integer.valueOf(sID);
		int movieUP = Integer.valueOf(mUP);
				
		date = date.replace("%3A", ":");
		date = date.replace("T", " ");
		
		String out = "ERROR";
		MySQL mysqlConnect = new MySQL();
		String query = "UPDATE schedule SET dateOfAir=?, movieUP=? WHERE sID = ?;";
		try {
		    PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
		    statement.setString(1, date);
		    statement.setInt(2, movieUP);
		    statement.setInt(3, ssID);
		    statement.executeUpdate();
		    out = "Schedule has been updated!";
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	@GET
	@Path("/schedule/{sID}/{type}")
	@Produces("text/plain")
	public String getScheduleInfo(@PathParam("sID") String sID, @PathParam("type") String type) 
	{
		int scheduleID = Integer.valueOf(sID);
		String out = "ERROR";
		int movieUP=0;
		String dateOfAir="";
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM schedule WHERE sID = ?";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setInt(1, scheduleID);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				dateOfAir = rs.getString("dateOfAir");
				dateOfAir = dateOfAir.replace(":00.0", "");
				dateOfAir = dateOfAir.replace(" ", "T");
				movieUP = rs.getInt("movieUP");
				out = "";
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		if (out.equals("")){
			if( type.equals("d") ){
				return dateOfAir;
			}
			if( type.equals("m") ){
				return String.valueOf(movieUP);
			}
		}
		
		return out;
	}
	
}
