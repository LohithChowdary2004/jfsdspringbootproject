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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .registration-form {
            background-color: #fff;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #0077b6;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="number"],
        select,
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #0077b6;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #005f8d;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        select:focus {
            outline: none;
            border-color: #0077b6;
        }
        .form-group input[type="submit"] {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
<div class="registration-form">
    <h2>Doctor Registration</h2>
    <form action="adddoctor" method="post">
        <div class="form-group">
            <label for="dname">Name:</label>
            <input type="text" id="dname" name="dname" required>
        </div>
        <div class="form-group">
            <label for="demail">Email:</label>
            <input type="email" id="demail" name="demail" required>
        </div>
        <div class="form-group">
            <label for="dpassword">Password:</label>
            <input type="password" id="dpassword" name="dpassword" required>
        </div>
        <div class="form-group">
            <label for="dcontact">Contact:</label>
            <input type="text" id="dcontact" name="dcontact" required>
        </div>
        <div class="form-group">
            <label for="dspecialization">Specialization:</label>
            <input type="text" id="dspecialization" name="dspecialization" required>
        </div>
        <div class="form-group">
            <label for="dexperienceYears">Experience (Years):</label>
            <input type="number" id="dexperienceYears" name="dexperienceYears" required>
        </div>
        <div class="form-group">
            <label for="dqualification">Qualification:</label>
            <input type="text" id="dqualification" name="dqualification" required>
        </div>
        <div class="form-group">
            <label for="ddateOfBirth">Date of Birth:</label>
            <input type="date" id="ddateOfBirth" name="ddateOfBirth" required>
        </div>
        <div class="form-group">
            <label for="dgender">Gender:</label>
            <select id="dgender" name="dgender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="dconsultationFee">Consultation Fee:</label>
            <input type="number" step="0.01" id="dconsultationFee" name="dconsultationFee" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Register Doctor">
        </div>
    </form>
</div>

</body>
</html>
