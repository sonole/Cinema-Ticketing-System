<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sun.jersey.api.client.Client" %>
<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import="com.sun.jersey.api.client.WebResource" %>
<%! String username = ""; %>
<%
	String username = (String)session.getAttribute("username");
	if(username != null) {
		%> 
		<button class="open-button" onclick="openForm()">Chat</button>
		<div class="chat-popup" id="myForm">
		  <form method="post" class="form-container">
		  	    <button type="button" class="btn old" onclick="openOld()">Open old chat</button>
		   		<button type="button" class="btn"  onclick="openMain()" >Create New Chat</button>
		    	<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
			    <%! String msgs=""; %>
			    <%! Integer chatID=0; %>
			    <!-- --------- -->
				<!-- CHAT MAIN -->
				<!-- --------- -->
			    <div style="display:none;" id="chatMain">
			    <h1>Chat w/ admin</h1>
			    <%! String selectAdmin=""; %>
			    <%! // String sysadmin =""; %>
				<%
				Client client40 = Client.create();
				WebResource webResource40 = client40.resource("http://localhost:8080/CINEThisio/rest/ChatService/admins"); 
				ClientResponse myresponse40 = webResource40.accept("text/plain").get(ClientResponse.class);
				
				if (myresponse40.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code :" + myresponse40.getStatus());
				}
				selectAdmin = myresponse40.getEntity(String.class);
				%>
				<%= selectAdmin %>
				
			    <label for="msg"><b>Message</b></label>
			    <textarea placeholder="Type message.." name="msg" id="msg"></textarea>
			    <button type="submit" class="btn" name="createChat" id="createChat" onclick="document.getElementById('actualChat').style.display = 'block';">Send MSG</button>
				<%
				
				if(request.getParameter("createChat") != null){
					
					String sysadmin = request.getParameter("sysadmin");
					String msg = request.getParameter("msg");
					msg = msg.replace(" ", "%20");
					Client client50 = Client.create();
					WebResource webResource50 = client50.resource("http://localhost:8080/CINEThisio/rest/ChatService/pushMessage/0/U/"+username+"/"+sysadmin+"/"+msg);
					ClientResponse myresponse50 = webResource50.accept("text/plain").post(ClientResponse.class);
					
					if (myresponse50.getStatus() != 200) {
						throw new RuntimeException("Failed : HTTP error code :" + myresponse50.getStatus());
					}
					String output50 = myresponse50.getEntity(String.class);
					
					
					if(output50.equals("ERROR")) {
						msgs = "Message was not send";	
						%><%= msgs %><%
					} else {
						Client client70 = Client.create();
						WebResource webResource70 = client70.resource("http://localhost:8080/CINEThisio/rest/ChatService/openChat/"+username+"/"+sysadmin); 
						ClientResponse myresponse70 = webResource70.accept("text/plain").get(ClientResponse.class);
						if (myresponse70.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse70.getStatus());
						}
						chatID = Integer.valueOf(myresponse70.getEntity(String.class));
						%><script type="text/javascript">openChat();</script>;<%
					}
				}
				%>
				</div>
				
				<!-- -------------- -->
				<!-- OLD CHAT ROOMS -->
				<!-- -------------- -->
				<div style="display:none;" id="oldChatRooms">
			    <h1>Existing chat rooms w/ admins</h1>
			   	<%! String selectAdmin2 =""; %>
				<%
				Client client66 = Client.create();
				WebResource webResource66 = client66.resource("http://localhost:8080/CINEThisio/rest/ChatService/admins2"); 
				ClientResponse myresponse66 = webResource66.accept("text/plain").get(ClientResponse.class);
				
				if (myresponse66.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code :" + myresponse66.getStatus());
				}
				selectAdmin2 = myresponse66.getEntity(String.class);
				%>
				<%= selectAdmin2 %>
		
				<br><br>
				<button type="submit" class="btn" name="openOldChat" id="openOldChat" >Open chat</button>
				<br>
				</div>
		    
		  </form>
		</div>
		
		
				<!-- ------------ -->
				<!--  ACTUAL CHAT -->
				<!-- ------------ -->
				<div class="chat-popup" id="actualChat">
				<form class="form-container" method="post" id="respond">
				<%! String admin=""; %>
				<%! String sysadmin=""; %>
			    <h1>Chat <%= admin %></h1>
			    <hr>
				    <div style="max-height:400px; overflow-x: hidden;overflow-y: auto;">
					<%
					String sysadmin = "";
					if(request.getParameter("sysadmin2") != null && !request.getParameter("sysadmin2").equals("")){
						%><script type="text/javascript">
							document.getElementById("actualChat").style.display = "block";
						</script><%
						sysadmin = request.getParameter("sysadmin2");
						admin = "with: "+sysadmin;
						Client client80 = Client.create();
						WebResource webResource80 = client80.resource("http://localhost:8080/CINEThisio/rest/ChatService/openChat/"+username+"/"+sysadmin); 
						ClientResponse myresponse80 = webResource80.accept("text/plain").get(ClientResponse.class);
						if (myresponse80.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse80.getStatus());
						}
						
						chatID = Integer.valueOf(myresponse80.getEntity(String.class));
					} else if(request.getParameter("sysadmin") != null && !request.getParameter("sysadmin").equals("")){
						%><script type="text/javascript">
						document.getElementById("actualChat").style.display = "block";
						</script><%
						sysadmin = request.getParameter("sysadmin");
						admin = "with: "+sysadmin;
						Client client80 = Client.create();
						WebResource webResource80 = client80.resource("http://localhost:8080/CINEThisio/rest/ChatService/openChat/"+username+"/"+sysadmin); 
						ClientResponse myresponse80 = webResource80.accept("text/plain").get(ClientResponse.class);
						if (myresponse80.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse80.getStatus());
						}
						chatID = Integer.valueOf(myresponse80.getEntity(String.class));
					} else {
						msgs="You have first to create a chat with this admin!";
					}
					if ( chatID > 0){
						Client client60 = Client.create();
						WebResource webResource60 = client60.resource("http://localhost:8080/CINEThisio/rest/ChatService/chat/"+chatID); 
						ClientResponse myresponse60 = webResource60.accept("text/plain").get(ClientResponse.class);
						
						if (myresponse60.getStatus() != 200) {
							throw new RuntimeException("Failed : HTTP error code :" + myresponse60.getStatus());
						}
						msgs = myresponse60.getEntity(String.class);
					} else {
						msgs="You have first to create a chat with this admin!";
					}
					%>
					<%= msgs %>
				    </div>
				   
		        <% if(chatID > 0){
		       		 %> 
		       		<input type="hidden" value="<%=sysadmin %>" name="sysadmin3" id="sysadmin3"></input>
		       		<input style="float:left;width:75%;color:white;" type="text" name="rsp" id="rsp" placeholder="Type a message to respond.."></input>
		       		<button style="float:right;width:25%;" name="rsp-btn" id="rsp-btn" type="submit">Send</button>
		       		<% 
		       		}
		       	%>
		
		         <% 
		         	if(request.getParameter("rsp-btn") != null){
		     			String msg = request.getParameter("rsp");
		     			String sysadmin3 =request.getParameter("sysadmin3");
		     			msg = msg.replace(" ", "%20");
		     			Client client50 = Client.create();	
		     			//String link = "http://localhost:8080/CINEThisio/rest/ChatService/pushMessage/"+chatID+"/U/"+username+"/"+sysadmin3+"/"+msg;
		     			//System.out.println(link);
		     			WebResource webResource50 = client50.resource("http://localhost:8080/CINEThisio/rest/ChatService/pushMessage/"+chatID+"/U/"+username+"/"+sysadmin3+"/"+msg);
		     			ClientResponse myresponse50 = webResource50.accept("text/plain").post(ClientResponse.class);
		     			
		     			if (myresponse50.getStatus() != 200) {
		     				throw new RuntimeException("Failed : HTTP error code :" + myresponse50.getStatus());
		     			}
		     			String output50 = myresponse50.getEntity(String.class);
		         	}
		         %>
		         <button type="button" class="btn cancel" name="closeChat" id="closeChat" onclick="document.getElementById('actualChat').style.display = 'none';">Close chat</button>
		         </form>
			    </div>
		
		<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}
		function closeForm(){
			closeMain();
			closeChat();
			closeOld();
			document.getElementById("myForm").style.display = "none";
		}
		function openMain() {
		  closeOld();
		  closeChat();
		  document.getElementById("chatMain").style.display = "block";
		}
		
		function closeMain() {
		  document.getElementById("chatMain").style.display = "none";
		}
		function openOld() {
			closeMain();
			closeChat();
			document.getElementById("oldChatRooms").style.display = "block";
		}
		function closeOld() {
			  document.getElementById("oldChatRooms").style.display = "none";
		}
		function openChat() {
			closeMain();
			closeOld();
			document.getElementById("actualChat").style.display = "block";
		}
		function closeChat() {
			  document.getElementById("actualChat").style.display = "none";
		}
		
		</script>
		
		
		
		<%
	}
%>
