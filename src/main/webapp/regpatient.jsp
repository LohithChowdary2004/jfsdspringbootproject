<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
    <style>
        /* Body and background styling */
        body {
            background: linear-gradient(180deg, #00b4d8, #e0f7fa); /* Lighter blue gradient */
            font-family: Arial, sans-serif;
            color: #333; /* Darker text color for contrast */
            margin: 0;
            padding: 0; /* Removed padding */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }

        h2 {
            text-align: center;
            color: #0077b6; /* Darker blue for the heading */
            margin-bottom: 30px; /* Added margin for spacing below */
        }

        form {
            background-color: rgba(255, 255, 255, 0.9); /* Light background for the form */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            width: 100%; /* Full width for the form */
            max-width: 400px; /* Maximum width */
            display: flex;
            flex-direction: column; /* Column layout */
        }

        label {
            margin-bottom: 5px; /* Space below labels */
            color: #0077b6; /* Darker blue for labels */
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            padding: 10px;
            margin-bottom: 20px; /* Space below inputs */
            border: 1px solid #0077b6; /* Border color */
            border-radius: 5px;
            background-color: rgba(240, 240, 240, 0.8); /* Light gray background for inputs */
            color: #333; /* Darker text color for input */
            width: 100%; /* Full width */
        }

        button {
            padding: 10px;
            background-color: #0077b6; /* Button color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s; /* Smooth transition */
            font-size: 16px;
        }

        button:hover {
            background-color: #005f8e; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    
    <form action="insertpatient" method="post">
        <div>
            <label for="pname">Name:</label>
            <input type="text" id="pname" name="pname" required>
        </div>
        <div>
            <label for="pgender">Gender:</label>
            <select id="pgender" name="pgender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div>
            <label for="pdob">Date of Birth:</label>
            <input type="date" id="pdob" name="pdob" required>
        </div>
        <div>
            <label for="pemail">Email:</label>
            <input type="email" id="pemail" name="pemail" required>
        </div>
        <div>
            <label for="ppwd">Password:</label>
            <input type="password" id="ppwd" name="ppwd" required>
        </div>
        <div>
            <label for="pcontact">Contact Number:</label>
            <input type="text" id="pcontact" name="pcontact" required>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>
