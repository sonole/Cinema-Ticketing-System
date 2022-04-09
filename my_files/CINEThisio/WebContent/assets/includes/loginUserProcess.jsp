<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String username = (String)session.getAttribute("username");
	if (username == null)										//Αμα δεν έχει γίνει set αυτη η ver τότε access denied
	{
		%><jsp:forward page="../../LoginSignup.jsp"/><%	
	} else {												//Σε διαφορετική περίπτωση ο χρήστης υπάρχει στην DB
		//out.println(" <h1>You have successfully created the Session of User : " +username+"</h1>");
		%><!-- <a href="${pageContext.request.contextPath}/assets/includes/logout.jsp">Logout</a>  --><%					//Logout button
	}
%>