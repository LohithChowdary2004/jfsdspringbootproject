<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.omsvc.model.Admin"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    Admin a = (Admin) session.getAttribute("ad"); // Using "ad" as the session variable
    if (a == null) {
        response.sendRedirect("adminsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Doctors</title>
    <style>
        table {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
            table-layout: auto;
            background-color: #fff;
        }

        table, th, td {
            border: 2px solid black;
        }

        th, td {
            padding: 10px;
            text-align: center;
            word-wrap: break-word;
        }

        th {
            background-color: black;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
    <h3 style="text-align: center;"><u>View All Doctors</u></h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
            <th>SPECIALIZATION</th>
            <th>EXPERIENCE (Years)</th>
            <th>QUALIFICATION</th>
            <th>CONSULTATION FEE</th>
            <th>PASSWORD </th>
        </tr>
        <c:forEach items="${doctorList}" var="doctor">
            <tr>
                <td><c:out value="${doctor.id}"/></td>
                <td><c:out value="${doctor.name}"/></td>
                <td><c:out value="${doctor.gender}"/></td>
                <td><c:out value="${doctor.dateOfBirth}"/></td>
                <td><c:out value="${doctor.email}"/></td>
                <td><c:out value="${doctor.contact}"/></td>
                <td><c:out value="${doctor.specialization}"/></td>
                <td><c:out value="${doctor.experienceYears}"/></td>
                <td><c:out value="${doctor.qualification}"/></td>
                <td><c:out value="${doctor.consultationFee}"/></td>
                <td><c:out value="${doctor.password}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
