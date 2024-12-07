<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.omsvc.model.Doctor"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


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
    <title>View All Patients</title>
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
<%@include file="doctornavbar.jsp" %>
    <h3 style="text-align: center;"><u>View All Patients</u></h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
        </tr>
        <c:forEach items="${patientList}" var="patient">
            <tr>
                <td><c:out value="${patient.id}"/></td>
                <td><c:out value="${patient.name}"/></td>
                <td><c:out value="${patient.gender}"/></td>
                <td><c:out value="${patient.dateOfBirth}"/></td>
                <td><c:out value="${patient.email}"/></td>
                <td><c:out value="${patient.contact}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
