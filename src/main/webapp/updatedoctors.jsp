<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.omsvc.model.Admin"%>

<%
    Admin a = (Admin) session.getAttribute("ad");
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
            background-color: #fff;
        }
        table, th, td {
            border: 2px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: black;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <h3 style="text-align: center;"><u>View All Doctors</u></h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Specialization</th>
            <th>Experience</th>
            <th>Qualification</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${doctorList}" var="doctor">
            <tr>
                <td><c:out value="${doctor.id}"/></td>
                <td><c:out value="${doctor.name}"/></td>
                <td><c:out value="${doctor.email}"/></td>
                <td><c:out value="${doctor.specialization}"/></td>
                <td><c:out value="${doctor.experienceYears}"/></td>
                <td><c:out value="${doctor.qualification}"/></td>
                <td>
                    <form method="post" action="loadDoctorDetails">
                        <input type="hidden" name="doctorId" value="${doctor.id}"/>
                        <input type="submit" value="Update"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
