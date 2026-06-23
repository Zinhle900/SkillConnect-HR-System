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
    font-family: Arial;
    background: #e9e9e9;
}

.container {
    width: 70%;
    margin: 40px auto;
    background: white;
    padding: 25px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

.header {
    border-bottom: 2px solid #ff4da6;
    margin-bottom: 20px;
    padding-bottom: 10px;
}

.header h2 {
    color: #ff1f8f;
    margin: 0;
}

.meta {
    font-size: 14px;
    color: #555;
}

.candidate {
    border-left: 4px solid #ff4da6;
    padding: 12px;
    margin-bottom: 15px;
    background: #fafafa;
}

.name {
    font-weight: bold;
    font-size: 16px;
}

.section {
    font-size: 14px;
    margin-top: 5px;
}

.status {
    font-weight: bold;
    color: #ff1f8f;
    margin-top: 5px;
}

.footer {
    text-align: center;
    margin-top: 20px;
    font-size: 12px;
    color: #777;
}

</style>

</head>

<body>

<div class="container">

    <div class="header">
        <h2>Qualified Candidates Report</h2>
        <div class="meta">
            To: HR Department <br>
            Subject: Skill Connect - Candidate Screening Report
        </div>
    </div>

<%
if (students != null && !students.isEmpty()) {

    int count = 1;

    for (Student s : students) {

        String decision = (decisions != null)
                ? decisions.get(s.getId())
                : "N/A";
%>

    <div class="candidate">

        <div class="name">
            <%= count++ %>. <%= s.getName() %>
        </div>

        <div class="section">
            <b>Basic Skills:</b> <%= s.getSkills() %>
        </div>

        <div class="section">
            <b>Coding Languages:</b> <%= s.getLanguages() %>
        </div>

        <div class="section">
            <b>Projects:</b> <%= s.getProjects() %>
        </div>

        <div class="section">
            <b>Certifications:</b> <%= s.getCertifications() %>
        </div>

        <div class="status">
            Status: <%= decision %>
        </div>

    </div>

<%
    }

} else {
%>

    <p style="text-align:center; color:red;">
        No candidates found in the system
    </p>

<%
}
%>

    <div class="footer">
        End of HR Screening Report - Skill Connect System
    </div>

</div>

</body>
</html>