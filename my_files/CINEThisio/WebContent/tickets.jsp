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
	<title>e-Tickets | CINE Thisio</title>
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

		<section>
			<div class="inner">
			<h1>Book Tickets</h1>
				<section>
					
					<hr>
                    <%! String schedule = ""; %>

               		<form method="post" id="selUserDate">
               			<label for="sUDate">Διαλεξτε ημερομηνια</label>
               			<input style="color:black;" type="date" name="sUDate" id="sUDate" required><span> </span>
               			<button type="submit" name="getUserSchedule" id="getUserSchedule" class="primary">Get Schedule</button>
               		</form>
                    	
                   	<% 
                    if(request.getParameter("getUserSchedule") != null){
                		String dateOfAir = request.getParameter("sUDate");
                		Client clientT7 = Client.create();
                		WebResource webResourceT7 = clientT7.resource("http://localhost:8080/CINEThisio/rest/TicketService/schedule/"+dateOfAir+"/U");
                		ClientResponse myresponseT7 = webResourceT7.accept("text/plain").get(ClientResponse.class);
						if (myresponseT7.getStatus() != 200) {
                			throw new RuntimeException("Failed : HTTP error code :" + myresponseT7.getStatus());
                		}
                		schedule = myresponseT7.getEntity(String.class);
                	} 
                    %>
                    <%= schedule %>
				</section>
				<section>
					<hr>
					<h2>Συμπληρώστε τα στοιχεία για κράτηση εισητηρίων</h2>
                    <%! 
						int thisUid = -1; int availableSpots = 0; 
						String thisUsername=""; String thisFname=""; String thisLname=""; String thisEmail="";
					%>		
					<%
					/*
					*		FETCH DATA AND FILL THE FORM
					*/
					String output="";
					Client clientT8 = Client.create();
					WebResource webResourceT8 = clientT8.resource("http://localhost:8080/CINEThisio/rest/ProfileService/userInfo/"+username);
					ClientResponse myresponseT8 = webResourceT8.accept("application/xml").get(ClientResponse.class);
					
					if (myresponseT8.getStatus() != 200) {
						throw new RuntimeException("Failed : HTTP error code :" + myresponseT8.getStatus());
					}
					
					List<User> usr = webResourceT8.get(new GenericType<List<User>>(){});
					
					if(! usr.isEmpty()){
						Iterator it = usr.iterator();
						while(it.hasNext())
						{
							User uz = (User)it.next();
							thisUid = uz.getUid();
							thisUsername = uz.getUsername();
							thisFname = uz.getFirstname();
							thisLname = uz.getLastname();
							thisEmail = uz.getEmail();
							
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
						
						String tUid = request.getParameter("t-uID");
						String tFname = request.getParameter("t-fname");
						String tLname = request.getParameter("t-lname");
						String tEmail = request.getParameter("t-email");
						String tSpots = request.getParameter("t-spots");
						String tProg = request.getParameter("t-prog");
						
						Client clientT9 = Client.create();
						WebResource webResourceT9 = clientT9.resource("http://localhost:8080/CINEThisio/rest/TicketService/book/"+tUid+"/"+tFname+"/"+tLname+"/"+tEmail+"/"+tSpots+"/"+tProg);
						ClientResponse myresponseT9 = webResourceT9.accept("text/plain").post(ClientResponse.class);
						
						if (myresponseT9.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponseT9.getStatus());
						}
						String outputT9 = myresponseT9.getEntity(String.class);
						out.write("<script>alert(\""+ outputT9 + "\")</script>");	
						
					} 
					 %>

					<label for="t-form">Στοιχεια επικοινωνιας</label>
                    <form method="post" id="t-form">
					<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="t-fname" id="t-fname" value="<%= thisFname %>" required>
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="text" name="t-lname" id="t-lname" value="<%= thisLname %>" required>
					</div>
					<div class="col-12 col-12-xsmall">
						<input type="email" name="t-email" id="t-email" value="<%= thisEmail %>" required>
					</div>
					<input type="hidden" name="t-uID" id="t-uID" value="<%= thisUid %>">
					<div class="col-3 col-12-xsmall">
						<label>Πληθος εισιτηριων</label>	
						<input style="color:black;" type="number" name="t-spots" id="t-spots" min="1" placeholder="1" required>
					</div>
					<div class="col-3 col-12-xsmall">
						<label>ID προγραμματος</label>	
						<input style="color:black;" type="number" name="t-prog" id="t-prog" min="1" placeholder="1" required>
					</div>
					<div class="col-6 col-12-xsmall">
					
					</div>
					

					<!-- Break -->
					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" name="prof-submit" id="login-pwd" value="SUBMIT" class="primary" /></li>
						</ul>
					</div>
				</div>
				</form>
				</section>
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