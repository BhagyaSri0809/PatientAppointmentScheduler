<%@ page import="model.Appointment" %>
<%
    Appointment booked = (Appointment) request.getAttribute("bookedDetail");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            /* This ensures the image covers the entire screen and stays fixed */
            background: url("images/backgroundimage.jpg") no-repeat center center fixed;
            background-size: cover;   
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Dark overlay to make the white card pop */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Adjusted darkness */
            z-index: -1;
        }

        .container {
            /* Centers the card vertically and horizontally */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .card {
            width: 100%;
            max-width: 550px;
            border-radius: 14px;
            overflow: hidden; /* Ensures header corners match card radius */
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            border: none;
        }

        .card-header {
            padding: 20px;
            font-weight: 600;
        }

        .card-body {
            background: rgba(255, 255, 255, 0.98);
            padding: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header bg-success text-white text-center">
                <h3 class="mb-0">Appointment Confirmed!</h3>
            </div>
            <div class="card-body">
                <p><strong>Patient Name:</strong> <%= booked.getPatientName() %></p>
                <p><strong>Doctor:</strong> <%= booked.getDoctorName() %></p>
                <p><strong>Symptom:</strong> <%= booked.getSymptom() %></p>
                <p><strong>Date:</strong> <%= booked.getDate() %> | <strong>Time:</strong> <%= booked.getTime() %></p>
                <p><strong>Contact:</strong> <%= booked.getMobile() %></p>
                <hr>
                <a href="addAppointment.jsp" class="btn btn-primary w-100">Book Another Appointment</a>
            </div>
        </div>
    </div>
</body>
</html>