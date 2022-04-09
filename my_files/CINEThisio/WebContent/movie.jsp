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
	<title>Movie Info | CINE Thisio</title>
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
			<%! int mID = 0; 
				String year = "", duration = "", age = "";
				String title = "",stars = "", description = "" ;
			%>
			<%
			String str = request.getQueryString();
			String[] parts = str.split("=");
			String str1 = parts[0]; 		// movieID
			String str2 = parts[1]; 		// INT
			mID = Integer.valueOf(str2);
			if(str1.equals("movieID") && mID > 0)
			{
				Client client1 = Client.create();
				WebResource webResource1 = client1.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/T");
				ClientResponse myresponse1 = webResource1.accept("text/plain").get(ClientResponse.class);
				title = myresponse1.getEntity(String.class);
				Client client2 = Client.create();
				WebResource webResource2 = client2.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/Y");
				ClientResponse myresponse2 = webResource2.accept("text/plain").get(ClientResponse.class);
				year = myresponse2.getEntity(String.class);
				Client client3 = Client.create();
				WebResource webResource3 = client3.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/D");
				ClientResponse myresponse3 = webResource3.accept("text/plain").get(ClientResponse.class);
				description = myresponse3.getEntity(String.class);
				Client client4 = Client.create();
				WebResource webResource4 = client4.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/S");
				ClientResponse myresponse4 = webResource4.accept("text/plain").get(ClientResponse.class);
				stars = myresponse4.getEntity(String.class);
				Client client5 = Client.create();
				WebResource webResource5 = client5.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/d");
				ClientResponse myresponse5 = webResource5.accept("text/plain").get(ClientResponse.class);
				duration = myresponse5.getEntity(String.class);
				Client client6 = Client.create();
				WebResource webResource6 = client6.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+str2+"/A");
				ClientResponse myresponse6 = webResource6.accept("text/plain").get(ClientResponse.class);
				age = myresponse6.getEntity(String.class);
			%> 
			<section id="one">	
				<div class="inner">
					<header class="major">
						<h1><%= title %> (<%= year %>)</h1>
					</header>
		
					<!-- Content -->
						<h2 id="content">Description</h2>
						<p><%= description%></p>
						<div class="row">
							<div class="col-3 col-12-small">
								<p><strong>Stars: </strong><%= stars %></p>
							</div>
							<div class="col-3 col-12-small">
								<p><strong>Duration: </strong><%= duration %>'</p>
							</div>
							<div class="col-3 col-12-small">
								<p><strong>Age: </strong><%= age %></p>
							</div>
						</div>
				</div>
			</section>
			<%
			}
			%>
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

	</body>
</html>