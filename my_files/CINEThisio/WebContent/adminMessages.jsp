<jsp:include page="assets/includes/loginUserProcess.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sun.jersey.api.client.Client" %>
<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import="com.sun.jersey.api.client.WebResource" %>
<%@ page import="com.sun.jersey.api.client.GenericType"%>
<%! String sysadmin = "";%>
<%  sysadmin = (String)session.getAttribute("username");  %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin Messages</title>
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
          <a class="nav-link" href="${pageContext.request.contextPath}/adminIndex.jsp">
            <i class="fas fa-cogs"></i>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  active" href="${pageContext.request.contextPath}/adminMessages.jsp">
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
          <h6 class="font-weight-bolder mb-0">Messages</h6>
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
        <div class="col-lg-5">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold">Select User to open chat</p>
	
                    <%
                    	String out1="";
                    	Client client90 = Client.create();
    					WebResource webResource90 = client90.resource("http://localhost:8080/CINEThisio/rest/ChatService/adminMsgList/"+sysadmin); 
    					ClientResponse myresponse90 = webResource90.accept("text/plain").get(ClientResponse.class);
    					if (myresponse90.getStatus() != 200) {
    						throw new RuntimeException("Failed : HTTP error code :" + myresponse90.getStatus());
    					}
    					out1 = myresponse90.getEntity(String.class);
    					
                    %>
                    <%= out1 %>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <p class="mb-1 pt-2 text-bold"></p>
                    <div style="max-height:500px; overflow-x: hidden;overflow-y: auto;">
                    <%! String user =""; %>
                    <%! int chatID = 0; %>
                    <%
                    	String chat ="select user";
                    	if(request.getParameter("selChat") != null) {
                    		user = request.getParameter("selChat");
                    		Client client69 = Client.create();
            				WebResource webResource69 = client69.resource("http://localhost:8080/CINEThisio/rest/ChatService/openChat/"+user+"/"+sysadmin); 
            				ClientResponse myresponse69 = webResource69.accept("text/plain").get(ClientResponse.class);
            				if (myresponse69.getStatus() != 200) {
            					throw new RuntimeException("Failed : HTTP error code :" + myresponse69.getStatus());
            				}
            				chatID = Integer.valueOf(myresponse69.getEntity(String.class));
            				if ( chatID > 0){
            					Client client77 = Client.create();
            					WebResource webResource77 = client77.resource("http://localhost:8080/CINEThisio/rest/ChatService/chat/"+chatID); 
            					ClientResponse myresponse77 = webResource77.accept("text/plain").get(ClientResponse.class);
            					
            					if (myresponse77.getStatus() != 200) {
            						throw new RuntimeException("Failed : HTTP error code :" + myresponse77.getStatus());
            					}
            					chat = myresponse77.getEntity(String.class);
            				}
                    	}
                    %>
                    <%= chat %>
                    </div>
                    <br>
                    <% if(chatID > 0){
                    	%> 
        	    	     <form method="post" id="respond">
                    		<input style="float:left;width:80%;" type="text" name="rsp" id="rsp" placeholder="Type a message to respond.."></input>
                    		<button style="float:right;width:15%;" name="rsp-btn" id="rsp-btn" type="submit">Send</button>
                   		 </form>
                    	<%
                    }%>

                    <% 
                    	if(request.getParameter("rsp-btn") != null){
                			String msg = request.getParameter("rsp");
                			msg = msg.replace(" ", "%20");
                			Client client50 = Client.create();
                			WebResource webResource50 = client50.resource("http://localhost:8080/CINEThisio/rest/ChatService/pushMessage/"+chatID+"/A/"+user+"/"+sysadmin+"/"+msg);
                			ClientResponse myresponse50 = webResource50.accept("text/plain").post(ClientResponse.class);
                			
                			if (myresponse50.getStatus() != 200) {
                				throw new RuntimeException("Failed : HTTP error code :" + myresponse50.getStatus());
                			}
                			String output50 = myresponse50.getEntity(String.class);
                    	}
                    %>
                  </div>
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