<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="za.entities.Student"%>

<%
List<Student> students =
(List<Student>) request.getAttribute("students");

Map<Long, String> decisions =
(Map<Long, String>) request.getAttribute("decisions");
%>

<!DOCTYPE html>
<html>
<head>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #d9d9d9;
}

.header {
    background: linear-gradient(90deg, #ff4da6, #ff1f8f);
    color: white;
    padding: 25px;
    text-align: center;
}

.container {
    width: 95%;
    margin: 30px auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #eee;
}

th {
    background: #ff4da6;
    color: white;
}

tr:hover {
    background: #f9f9f9;
}

.empty {
    text-align: center;
    padding: 20px;
    color: #666;
}

.badge {
    font-weight: bold;
}

</style>

</head>

<body>

<div class="header">
    <h1>HR Dashboard</h1>
    <p>Skill Connect - Candidate Evaluation System</p>
</div>

<div class="container">

<table>

    <tr>
        <th>Name</th>
        <th>Basic Skills</th>
        <th>Coding Languages</th>
        <th>Projects</th>
        <th>Certifications</th>
        <th>Decision</th>
    </tr>

    <%
        if (students != null && !students.isEmpty()) {
            for (Student s : students) {
    %>

    <tr>
        <td><%= s.getName() %></td>
        <td><%= s.getSkills() %></td>
        <td><%= s.getLanguages() %></td>
        <td><%= s.getProjects() %></td>
        <td><%= s.getCertifications() %></td>

        <td class="badge">
            <%= decisions != null ? decisions.get(s.getId()) : "N/A" %>
        </td>
    </tr>

    <%
            }
        } else {
    %>

    <tr>
        <td colspan="6" class="empty">
            No students found in the system
        </td>
    </tr>

    <%
        }
    %>

</table>
    <a href="ReportServlet">Send email report</a>
</div>

</body>
</html>