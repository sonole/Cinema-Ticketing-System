<jsp:include page="assets/includes/loginUserProcess.jsp" />
<jsp:include page="assets/includes/userChat.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sun.jersey.api.client.Client" %>
<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import="com.sun.jersey.api.client.WebResource" %>
<%@ page import="com.sun.jersey.api.client.GenericType"%>
<%@ page import="my.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Profile | CINE Thisio</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css" />		
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</head>


<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

	<!-- Header -->
	<header id="header">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo"><strong>CINE</strong> <span>Thisio</span></a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

		<!-- Menu -->
		<nav id="menu">
		<% 
			String username = (String)session.getAttribute("username");
			Integer isSysAdmin = null;
			if (session.getAttribute("isSysAdmin") != null) {
				isSysAdmin = (Integer)session.getAttribute("isSysAdmin");
			}
			if (username != null) {
				%> <h2>Welcome Back, <% out.print(username); %>!</h2><% 
			} else {
				%> <h2>Hello guest!</h2> <%
			}
		%>
	
		<ul class="links">
			<li><a href="${pageContext.request.contextPath}/index.jsp">Homepage</a></li>
			<%
				if (username != null){
					%><li><a href="${pageContext.request.contextPath}/tickets.jsp">e-Tickets</a></li><%		
				}
			%>
			
			<li><a href="${pageContext.request.contextPath}/aboutus.jsp">About Us</a></li>
			<li><a href="${pageContext.request.contextPath}/contactus.jsp">Contact Us</a></li>
		</ul>
		<ul class="actions stacked">
			<%
				if (isSysAdmin != null){
					%><li><a href="${pageContext.request.contextPath}/adminIndex.jsp" class="button primary fit">Admin Dashboard</a></li><%		
				}
				if (username != null){
					%><li><a href="${pageContext.request.contextPath}/profile.jsp" class="button primary fit">Profile</a></li><%
					%><li><a href="${pageContext.request.contextPath}/assets/includes/logout.jsp" class="button fit">Log Out</a></li><%		
				} else {
					%><li><a href="${pageContext.request.contextPath}/LoginSignup.jsp" class="button primary fit">Login - SignUP</a></li><%
				}
			%>
		</ul>
	</nav>
		
	<!-- Main -->
<div id="main" class="alt">

	<!-- One -->
	<section id="one">
		<div class="inner">
			<header class="major">
				<h1>Profile</h1>
			</header>

				<div class="row gtr-200">
				<div class="col-6 col-12-medium">

				<!-- LEFT SIDE -->
				<h3>Log File</h3>
				<p>Παρακάτω θα βρείτε το ιστορικό σύνδεσης σας</p>
				<hr />
				<%! String output=""; %>
				<%
				/*
				* GET LOG FILE FOR USER
				*/
				Client client = Client.create();
				WebResource webResource = client.resource("http://localhost:8080/CINEThisio/rest/ProfileService/logs/"+username+"/15"); //15 = entries to show
				ClientResponse myresponse = webResource.accept("text/plain").get(ClientResponse.class);
				
				if (myresponse.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code :" + myresponse.getStatus());
				}
				output = myresponse.getEntity(String.class);
				%>
				<%= output %>
				</div>
				
					<%! 
						int thisUid = -1; int thisSysadmin = -1; 
						String thisUsername=""; String thisPassword=""; 
						String thisFname=""; String thisLname=""; String thisEmail="";
					%>
				
					<%
					/*
					*		FETCH DATA AND FILL THE FORM
					*/
					String output="";
					Client client0 = Client.create();
					WebResource webResource0 = client0.resource("http://localhost:8080/CINEThisio/rest/ProfileService/userInfo/"+username);
					ClientResponse myresponse0 = webResource0.accept("application/xml").get(ClientResponse.class);
					
					if (myresponse0.getStatus() != 200) {
						throw new RuntimeException("Failed : HTTP error code :" + myresponse0.getStatus());
					}
					
					List<User> usr = webResource0.get(new GenericType<List<User>>(){});
					
					if(! usr.isEmpty()){
						Iterator it = usr.iterator();
						while(it.hasNext())
						{
							User uz = (User)it.next();
							thisUid = uz.getUid();
							thisUsername = uz.getUsername();
							thisPassword = uz.getPassword();
							thisFname = uz.getFirstname();
							thisLname = uz.getLastname();
							thisEmail = uz.getEmail();
							thisSysadmin = uz.getSysadmin();
							
						}
					} else {
						output="Couldn't fetch your data from db, try to logout and login again.";
						out.write("<script>alert(\""+ output + "\")</script>");
					}
					%>
					<%
					/*
					*		POST FORM WITH UPDATED INFO
					*/
					
					String output1 = "ERROR";
					
					if(request.getParameter("prof-submit") != null){
						
						String profUser = request.getParameter("prof-username");
						String profPass = request.getParameter("prof-password");
						String profFname = request.getParameter("prof-fname");
						String profLname = request.getParameter("prof-lname");
						String profEmail = request.getParameter("prof-email");
						//output1 = profUser+"."+profPass+"."+profFname+"."+profLname+"."+profEmail;
						
						Client client1 = Client.create();
						WebResource webResource1 = client1.resource("http://localhost:8080/CINEThisio/rest/ProfileService/userInfo/"+profUser+"/"+profPass+"/"+profFname+"/"+profLname+"/"+profEmail);
						ClientResponse myresponse1 = webResource1.accept("text/plain").put(ClientResponse.class);
						
						if (myresponse1.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse1.getStatus());
						}
						output1 = myresponse1.getEntity(String.class);
						if(output1.equals("ERROR")) {
							out.write("<script>alert(\""+ output1 + "\")</script>");	
						} else {
							%>
							<script type="text/javascript"> 
							    alert("Your personal info have been updated!"); 
							    window.location.href = "profile.jsp";
							</script>;
							<%
						}
					} 
					 %>
					
				<!-- RIGHT SIDE -->
				<div class="col-6 col-12-medium">
				<h3>Account Information</h3>
				<p>Παρακαλώ υποβάλετε την φόρμα προκειμένου να ανανεώσετε τα στοιχεία σας!</p>
				<form method="post">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="prof-fname" id="signup-fname" value="<%= thisFname %>" required>
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="text" name="prof-lname" id="signup-lname" value="<%= thisLname %>" required>
					</div>
					<div class="col-12 col-12-xsmall">
						<input type="email" name="prof-email" id="signup-email" value="<%= thisEmail %>" required>
					</div>
					<div class="col-12 col-12-xsmall">
						<label>Δεν μπορειτε να αλλαξετε το username σας!</label>
						<input type="text" name="prof-username" id="prof-username" value="<%= thisUsername %>" readonly>
					</div>
					
					<div class="col-12 col-12-xsmall">
						<input type="password" name="prof-password" id="signup-usr" value="" placeholder="Password (put the old one or a new one)" required>
						<input type="hidden" id="login-usr">
					</div>
					<!-- Break -->
					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" name="prof-submit" id="login-pwd" value="SUBMIT" class="primary" /></li>
						</ul>
					</div>
				</div>
				</form>
				</div>
			</div>
			</div>
		</section>

	</div>


	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<ul class="copyright">
				<li>&copy; Alexandros Paliampelos</li><li>Dikrioketrika Pliroforiaka Sistimata</li>
			</ul>
		</div>
	</footer>

	</div>

	<!-- Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/engonly.js"></script>

</body>
</html>