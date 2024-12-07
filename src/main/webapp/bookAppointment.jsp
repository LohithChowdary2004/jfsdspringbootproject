<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.klef.jfsd.omsvc.model.Patient" %>

<%
    Patient p = (Patient) session.getAttribute("pa"); // Retrieve the "pa" session attribute

    if (p == null) { // If no patient is logged in, redirect to the session fail page
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
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            margin-bottom: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input, select, textarea, button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        button {
            background-color: #0077b6;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005f8c;
        }

        a {
            text-decoration: none;
            color: #0077b6;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="patientnavbar.jsp" %> <!-- Include the patient navbar -->

    <h2>Book an Appointment</h2>

    <form action="bappointment" method="post">
        <div>
            <label for="patient_id">Patient ID:</label>
            <input type="number" id="patient_id" name="patient_id" value="<%= p.getId() %>" readonly>
        </div>
        
        <div>
            <label for="doctor_id">Doctor:</label>
            <select id="doctor_id" name="doctor_id" required>
                <option value="">Select a Doctor</option>
                <c:forEach var="doctor" items="${doctors}">
                    <option value="${doctor.id}">${doctor.name} - ${doctor.specialization}</option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label for="appointment_date">Appointment Date:</label>
            <input type="date" id="appointment_date" name="appointment_date" required>
        </div>

        <div>
            <label for="appointment_time">Appointment Time:</label>
            <input type="time" id="appointment_time" name="appointment_time" required>
        </div>

        <div>
            <label for="problem">Problem/Description:</label>
            <textarea id="problem" name="problem" rows="4" required></textarea>
        </div>

        <div>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>
        </div>

        <button type="submit" value="submit">Book Appointment</button>
    </form>

    
</body>
</html>
