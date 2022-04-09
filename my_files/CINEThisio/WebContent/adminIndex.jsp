<jsp:include page="assets/includes/loginUserProcess.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sun.jersey.api.client.Client" %>
<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import="com.sun.jersey.api.client.WebResource" %>
<%! String sysadmin = ""; String username = ""; %>
<%  sysadmin = (String)session.getAttribute("username");  %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin Dashboard</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link id="pagestyle" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet"/>
  <script src="https://kit.fontawesome.com/0a56443cfa.js" crossorigin="anonymous"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="${pageContext.request.contextPath}/adminIndex.jsp">
        <img src="${pageContext.request.contextPath}/assets/img/favicon.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">CINE Thisio Admin</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <!-- START OF LEFT MENU -->
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100 h-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link  active" href="${pageContext.request.contextPath}/adminIndex.jsp">
            <i class="fas fa-cogs"></i>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  " href="${pageContext.request.contextPath}/adminMessages.jsp">
             <i class="fas fa-comments"></i>
            <span class="nav-link-text ms-1">Messages</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  " href="${pageContext.request.contextPath}/profile.jsp">
            <i class="fas fa-user-alt"></i>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  " href="${pageContext.request.contextPath}/index.jsp">
            <i class="fas fa-home"></i>
            <span class="nav-link-text ms-1">Homepage</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/assets/includes/logout.jsp">
            <i class="fas fa-sign-out-alt"></i>
            <span class="nav-link-text ms-1">Logout</span>
          </a>
        </li>
      </ul>
    </div>
    <!-- END OF LEFT MENU -->

  </aside>
  
  <main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <h6 class="font-weight-bolder mb-0">Dashboard</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
            </li>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      	    <!--  START 4 top counters -->
	    <%! int  users = 0; int movies = 0; int theaters = 0; int messages = 0;%>
	    <%
		    Client client1 = Client.create();
			WebResource webResource1 = client1.resource("http://localhost:8080/CINEThisio/rest/AdminService/users");
			ClientResponse myresponse1 = webResource1.accept("text/plain").get(ClientResponse.class);
			users = Integer.valueOf(myresponse1.getEntity(String.class));
			Client client2 = Client.create();
			WebResource webResource2 = client2.resource("http://localhost:8080/CINEThisio/rest/AdminService/movies");
			ClientResponse myresponse2 = webResource2.accept("text/plain").get(ClientResponse.class);
			movies = Integer.valueOf(myresponse2.getEntity(String.class));
			Client client3 = Client.create();
			WebResource webResource3 = client3.resource("http://localhost:8080/CINEThisio/rest/AdminService/theaters");
			ClientResponse myresponse3 = webResource3.accept("text/plain").get(ClientResponse.class);
			theaters = Integer.valueOf(myresponse3.getEntity(String.class));
			Client client4 = Client.create();
			WebResource webResource4 = client4.resource("http://localhost:8080/CINEThisio/rest/AdminService/messages/"+sysadmin);
			ClientResponse myresponse4 = webResource4.accept("text/plain").get(ClientResponse.class);
			messages = Integer.valueOf(myresponse4.getEntity(String.class));
	    %>
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Users</p>
                    <h5 class="font-weight-bolder mb-0"><%= users %></h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                    <i class="fas fa-users"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Movies</p>
                    <h5 class="font-weight-bolder mb-0"><%= movies %></h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                   <i class="far fa-file-video"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Theaters</p>
                    <h5 class="font-weight-bolder mb-0"><%= theaters %></h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                    <i class="fas fa-warehouse"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-capitalize font-weight-bold">Today's messages</p>
                    <h5 class="font-weight-bolder mb-0"><%= messages %></h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                    <i class="far fa-comment"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--  END 4 top counters -->
      
      <!-- MAIN CONTENT -->
      <div class="row mt-4">
        <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Add new movie</p>
                    <br>
                    <%
                	if(request.getParameter("addMovie") != null){
                		
                		String mtitle = request.getParameter("movieTitle");
                		mtitle = mtitle.replace(" ", "%20");
                		String myear = request.getParameter("movieYear");
                		String mstars = request.getParameter("movieStars");
                		mstars = mstars.replace(" ", "%20");
                		String mdesc = request.getParameter("movieDesc");
                		mdesc = mdesc.replace(" ", "%20");
                		String mmin = request.getParameter("movieDuration");
                		String mage = request.getParameter("movieAudience");

                		Client clientT1 = Client.create();
                		WebResource webResourceT1 = clientT1.resource("http://localhost:8080/CINEThisio/rest/AdminService/movie/"+mtitle+"/"+myear+"/"+mstars+"/"+mdesc+"/"+mmin+"/"+mage);
                		ClientResponse myresponseT1 = webResourceT1.accept("text/plain").post(ClientResponse.class);

                		if (myresponseT1.getStatus() != 200) {
                			throw new RuntimeException("Failed : HTTP error code :" + myresponseT1.getStatus());
                		}
                		
                		String outputT1 = myresponseT1.getEntity(String.class);
                		
                		out.write("<script>alert(\""+ outputT1 + "\")</script>");
                	} 
                    %>
						<form method="post" id="newMovie">
							<input type="text" name="movieTitle" id="movieTitle" placeholder="Movie Title.." required>
							<input type="number" min="1905" name="movieYear" id="movieYear" placeholder="2018" required>
							<br>
							<input type="text" name="movieStars" id="movieStars" placeholder="Movie Stars.." required>
							<input type="text" name="movieDesc" id="movieDesc" placeholder="Movie Description.." required>
							<br>
							<label for="movieAudience">Duration of the movie in  minutes</label>
							<input type="number" min="0" max="300" name="movieDuration" id="movieDuration" placeholder="120" required>
							<br>
							<label for="movieAudience">Min age of the viewers (years old)</label>
							<input type="number" min="0" max="100" step="1" name="movieAudience" id="movieAudience" placeholder="10" required>
							<br>
							<button type="submit" name="addMovie" id="addMovie">Add Movie</button>
						</form>
						
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    
        <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Add new theater</p>
                    <br>
 					<%! int newTheaterID = 0; %>
 					<%! int totalTheaters = 0; %>
 					<%
            		totalTheaters = theaters;
            		newTheaterID = totalTheaters + 1;
 					
                	if(request.getParameter("addTheater") != null){
                		String tID = request.getParameter("theaterID");
                		String tSpots = request.getParameter("totalSpots");
						Client clientT3 = Client.create();
                		WebResource webResourceT3 = clientT3.resource("http://localhost:8080/CINEThisio/rest/AdminService/theater/"+tID+"/"+tSpots);
                		ClientResponse myresponseT3 = webResourceT3.accept("text/plain").post(ClientResponse.class);
						if (myresponseT3.getStatus() != 200) {
                			throw new RuntimeException("Failed : HTTP error code :" + myresponseT3.getStatus());
                		}
                		String outputT3 = myresponseT3.getEntity(String.class);
                		out.write("<script>alert(\""+ outputT3 + "\")</script>");
                	} 
                    %>	
 						<form method="post" id="newTheater">
 							<label for="theaterID">New theater ID:</label>
 							<input type="text" name="theaterID" id="theaterID" value="<%=newTheaterID %>" readonly>
 							<br>
 							<label for="totalSpots">Add the capacity of the theater </label>
 							<input type="number" min="50" max="500" name="totalSpots" id="totalSpots" placeholder="150" required>
 							<br><br><br>
 							<button type="submit" name="addTheater" id="addTheater">Add Theater</button>
 						</form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Add to Schedule</p>
                    <br>
                    	<p>Εισαγωγή προβολής</p>
						<form id="addMovieToSchedule" method="POST">
							<label for="stID">Επιλογή αίθουσας προβολής </label>
							<input type="number" name="stID" id="stID" min="1" max="<%= totalTheaters %>" step="1" placeholder="1" required> 
							<br>
							<label for="smID">Επιλογή ταινίας προβολής </label>
							<%! String outputT4 =""; %>
							<%
								Client clientT4 = Client.create();
			            		WebResource webResourceT4 = clientT4.resource("http://localhost:8080/CINEThisio/rest/AdminService/selectMovie");
			            		ClientResponse myresponseT4 = webResourceT4.accept("text/plain").get(ClientResponse.class);
			            		if (myresponseT4.getStatus() != 200) {
			            			throw new RuntimeException("Failed : HTTP error code :" + myresponseT4.getStatus());
			            		}
			            		outputT4 = myresponseT4.getEntity(String.class);
							%>
							<%= outputT4  %>
							<br>
							<label for="stID">Επιλογή ώρας προβολής </label>
							<input type="datetime-local" name="sDate" id="sDate" required>
							<br>
							<input type="checkbox" id="sMovieUp" name="sMovieUp" value="1">
  							<label for="vehicle1">Η ταινία είναι διαθέσιμη για το κοινό</label><br>
  							<br>
							<button type="submit" name="sAddSchedule" id="sAddSchedule">Add to Schedule</button>
						</form>
						<% 
	                    	if(request.getParameter("sAddSchedule") != null){
	                    		String tID = request.getParameter("stID");
	                    		String mID = request.getParameter("smID");
	                    		String dateOfAir = request.getParameter("sDate");
	                    		dateOfAir = dateOfAir+":00";
	                    		dateOfAir = dateOfAir.replace(":", "%3A");
	                    		String movieUp = "0";
	                    		if(request.getParameter("sMovieUp") != null){
	                    			movieUp = request.getParameter("sMovieUp");
	                    		}
	                    		
	                    		Client clientT5 = Client.create();
	                    		WebResource webResourceT5 = clientT5.resource("http://localhost:8080/CINEThisio/rest/AdminService/schedule/"+tID+"/"+mID+"/"+dateOfAir+"/"+movieUp);
	                    		ClientResponse myresponseT5 = webResourceT5.accept("text/plain").post(ClientResponse.class);
	    						if (myresponseT5.getStatus() != 200) {
	                    			throw new RuntimeException("Failed : HTTP error code :" + myresponseT5.getStatus());
	                    		}
	                    		String outputT5 = myresponseT5.getEntity(String.class);
	                    		out.write("<script>alert(\""+ outputT5 + "\")</script>");

	                    	} 
                    	%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row mt-4">
        <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Edit Movie</p>
                    <br>
                    <%! int movieID = 0, age = 0, duration = 0;
						String year = "", title = "",stars = "", description = "" ;
					%>
						<% 
	                    	if(request.getParameter("selectMovie") != null){
	            
	                    		String mID = request.getParameter("smID");
	                    		movieID = Integer.valueOf(mID);
	                    		Client client11 = Client.create();
	            				WebResource webResource11 = client11.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/T");
	            				ClientResponse myresponse11 = webResource11.accept("text/plain").get(ClientResponse.class);
	            				title = myresponse11.getEntity(String.class);
	            				Client client22 = Client.create();
	            				WebResource webResource22 = client22.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/Y");
	            				ClientResponse myresponse22 = webResource22.accept("text/plain").get(ClientResponse.class);
	            				year = myresponse22.getEntity(String.class);
	            				Client client33 = Client.create();
	            				WebResource webResource33 = client33.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/D");
	            				ClientResponse myresponse33 = webResource33.accept("text/plain").get(ClientResponse.class);
	            				description = myresponse33.getEntity(String.class);
	            				Client client44 = Client.create();
	            				WebResource webResource44 = client44.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/S");
	            				ClientResponse myresponse44 = webResource44.accept("text/plain").get(ClientResponse.class);
	            				stars = myresponse44.getEntity(String.class);
	            				Client client55 = Client.create();
	            				WebResource webResource55 = client55.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/d");
	            				ClientResponse myresponse55 = webResource55.accept("text/plain").get(ClientResponse.class);
	            				duration = Integer.valueOf(myresponse55.getEntity(String.class));
	            				Client client66 = Client.create();
	            				WebResource webResource66 = client66.resource("http://localhost:8080/CINEThisio/rest/TicketService/movie/"+mID+"/A");
	            				ClientResponse myresponse66 = webResource66.accept("text/plain").get(ClientResponse.class);
	            				age = Integer.valueOf(myresponse66.getEntity(String.class));
	            				
	                    		%> 
	                    		<form method="post" id="editMovie">
	                    			<input type="hidden" name="newMovieID" id="newMovieID" value="<%=movieID %>" >
									<input type="text" name="newMovieTitle" id="newMovieTitle" value="<%= title %>" required>
									<input type="number" min="1905" name="newMovieYear" id="newMovieYear" value="<%=year %>" required>
									<br>
									<input type="text" name="newMovieStars" id="newMovieStars" value="<%= stars%>" required>
									<input type="text" name="newMovieDesc" id="newMovieDesc" value="<%=description %>" required>
									<br>
									<label for="newMovieAudience">Duration of the movie in  minutes</label>
									<input type="number" min="0" max="300" name="newMovieDuration" id="newMovieDuration" value="<%= duration %>" required>
									<br>
									<label for="movieAudience">Min age of the viewers (years old)</label>
									<input type="number" min="0" max="100" step="1" name="newMovieAudience" id="newMovieAudience" value="<%= age %>" required>
									<br>
									<button type="submit" name="editMovie" id="editMovie">Edit Movie</button>
								</form>
	                    		
	                    		<%
	                    		
	                    	} else {
	                    		%>
	                    		<form id="selMovie" method="POST">
									<label for="smID">Επιλογή ταινίας</label>
									<%= outputT4  %>
									<button type="submit" name="selectMovie" id="selectMovie">Select movie</button>
								</form>	
	                    		<%
	                    	}
							if(request.getParameter("editMovie") != null){
	                			String mmID = request.getParameter("newMovieID");
	                			String mtitle = request.getParameter("newMovieTitle");
	                    		mtitle = mtitle.replace(" ", "%20");
	                    		String myear = request.getParameter("newMovieYear");
	                    		String mstars = request.getParameter("newMovieStars");
	                    		mstars = mstars.replace(" ", "%20");
	                    		String mdesc = request.getParameter("newMovieDesc");
	                    		mdesc = mdesc.replace(" ", "%20");
	                    		String mmin = request.getParameter("newMovieDuration");
	                    		String mage = request.getParameter("newMovieAudience");
	
	                    		Client client77 = Client.create();
	                    		WebResource webResource77 = client77.resource("http://localhost:8080/CINEThisio/rest/AdminService/movie/"+mmID+"/"+mtitle+"/"+myear+"/"+mstars+"/"+mdesc+"/"+mmin+"/"+mage);
	                    		ClientResponse myresponse77 = webResource77.accept("text/plain").put(ClientResponse.class);
	
	                    		if (myresponse77.getStatus() != 200) {
	                    			throw new RuntimeException("Failed : HTTP error code :" + myresponse77.getStatus());
	                    		}
	                    		String output77 = myresponse77.getEntity(String.class);
	                    		out.write("<script>alert(\""+ output77 + "\")</script>");
	                		}
                    	%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Edit Theater</p>
                    <br>
                    <%! String outputZ4 = ""; 
                    	int theaterID = 0, currSpots=0;
					%>
						<% 
	                    	if(request.getParameter("selectTheater") != null){
	            
	                    		String tID = request.getParameter("stID");
	                    		theaterID = Integer.valueOf(tID);
	                    		Client clientZ0 = Client.create();
	            				WebResource webResourceZ0 = clientZ0.resource("http://localhost:8080/CINEThisio/rest/AdminService/theater/"+tID);
	            				ClientResponse myresponseZ0 = webResourceZ0.accept("text/plain").get(ClientResponse.class);
	            				currSpots = Integer.valueOf(myresponseZ0.getEntity(String.class));
	            				
	                    		%> 
	                    		<form method="post" id="editTheater">
	                    			<input type="hidden" name="editTheaterID" id="editTheaterID" value="<%= theaterID %>">
	                    			<label for="editTotalSpots">Edit the capacity of the theater </label>
 									<input type="number" min="50" max="500" name="editTotalSpots" id="editTotalSpots" value="<%=currSpots%>" required>
 									<br><br><br>
									<button type="submit" name="editTheater" id="editTheater">Edit Theater</button>
								</form>
	                    		
	                    		<%
	                    		
	                    	} else {
	                    		%>
	                    		<form id="selTheater" method="POST">
									<label for="stID">Επιλογή αίθουσας</label>
									<% 
									Client clientZ4 = Client.create();
									WebResource webResourceZ4 = clientZ4.resource("http://localhost:8080/CINEThisio/rest/AdminService/selectTheater/");
		            				ClientResponse myresponseZ4 = webResourceZ4.accept("text/plain").get(ClientResponse.class);
		            				outputZ4 = myresponseZ4.getEntity(String.class);
									%>
									<%= outputZ4  %>
									<button type="submit" name="selectTheater" id="selectTheater">Select theater</button>
								</form>	
	                    		<%
	                    	}
							if(request.getParameter("editTheater") != null){
	                			String ttID = request.getParameter("editTheaterID");
	                			String ttSpots = request.getParameter("editTotalSpots");
	                    		
	                    		Client clientZ3 = Client.create();
	                    		WebResource webResourceZ3 = clientZ3.resource("http://localhost:8080/CINEThisio/rest/AdminService/theater/"+ttID+"/"+ttSpots);
	                    		ClientResponse myresponseZ3 = webResourceZ3.accept("text/plain").put(ClientResponse.class);
	
	                    		if (myresponseZ3.getStatus() != 200) {
	                    			throw new RuntimeException("Failed : HTTP error code :" + myresponseZ3.getStatus());
	                    		}
	                    		String outputZ3 = myresponseZ3.getEntity(String.class);
	                    		out.write("<script>alert(\""+ outputZ3 + "\")</script>");
	                		}
                    	%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Edit Schedule</p>
                    <%! String outputV4=""; %>
					<% 
                   	if(request.getParameter("selectSchedule") != null){
           
                   		String sID = request.getParameter("ssID");
                   		int scheduleID = Integer.valueOf(sID);
                   		Client clientA0 = Client.create();
           				WebResource webResourceA0 = clientA0.resource("http://localhost:8080/CINEThisio/rest/AdminService/schedule/"+sID+"/"+"d");
           				ClientResponse myresponseA0 = webResourceA0.accept("text/plain").get(ClientResponse.class);
           				String date = myresponseA0.getEntity(String.class);
           				Client clientA1 = Client.create();
           				WebResource webResourceA1 = clientA1.resource("http://localhost:8080/CINEThisio/rest/AdminService/schedule/"+sID+"/"+"m");
           				ClientResponse myresponseA1 = webResourceA1.accept("text/plain").get(ClientResponse.class);
           				int movieUP = Integer.valueOf(myresponseA1.getEntity(String.class));
                   		%> 
                   		<form method="post" id="editSchedule">
                   			<input type="hidden" name="editScheduleID" id="editScheduleID" value="<%= scheduleID %>">
                   			<label for="editDate">Edit the air date of selected schedule </label>
							<input type="datetime-local" name="editDate" id="editDate" value="<%=date%>" autocomplete="on">
							<br>
							<input type="checkbox" id="editMovieUp" name="editMovieUp" value="1">
  							<label for="editMovieUP">Η ταινία είναι διαθέσιμη για το κοινό</label><br>
							<button type="submit" name="editSchedule" id="editSchedule">Edit Schedule</button>
						</form>
                   		
                   		<%
                   		
                   	} else {
                   		%>
                   		<form id="selSchedule" method="POST">
							<label for="ssID">Επιλογή προγράμματος</label>
							<% 
							Client clientV4 = Client.create();
							WebResource webResourceV4 = clientV4.resource("http://localhost:8080/CINEThisio/rest/AdminService/selectSchedule/");
            				ClientResponse myresponseV4 = webResourceV4.accept("text/plain").get(ClientResponse.class);
            				outputV4 = myresponseV4.getEntity(String.class);
							%>
							<%= outputV4  %>
							<button type="submit" name="selectSchedule" id="selectSchedule">Select Schedule</button>
						</form>	
                   		<%
                   	}
					if(request.getParameter("editSchedule") != null){
						String ssID = request.getParameter("editScheduleID");
                		String editDate = request.getParameter("editDate");
                		editDate = editDate+":00";
                		editDate = editDate.replace(":", "%3A");
                		
            			String editMovieUp = "0";
                		if(request.getParameter("editMovieUp") != null){
                			editMovieUp = request.getParameter("editMovieUp");
                		}
                		
                		Client clientZ3 = Client.create();
                		WebResource webResourceZ3 = clientZ3.resource("http://localhost:8080/CINEThisio/rest/AdminService/schedule/"+ssID+"/"+editDate+"/"+editMovieUp);
                		ClientResponse myresponseZ3 = webResourceZ3.accept("text/plain").put(ClientResponse.class);

                		if (myresponseZ3.getStatus() != 200) {
                			throw new RuntimeException("Failed : HTTP error code :" + myresponseZ3.getStatus());
                		}
                		String outputZ3 = myresponseZ3.getEntity(String.class);
                		out.write("<script>alert(\""+ outputZ3 + "\")</script>");
            		}
					%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row mt-4">
      <div class="col-lg-12">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Schedule</p>
                    <br>
                    <%! String schedule = ""; %>

               		<form method="post" id="selDate">
               			<input type="date" name="sDate" id="sDate" required>
               			<button type="submit" name="getSchedule" id="getSchedule">Get Schedule</button>
               		</form>
                    	
                   	<% 
                    if(request.getParameter("getSchedule") != null){
                		String dateOfAir = request.getParameter("sDate");
                		Client clientT6 = Client.create();
                		WebResource webResourceT6 = clientT6.resource("http://localhost:8080/CINEThisio/rest/TicketService/schedule/"+dateOfAir+"/A");
                		ClientResponse myresponseT6 = webResourceT6.accept("text/plain").get(ClientResponse.class);
						if (myresponseT6.getStatus() != 200) {
                			throw new RuntimeException("Failed : HTTP error code :" + myresponseT6.getStatus());
                		}
                		schedule = myresponseT6.getEntity(String.class);
                	} 
                    %>
                    <%= schedule %>
                 	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
					<script>
					$('selDate').submit(function(e) {
					    e.preventDefault();
					    $.post('adminIndex.jsp', $('selDate').serialize());
					});
					</script>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


    </div>
  </main>


  <!--   Core JS Files   -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
  
</body>

</html>