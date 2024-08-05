<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Light gray background */
            padding: 20px;
        }
        .form-container {
            background-color: #ffffff; /* White background for form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
            width: 300px;
            margin: auto;
        }
        .form-title {
            text-align: center;
            color: #6a1b9a; /* Light purple */
            margin-bottom: 20px;
        }
        .form-input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 4px;
            font-size: 14px;
        }
        .form-submit {
            background-color: #6a1b9a; /* Light purple */
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-submit:hover {
            background-color: #4a148c; /* Darker purple on hover */
        }
        .form-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #333;
            text-decoration: none;
        }
        .form-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Student Form</h2>
        <form action="student" method="post">
            <label for="name">Student Name:</label><br>
            <input type="text" id="name" name="name" class="form-input"><br>
            <label for="address">Student Address:</label><br>
            <input type="text" id="address" name="address" class="form-input"><br>
            <input type="submit" value="Insert" class="form-submit">
        </form>
        <a href="data" class="form-link">View Student Data</a>
    </div>
</body>
</html>
