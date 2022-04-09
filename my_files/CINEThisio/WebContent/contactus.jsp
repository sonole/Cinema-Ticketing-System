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
	<title>Contact Us| CINE Thisio</title>
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

	<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section>
					<h1>Contact Us</h1>
					<hr>
					<%  
					if(request.getParameter("contactus-submit") != null){
						
						String cName = request.getParameter("contactus-name");
						String cEmail = request.getParameter("contactus-email");
						String cMsg = request.getParameter("contactus-message");
						
						cName = cName.replace(" ", "%20");
						cEmail = cEmail.replace(" ", "%20");
						cMsg = cMsg.replace(" ", "%20");
						
						Client client1 = Client.create();
						WebResource webResource1 = client1.resource("http://localhost:8080/CINEThisio/rest/ContactService/contactUs/"+cName+"/"+cEmail+"/"+cMsg);
						ClientResponse myresponse1 = webResource1.accept("text/plain").post(ClientResponse.class);
						
						if (myresponse1.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse1.getStatus());
						}
						String output1 = myresponse1.getEntity(String.class);
						
						out.write("<script>alert(\""+ output1 + "\")</script>");	
					}
					%>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<label for="name">Name</label>
								<input type="text" name="contactus-name" id="contactus-name" required>
							</div>
							<div class="field half">
								<label for="email">Email</label>
								<input type="email" name="contactus-email" id="contactus-email" required>
							</div>
							<div class="field">
								<label for="message">Message</label>
								<textarea name="contactus-message" id="contactus-message" rows="6" required></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" name="contactus-submit" id="contactus-submit" value="Send Message" class="primary" /></li>
							<li><input type="reset" value="Clear" /></li>
						</ul>
					</form>
				</section>
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>Email</h3>
							<a href="mailto:cinethisio@mail.com">cinethisio@mail.com</a>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>Τηλέφωνο</h3>
							<span>(+30) 210 342 086 47</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>Διεύθυνση</h3>
							<span>Απ. Παύλου 7, Θησείο <br />
							Αθήνα, 11851<br />
							Ελλάδα</span>
						</div>
					</section>
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

</body>
</html>