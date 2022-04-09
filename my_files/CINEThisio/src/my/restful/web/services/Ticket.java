package my.restful.web.services;

import my.db.MySQL;
import my.third.party.SendEmail;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Path("TicketService")
public class Ticket {
			
	@GET
	@Path("/schedule/{dateOfAir}/{type}")
	@Produces("text/plain")
	public String getSchedule(@PathParam("dateOfAir") String dateOfAir, @PathParam("type") String type) 
	{
		String out =  "<h4 style='text-align:center;'>DATE: "+dateOfAir+"</h4>";
		String out2 ="";
		if (type.equals("U")) {
			out += "<table><tr><td>ID</td><td>Theater</td><td>Movie</td><td>Air Date</td><td>Available Spots</td><td>Total Spots</td></tr>";
			out2 = "<tr><th>--</th><th>--</th><th>--</th><th>--</th><th>--</th><th>--</th></tr>";
		} else if (type.equals("A")) {
			out += "<table><tr><td>ID</td><td>Theater</td><td>Movie</td><td>Air Date</td><td>Available Spots</td><td>Total Spots</td><td>Is Movie Available?</td></tr>";
			out2 = "<tr><th>--</th><th>--</th><th>--</th><th>--</th><th>--</th><th>--</th><th>--</th></tr>";

		}

		String out3 = "";	
		dateOfAir = dateOfAir+"%";
		
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM schedule WHERE dateOfAir LIKE ?";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setString(1, dateOfAir);
			ResultSet rs = statement.executeQuery(); 
			while (rs.next()) {
				int sID = rs.getInt("sID");
				int theaterID = rs.getInt("theaterID");
				int movieID = rs.getInt("movieID");
				String movieName = getMovieName(movieID);
				String date = rs.getString("dateOfAir");
				date = date.replace(":00.0", "");
				int availbleSpots = rs.getInt("availbleSpots");
				int totalSpots = rs.getInt("totalSpots");
				int movieUP = rs.getInt("movieUP");
				String movie = "";
				if (movieUP == 1) {
					movie = "YES";
				} else {
					movie = "NO";
				}
				out2 = "";
				if (type.equals("U") && movieUP == 1) {
					out3 += "<tr><th>"+sID+"</th><th>"+theaterID+"</th><th><a target='_blank' href='./movie.jsp?movieID="+movieID+"'>"+movieName+"</a></th><th>"+date+"</th><th>"+availbleSpots+"</th><th>"+totalSpots+"</th></tr>";
				} else if (type.equals("A")) {
					out3 += "<tr><th>"+sID+"</th><th>"+theaterID+"</th><th><a target='_blank' href='./movie.jsp?movieID="+movieID+"'>"+movieName+"</a></th><th>"+date+"</th><th>"+availbleSpots+"</th><th>"+totalSpots+"</th><th>"+movie+"</th></tr>";
				}
				
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		return out+out2+out3+"</table>";
		
	}
	
	@POST
	@Path("/book/{uID}/{fname}/{lname}/{email}/{spots}/{sID}")
	@Produces("text/plain")
	public String book(@PathParam("uID") String uID, @PathParam("fname") String fname, @PathParam("lname") String lname, 
			@PathParam("email") String email, @PathParam("spots") String spots, @PathParam("sID") String sID) 
	{	
		int uuID = Integer.valueOf(uID);
		int ssID = Integer.valueOf(sID);
		int sspots = Integer.valueOf(spots);
		String out = "ERROR";
		boolean flag = false;
		int availableSpots = 0;
		int movieID = 0;
		int theaterID = 0;
		String date = "";
		String movieName="";
		MySQL mysqlConnect = new MySQL();
		
		
		//check if inserted program exists (from schedule table)
		try {
			String query = "SELECT * FROM schedule WHERE sID=?";
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setInt(1, ssID);
			ResultSet rs = statement.executeQuery(); 
			while (rs.next()) {
				availableSpots = rs.getInt("availbleSpots");
				theaterID = rs.getInt("theaterID");
				movieID = rs.getInt("movieID");
				date = rs.getString("dateOfAir");
				date = date.replace(":00.0", "");
				movieName = getMovieName(movieID);
				flag = true;
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}

		if (flag == false) {
			out = "The inserted schedule dosent exist (please consult the table above) ! Try again.";
			return out;
		}
		if (availableSpots < sspots) {
			out = "We only have "+availableSpots+" available spots for the selected schedule. Try again.";
			return out;
		}
		
		//proceed to booking
		try {
			String query = "INSERT INTO booking (uID, sID, spots) VALUES (?, ?, ?)";
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setInt(1, uuID);
			statement.setInt(2, ssID);
			statement.setInt(3, sspots);
			statement.executeUpdate();
			//out = "Successful booking! You have to pay for "+sspots+ " tickets at the cinema!";
			
			//UPDATE THE SCHEDULE
			String query2 = "UPDATE schedule SET availbleSpots=? WHERE sID=?";
			PreparedStatement statement2 = mysqlConnect.connectDB().prepareStatement(query2);
			statement2.setInt(1, availableSpots-sspots);
			statement2.setInt(2, ssID);
			statement2.executeUpdate();
			
			SendEmail mail = new SendEmail();
			String recipient = email;  
			String subject = "CINE Thisio - Successful booking!";
			String body = "<u><h1>BOOKING DETAILS</h1></u><br>";
			body += "<strong>Name:</strong> "+fname+" "+lname+"<br>";
			body += "<br><hr><br>";
			body += "<strong>Date:</strong> "+date+"<br>";
			body += "<strong>Movie:</strong> "+movieName+"<br>";
			body += "<strong>Theater:</strong> "+String.valueOf(theaterID)+"<br>";
			body += "<strong>Number of tickets:</strong> "+sspots+"<br>";
			body += "<br><hr><br>";
			body += "<strong>Total cost:</strong> "+sspots+"x10 = "+sspots*10+" EUR<br>";
			body += "Pay at cinema with the following QR code:<br>";
			body += "<img src='https://th.bing.com/th/id/OIP.3PS24iiu-A3RpY9MdvBxKAHaHa?pid=ImgDet&rs=1' alt='QR' width='30%'>";
			
			flag = mail.sendEmail(recipient, subject, body);
			
			if(flag == true) {
				out = "Successful booking! More details at your email!";
			} else {
				out = "ERROR !! Couldnt send the tickets at your email.";
			}
			
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		
		return out;
	}
	
	@GET
	@Path("/movie/{mID}/{type}")
	@Produces("text/plain")
	public String getMovieFullInfo(@PathParam("mID") String mID, @PathParam("type") String type) 
	{
		int movieID = Integer.valueOf(mID);
		String out = "ERROR";
		int year = 0, duration = 0, age = 0;
		String title = "",stars = "", description = "" ;
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM movie WHERE mID = ?";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setInt(1, movieID);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				title = rs.getString("title");
				year = rs.getInt("year");
				stars = rs.getString("stars");
				description = rs.getString("description");
				duration = rs.getInt("duration");
				age = rs.getInt("age");
				out = "";
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();

		}
		
		if (out.equals("")){
			if( type.equals("T") ){
				return title;
			}
			if( type.equals("Y") ){
				return String.valueOf(year);
			}
			if( type.equals("S") ){
				return stars;
			}
			if( type.equals("D") ){
				return description;
			}
			if( type.equals("d") ){
				return String.valueOf(duration);
			}
			if( type.equals("A") ){
				return String.valueOf(age);
			}
		}
		
		return out;
	}
	
	private String getMovieName(int mID) {
		String out = ""; 
		MySQL mysqlConnect = new MySQL();
		String query = "SELECT * FROM movie WHERE mID=?";
		try {
			PreparedStatement statement = mysqlConnect.connectDB().prepareStatement(query);
			statement.setInt(1, mID);
			ResultSet rs = statement.executeQuery(); 
			while (rs.next()) {
				String title = rs.getString("title");
				out=title;
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    mysqlConnect.disconnectDB();
		}
		return out;
	}
}
	