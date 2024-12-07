<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.omsvc.model.Patient"%>
<% 
    Patient p = (Patient) session.getAttribute("pa");  // Retrieve the "pa" session attribute

    if (p == null) {  // If no patient is logged in, redirect to the session fail page
        response.sendRedirect("patientsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments</title>
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

        h2 {
            text-align: center;
            margin-top: 20px;
            font-size: 24px;
            color: #333;
            text-decoration: underline;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
    </style>
</head>
<body>
    <%@include file="patientnavbar.jsp" %> <!-- Include the patient navbar -->
    <h2>My Appointments</h2>
    <table>
        <thead>
            <tr>
                <th>Doctor</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
                <th>Problem</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="appointment" items="${appointments}">
                <tr>
                    <td>${appointment.doctorId}</td> <!-- Display doctor's ID as per your logic -->
                    <td>${appointment.appointmentDate}</td>
                    <td>${appointment.appointmentTime}</td>
                    <td>${appointment.problem}</td>
                    <td>${appointment.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
