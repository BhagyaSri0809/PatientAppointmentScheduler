<%@ page import="model.Appointment" %>
<%
Appointment a = (Appointment) request.getAttribute("appointment");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Appointment</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body class="container mt-5">

<h2 class="text-center mb-4">Edit Appointment</h2>

<form action="AppointmentServlet" method="post">

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= a.getId() %>">

    <input class="form-control mb-3"
           name="patient"
           value="<%= a.getPatientName() %>" required>

    <input class="form-control mb-3"
           name="symptom"
           value="<%= a.getSymptom() %>" required>

    <input class="form-control mb-3"
           name="doctor"
           value="<%= a.getDoctorName() %>" required>

    <input class="form-control mb-3"
           type="date"
           name="date"
           value="<%= a.getDate() %>" required>

    <input class="form-control mb-3"
           type="time"
           name="time"
           value="<%= a.getTime() %>" required>

    <input class="form-control mb-3"
           name="mobile"
           value="<%= a.getMobile() %>" required>

    <button class="btn btn-success w-100">
        Update Appointment
    </button>

</form>

</body>
</html>