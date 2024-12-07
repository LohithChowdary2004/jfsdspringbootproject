<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.jfsd.omsvc.model.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Appointments</title>
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

        textarea {
            width: 90%;
            max-width: 300px;
            margin: 5px 0;
            padding: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #0077b6;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005f8a;
        }
    </style>
</head>
<body>
<%@include file="doctornavbar.jsp" %>
    <h1 style="text-align: center;">Appointments</h1>
    <table>
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>Age</th>
                <th>Problem</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
                <th>Status</th>
                <th>Response</th> <!-- New Column for Response -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="appointment" items="${appointmentsWithPatients}">
                <tr>
                    <td>${appointment.patientId}</td> <!-- Patient ID -->
                    <td>${appointment.age}</td>
                    <td>${appointment.problem}</td>
                    <td>${appointment.appointmentDate}</td>
                    <td>${appointment.appointmentTime}</td>
                    <td>${appointment.status}</td>
                    <td>
                        <!-- Add a form for the doctor to enter a response -->
                        <form action="respondToAppointment" method="post">
                            <textarea name="response" rows="3" placeholder="Enter your response here..."></textarea><br>
                            <input type="hidden" name="appointmentId" value="${appointment.appointmentId}"> <!-- Hidden appointmentId -->
                            <input type="submit" value="Submit Response">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
