<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Navbar</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin-left: 200px; /* Space for the fixed navbar on the left */
        background-color: #f4f4f9;
        color: #333;
    }
    .navbar {
        background: linear-gradient(180deg, #0077b6, #00b4d8); /* Gradient background */
        padding: 20px 0;
        position: fixed;
        left: 0;
        top: 0;
        height: 100%;
        width: 200px;
        text-align: left;
        box-shadow: 2px 0 5px rgba(0,0,0,0.1); /* Subtle shadow */
    }
    .navbar a {
        text-decoration: none;
        color: #fff;
        display: block;
        padding: 15px 20px;
        font-weight: 500;
        border-radius: 5px;
        margin: 10px;
        transition: background 0.3s, transform 0.3s; /* Smooth hover effect */
    }
    .navbar a:hover {
        background: #0096c7;
        transform: scale(1.05); /* Slight zoom on hover */
    }
    .navbar a.active {
        background: #00b4d8;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="navbar">
    <a href="adminhome" class="active">Admin Home</a>
    <a href="doctorreg">Add Doctor</a>
    <a href="viewalldoctors">View Doctors</a>
    <a href="updatedoctors">Update Doctor</a>
    <a href="deletedoctor">Delete Doctor</a>
    <a href="viewallpatientsadmin">View Patients</a>

    <a href="adminlogout">Logout</a>
</div>

</body>
</html>
