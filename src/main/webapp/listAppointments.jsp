<%@ page import="java.util.*,com.vcube.dao.AppointmentDAO, model.Appointment" %>

<%
    // 1. Session Security Check: Only logged-in admins can see this page
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. Fetch Data from DAO
    AppointmentDAO dao = new AppointmentDAO();
    List<Appointment> list = dao.getAllAppointments();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Appointments List</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <style>
        /* Full-page background */
        body {
            background-image: url("images/backgroundimage.jpg"); 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }

        /* Container with semi-transparent white background */
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Table alignment */
        table th {
            text-align: center;
        }

        table td {
            vertical-align: middle;
        }
        
        .logout-section {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        
        <div class="logout-section">
            <span class="me-3">Logged in as: <strong><%= session.getAttribute("adminUser") %></strong></span>
            <a href="AdminServlet" class="btn btn-outline-danger btn-sm">Logout</a>
        </div>

        <h2 class="text-center mb-4 text-primary">Admin Dashboard - Appointments</h2>

        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Symptom</th>
                    <th>Doctor</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Mobile</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <% if (list != null && !list.isEmpty()) { 
                    for (Appointment a : list) { %>
                <tr>
                    <td class="text-center"><%= a.getId() %></td>
                    <td><%= a.getPatientName() %></td>
                    <td><%= a.getSymptom() %></td>
                    <td><%= a.getDoctorName() %></td>
                    <td><%= a.getDate() %></td>
                    <td><%= a.getTime() %></td>
                    <td><%= a.getMobile() %></td>
                    <td class="text-center">
                        <a href="AppointmentServlet?edit=<%= a.getId() %>"
                           class="btn btn-sm btn-primary">Edit</a>

                        <a href="AppointmentServlet?delete=<%= a.getId() %>"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this appointment?')">Delete</a>
                    </td>
                </tr>
                <%  } 
                } else { %>
                <tr>
                    <td colspan="8" class="text-center">No appointments found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>