<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Light gray background */
            padding: 20px;
        }
        h1 {
            color: #6a1b9a; /* Purple title */
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
            background-color: #ffffff; /* White background */
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Light gray border */
        }
        th {
            background-color: #6a1b9a; /* Purple background */
            color: #ffffff; /* White text */
        }
        td {
            background-color: #f9f9f9; /* Light gray background for cells */
        }
        .action-forms {
            display: flex;
            justify-content: space-between;
        }
        .action-forms form {
            display: inline-block;
            margin-right: 10px;
        }
        .action-forms input[type="submit"] {
            background-color: #6a1b9a; /* Purple button */
            color: #ffffff; /* White text */
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
        }
        .action-forms input[type="submit"]:hover {
            background-color: #4a148c; /* Darker purple on hover */
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Student Data</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% List<Map<String, String>> students = (List<Map<String, String>>) request.getAttribute("students");
               if (students != null) {
                   for (Map<String, String> student : students) {
            %>
            <tr>
                <td><%= student.get("name") %></td>
                <td><%= student.get("address") %></td>
                <td class="action-forms">
                    <!-- Update Form -->
                    <form action="update" method="post">
                        <input type="hidden" name="oldName" value="<%= student.get("name") %>">
                        Name: <input type="text" name="name" value="<%= student.get("name") %>"><br>
                        Address: <input type="text" name="address" value="<%= student.get("address") %>"><br>
                        <input type="submit" value="Update">
                    </form>
                    <!-- Delete Form -->
                    <form action="delete" method="post">
                        <input type="hidden" name="name" value="<%= student.get("name") %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <%     }
               }
            %>
        </tbody>
    </table>
    <a href="index.jsp" class="back-link">Back to form</a>
</body>
</html>
