<%@page import="com.klef.jfsd.omsvc.model.Doctor"%>
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
    <title>Update Doctor</title>
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
        input[type="text"], input[type="date"], input[type="number"], input[type="email"], input[type="password"], select {
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
  <%@include file="doctornavbar.jsp" %>
    <h3><u>Update Doctor Profile</u></h3>
    <div class="form-container">
        <form method="post" action="update">
            <table>
                <tr>
                    <td><label for="id">Enter ID</label></td>
                    <td><input type="number" id="id" name="id" value="<%=d.getId() %>" readonly="readonly" required/></td>
                </tr>
                <tr>
                    <td><label for="name">Enter Name</label></td>
                    <td><input type="text" id="name" name="name" value="<%=d.getName() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Enter Email</label></td>
                    <td><input type="email" id="email" name="email" value="<%=d.getEmail() %>" readonly required/></td>
                </tr>
                <tr>
                    <td><label for="contact">Enter Contact</label></td>
                    <td><input type="text" id="contact" name="contact" value="<%=d.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="specialization">Enter Specialization</label></td>
                    <td><input type="text" id="specialization" name="specialization" value="<%=d.getSpecialization() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="experienceYears">Enter Years of Experience</label></td>
                    <td><input type="number" id="experienceYears" name="experienceYears" value="<%=d.getExperienceYears() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="qualification">Enter Qualification</label></td>
                    <td><input type="text" id="qualification" name="qualification" value="<%=d.getQualification() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="dob">Enter Date of Birth</label></td>
                    <td><input type="date" id="dob" name="dob" value="<%=d.getDateOfBirth() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="gender">Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="gender" value="MALE" <%= d.getGender().equals("MALE") ? "checked" : "" %> required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="FEMALE" <%= d.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="gender" value="OTHERS" <%= d.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="consultationFee">Enter Consultation Fee</label></td>
                    <td><input type="number" id="consultationFee" name="consultationFee" step="0.01" value="<%=d.getConsultationFee() %>" required/></td>
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
