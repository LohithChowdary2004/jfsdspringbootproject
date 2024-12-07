<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Login</title>
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
            align-items: flex-start; /* Align items to the top */
            height: 100vh; /* Full viewport height */
            padding-top: 100px; /* Padding from the top to move it down */
        }

        h3 {
            text-align: center;
            margin: 0; /* Removed all margins */
            margin-bottom: 20px; /* Added margin for spacing below */
            color: #0077b6; /* Darker blue for the heading */
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9); /* Light background for the form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 100%; /* Full width for the form */
            max-width: 400px; /* Maximum width */
        }

        table {
            width: 100%; /* Full width for the form */
        }

        label {
            color: #0077b6; /* Darker blue for labels */
        }

        input[type="email"],
        input[type="password"] {
            padding: 10px;
            width: calc(100% - 20px); /* Full width minus padding */
            margin-top: 5px; /* Space above inputs */
            border: none;
            border-radius: 4px;
            background-color: rgba(240, 240, 240, 0.8); /* Light gray background for inputs */
            color: #333; /* Darker text color for input */
        }

        .button-container {
            text-align: center;
            margin-top: 10px; /* Space above button container */
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #0077b6; /* Submit button color */
            color: white;
            transition: background 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #005f8e; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    
    <div>
        <h3><u>Doctor Login</u></h3>
        <div class="form-container">
            <form method="post" action="checkdoctorlogin">
                <table>
                    <tr>
                        <td><label for="email">Enter Email ID</label></td>
                        <td><input type="email" id="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <td><label for="password">Enter Password</label></td>
                        <td><input type="password" id="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Login"/>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
