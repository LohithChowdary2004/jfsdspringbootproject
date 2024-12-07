<%@page import="com.klef.jfsd.omsvc.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Update Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: teal;
            color: #333333;
            padding: 20px;
        }
        h3 {
            text-align: center;
            color: #333333;
        }
        .form-container {
            margin: 20px auto;
            padding: 15px;
            max-width: 500px;
        }
        table {
            width: 100%;
            border-spacing: 10px;
        }
        input[type="text"], input[type="date"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #fff;
            color: #333333;
        }
        label {
            color: #333333;
        }
        input[type="submit"], input[type="reset"] {
            background-color: yellow;
            color: black;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: yellow;
            color: #333333;
        }
        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="patientnavbar.jsp" %>
    <h3><u>Update Patient Profile</u></h3>
    <div class="form-container">
        <form method="post" action="updatep">
            <table>
                <tr>
                    <td><label for="id">Enter ID</label></td>
                    <td><input type="number" id="id" name="id" value="<%=p.getId() %>" readonly="readonly" required/></td>
                </tr>
                <tr>
                    <td><label for="name">Enter Name</label></td>
                    <td><input type="text" id="name" name="name" value="<%=p.getName() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Enter Email</label></td>
                    <td><input type="email" id="email" name="email" value="<%=p.getEmail() %>" readonly required/></td>
                </tr>
                <tr>
                    <td><label for="contact">Enter Contact</label></td>
                    <td><input type="text" id="contact" name="contact" value="<%=p.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="dob">Enter Date of Birth</label></td>
                    <td><input type="date" id="dob" name="dob" value="<%=p.getDateOfBirth() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="gender">Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="gender" value="MALE" <%= p.getGender().equals("MALE") ? "checked" : "" %> required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="FEMALE" <%= p.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="gender" value="OTHERS" <%= p.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="password">Enter Password</label></td>
                    <td><input type="password" id="password" name="password" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
