<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.klef.jfsd.omsvc.model.Patient"%>

<%
    Patient p = (Patient) session.getAttribute("pa"); // Retrieve the "pa" session attribute

    if (p == null) { // If no patient is logged in, redirect to the session fail page
        response.sendRedirect("patientsessionfail");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Appointment Response</title>
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

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        span {
            color: gray;
            font-style: italic;
        }
    </style>
</head>
<body>
<%@include file="patientnavbar.jsp" %>
    <h1>Patient Appointment Details</h1>

    <table>
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Doctor ID</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
                <th>Problem</th>
                <th>Status</th>
                <th>Response</th>
            </tr>
        </thead>
        <tbody>
            <!-- Assuming you have a list of appointments for the patient -->
            <c:forEach var="appointment" items="${appointments}">
                <tr>
                    <td>${appointment.appointmentId}</td>
                    <td>${appointment.doctorId}</td>
                    <td>${appointment.appointmentDate}</td>
                    <td>${appointment.appointmentTime}</td>
                    <td>${appointment.problem}</td>
                    <td>${appointment.status}</td>
                    <td>
                        <c:if test="${not empty appointment.response}">
                            ${appointment.response} <!-- If the doctor has given a response -->
                        </c:if>
                        <c:if test="${empty appointment.response}">
                            <span>No response yet</span> <!-- If no response from doctor -->
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
