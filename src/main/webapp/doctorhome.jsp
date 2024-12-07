<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.omsvc.model.Doctor"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
    Doctor d = (Doctor) session.getAttribute("doc"); // Using "doc" for the session variable 
    if (d == null) {
        response.sendRedirect("doctorsessionfail");
        return;
    }
%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: teal; /* Teal background */
        color: coral; /* Coral color text */
        padding: 20px;
    }
    ol {
        padding-left: 20px;
        color: coral; /* Coral color for list text */
    }
    ol li {
        margin-bottom: 5px;
    }
    h1 {
        text-align: center;
        color: black; /* Yellow color for the heading */
    }
</style>

</head>
<body>
    <h1>Doctor Home</h1>

    
    <%@include file="doctornavbar.jsp" %>
</body>
</html>
