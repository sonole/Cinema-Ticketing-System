<jsp:include page="assets/includes/userChat.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About Us | CINE Thisio</title>
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
					<h1>About Us</h1>
					<hr>
					<p>Το cine ΘΗΣΕΙΟΝ είναι το πιο παλιό Θερινό Σινεμά της Αθήνας, φτιαγμένο το 1935. 
					Λειτουργεί από τότε μέχρι σήμερα κάθε άνοιξη και καλοκαίρι, με μια μικρή αναγκαστική διακοπή 
					κατά τη διάρκεια της κατοχής. Από το 1980, το σινεμά περνά στην οικογένειά μας, στην 
					οικογένεια Μανιάκη, που το φροντίζουμε και το μεταμορφώνουμε σε έναν μικρό παράδεισο στο 
					ιστορικό κέντρο της Αθήνας, ακριβώς κάτω από την Ακρόπολη.</p>
					<p>Μέχρι και σήμερα, αφιερώνουμε τον χρόνο, την προσοχή και την αγάπη μας σε αυτό το ιστορικό 
					σινεμά και το διατηρούμε προσεγμένο, καταπράσινο και απόλυτα ταιριαστό με την περιοχή, 
					σεβόμενοι την ιστορία και την παράδοση, όχι μόνο του τόπου, αλλά και των θερινών κινηματογράφων
					του “τότε”… των κινηματογράφων που ξέρουμε καλά, μετά από 50 και πλέον χρόνια που δραστηριοποιούμαστε σε αυτό τον κλάδο.</p>	
				</section>
				<section>
					<img src="https://cine-thisio.gr/wp-content/uploads/2013/04/kou_0004.jpg" width="500px" alt="photo1"> 
					<br><br>
					<img src="https://cine-thisio.gr/wp-content/uploads/2013/04/kou_0119-525x351.jpg" width="500px" alt="photo2">
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