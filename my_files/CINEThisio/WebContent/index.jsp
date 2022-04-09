<jsp:include page="assets/includes/userChat.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF=8">
	<title>Homepage | CINE Thisio</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css" />		
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">
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
		
				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>Καλώς ήρθατε στον θερινό κινηματογράφο ΘΗΣΕΙΟΝ</h1>
							</header>
							<div class="content">
								<p>Με θεα την φωτισμενη Ακροπολη</p>
								<ul class="actions">
									<li><a href="#one" class="button next scrolly">Get Started</a></li>
								</ul>
							</div>
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="${pageContext.request.contextPath}/assets/img/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="${pageContext.request.contextPath}/tickets.jsp" class="link">e-Tickets</a></h3>
										<p>Book a Ticket</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="${pageContext.request.contextPath}/assets/img/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="${pageContext.request.contextPath}/profile.jsp" class="link">Profile</a></h3>
										<p>Here you can see and edit your personal profile</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="${pageContext.request.contextPath}/assets/img/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="${pageContext.request.contextPath}/contactus.jsp" class="link">Contact Us</a></h3>
										<p>Send us your questions about anything</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="${pageContext.request.contextPath}/assets/img/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="${pageContext.request.contextPath}/aboutus.jsp" class="link">About Us</a></h3>
										<p>Learn a few things for us</p>
									</header>
								</article>
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