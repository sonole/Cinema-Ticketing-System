<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sun.jersey.api.client.Client" %>
<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import="com.sun.jersey.api.client.WebResource" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login - Signup | CINE Thisio</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<link href='https://fonts.googleapis.com/css?family=Roboto:900,900italic,500,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/loginsignup.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/slider.js"></script>
</head>

<body>
<div id="fback"><div class="girisback"></div><div class="kayitback"></div></div>

<div id="textbox">
  <div class="toplam">

    <!-- *************************** -->
	<!-- ******* SIGNUP FORM ******* -->
	<!-- *************************** -->
	<%! String randomPass = ""; %>
	<%
	Client client0 = Client.create();
	WebResource webResource0 = client0.resource("http://localhost:8080/CINEThisio/rest/RandomPass/pass");
	ClientResponse myresponse0 = webResource0.accept("text/plain").get(ClientResponse.class);
	
	if (myresponse0.getStatus() != 200) {
		throw new RuntimeException("Failed : HTTP error code :" + myresponse0.getStatus());
	}
	
	String str = myresponse0.getEntity(String.class);
	randomPass = str;
	
	if(request.getParameter("btn-signup") != null){
		
		String fname = request.getParameter("signup-fname");
		String lname = request.getParameter("signup-lname");
		String email = request.getParameter("signup-email");
		String usr = request.getParameter("signup-usr");
		String pwd = request.getParameter("signup-pwd");

		Client client1 = Client.create();
		WebResource webResource1 = client1.resource("http://localhost:8080/CINEThisio/rest/RegisterService/user/"+fname+"/"+lname+"/"+email+"/"+usr+"/"+pwd);
		ClientResponse myresponse1 = webResource1.accept("text/plain").post(ClientResponse.class);

		if (myresponse1.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code :" + myresponse1.getStatus());
		}
		
		String output = myresponse1.getEntity(String.class);
		
		if( output != "ERROR") {
			output = "Το password σας είναι: "+ pwd + "\\n" + output;
		}
		out.write("<script>alert(\""+ output + "\")</script>");

	} 
	%>
    <div class="left">
    <div id="ic">
        <h2>Sign Up</h2>
        <p>Παρακαλούμε συμπλωρώστε τα απαιτούμενα στοιχεία προκειμένου να πραγματοποιηθεί η εγγραφή σας.</p>
        <form id="girisyap" name="signup_form" id="signup_form" method="post">

         	<div class="yarim form-group">
            	<label class="control-label">First Name</label>
            	<input type="text" name="signup-fname" id="signup-fname" class="form-control" required></input>
          	</div>
        	<div class="yarim sn form-group">
          		<label class="control-label">Last Name</label>
         		<input type="text" name="signup-lname" id="signup-lname" class="bform-control" required></input>
      		</div>
      		<div class="form-group">
       			<label class="control-label">Email</label>
        		<input type="email" name="signup-email" id="signup-email" class="form-control" required></input>
    		</div>
      		<div class="form-group">
       			<label class="control-label">Username</label>
        		<input type="text" name="signup-usr" id="signup-usr" class="form-control" required></input>
    		</div>
    		<p>Έχει δημιουργηθεί αυτόματα 6ψηφιο password το οποίο θα σας κοινοποιηθεί μόλις πατήσετε Signup</p>
   			<div class="form-group">
     			<label class="control-label">Password</label>
    			<input type="password" name="signup-pwd" id="signup-pwd" value="<%= randomPass %>" class="form-control" required></input>
  			</div>
			<input type="submit" value="Sign Up" name="btn-signup" class="girisbtn"  />
		</form>

		<button id="moveright">Login</button>
	</div>
	</div>


	<!-- ************************** -->
	<!-- ******* LOGIN FORM ******* -->
	<!-- ************************** -->
	<%
	if(request.getParameter("btn-login") != null){

		String username = request.getParameter("login-usr");
		String password = request.getParameter("login-pwd");

		Client client2 = Client.create();
		WebResource webResource2 = client2.resource("http://localhost:8080/CINEThisio/rest/LoginService/userAuth/"+username+"/"+password);
		ClientResponse myresponse2 = webResource2.accept("text/plain").get(ClientResponse.class);
		
		String output = myresponse2.getEntity(String.class);
		
		if (myresponse2.getStatus() == 200) {							//login successful
			//log file 
			Client client3 = Client.create();
			WebResource webResource3 = client3.resource("http://localhost:8080/CINEThisio/rest/ProfileService/logs/"+username);
			ClientResponse myresponse3 = webResource3.accept("text/plain").post(ClientResponse.class);
			if(output.equals("ADMIN:TRUE")) {
				HttpSession session1 = request.getSession();  
		        session1.setAttribute("username", username);
		        session1.setAttribute("isSysAdmin", 1);
		       %><jsp:forward page="adminIndex.jsp"/><%						//forward to admin page
			} else if (output.equals("ADMIN:FALSE")){
				HttpSession session1 = request.getSession();  
		        session1.setAttribute("username", username);
		        %><jsp:forward page="index.jsp"/><%						//forward to main page
			}
		} else if (myresponse2.getStatus() == 400) {					//Wrong username or password
			out.write("<script>alert(\"" + output + "\")</script>");
		} else {
			throw new RuntimeException("Failed : HTTP error code :" + myresponse2.getStatus());
		}
		
		out.write("<script>alert(\"" + output + "\")</script>");
		//out.println(output);	
		
	} 
	%>
	<div class="right">
  	<div id="ic">
  	${error }
    <h2>Login</h2>
	    <p>Για να αποκτήσετε πρόσβαση στον λογαριασμό σας παρακαλώ εισάγετε τα απαιτούμενα στοιχεια.</p>
	    <form name="login-form" id="girisyap" id="sidebar-user-login" method="post">
	    	<div class="form-group">
	        	<label class="control-label">Username</label>
	        	<input type="text" name="login-usr" id="login-usr" class="form-control" required></input>
	      	</div>
	    	<div class="form-group soninpt">
	      		<label class="control-label">Password</label>
	      		<input type="password" name="login-pwd" id="login-pwd" class="form-control" required></input>
	  		</div>
	 		<input type="submit" value="Login" name="btn-login" class="girisbtn" tabindex="100" />
	  	</form>
		<button id="moveleft">Sign Up</button>
	</div>
	</div>

</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/engonly.js"></script>
</html>