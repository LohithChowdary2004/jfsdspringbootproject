<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.omsvc.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 
   
    Patient p = (Patient) session.getAttribute("pa");  // Retrieve the "p" session attribute

    if (p == null) {  // If no patient is logged in, redirect to the session fail page
        response.sendRedirect("patientsessionfail");
        return;
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Home</title>
</head>
<body>

<%@include file="patientnavbar.jsp" %>
</body>
</html>