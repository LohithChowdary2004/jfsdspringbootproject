<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.omsvc.model.Doctor"%>

<%
    Doctor d = (Doctor) request.getAttribute("doctorDetails");
    if (d == null) {
        response.sendRedirect("viewalldoctors");
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
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
        }
        table {
            width: 100%;
        }
        input[type="text"], input[type="email"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
        }
        input[type="submit"] {
            background-color: yellow;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[readonly] {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h3>Update Doctor</h3>
        <form method="post" action="updateDoctor">
            <input type="hidden" name="id" value="<%= d.getId() %>"/>

            <label>Name</label>
            <input type="text" name="name" value="<%= d.getName() %>" required/>

            <label>Email (Read Only)</label>
            <input type="email" name="email" value="<%= d.getEmail() %>" readonly/>

            <label>Specialization</label>
            <input type="text" name="specialization" value="<%= d.getSpecialization() %>" required/>

            <label>Experience (Years)</label>
            <input type="number" name="experienceYears" value="<%= d.getExperienceYears() %>" required/>

            <label>Qualification</label>
            <input type="text" name="qualification" value="<%= d.getQualification() %>" required/>

            <label>Consultation Fee</label>
            <input type="number" name="consultationFee" value="<%= d.getConsultationFee() %>" required/>

            <label>Password</label><br/>
            <input type="password" name="password" value="<%= d.getPassword() %>" required/><br/>

            <label>Contact</label><br/>
            <input type="text" name="contact" value="<%= d.getContact() %>" required/>

            <label>Date of Birth</label>
            <input type="date" name="dob" value="<%= d.getDateOfBirth() != null ? d.getDateOfBirth().toString() : "" %>" required/>

            <label>Gender</label>
            <input type="text" name="gender" value="<%= d.getGender() %>" required/>

            <label>Consultation Fee</label>
            <input type="number" name="consultationFee" value="<%= d.getConsultationFee() %>" required/>

            <input type="submit" value="Update"/>
        </form>
    </div>
</body>
</html>
