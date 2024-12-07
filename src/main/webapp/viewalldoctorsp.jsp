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
<%@include file="patientnavbar.jsp" %>
    <h3 style="text-align: center;"><u>Doctors</u></h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>SPECIALIZATION</th>
            <th>EXPERIENCE (Years)</th>
            <th>CONSULTATION FEE</th>
        </tr>
        <c:forEach items="${doctorList}" var="doctor">
            <tr>
                <td><c:out value="${doctor.id}"/></td>
                <td><c:out value="${doctor.name}"/></td>
                <td><c:out value="${doctor.gender}"/></td>
                <td><c:out value="${doctor.dateOfBirth}"/></td>
                <td><c:out value="${doctor.specialization}"/></td>
                <td><c:out value="${doctor.experienceYears}"/></td>
                <td><c:out value="${doctor.consultationFee}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
