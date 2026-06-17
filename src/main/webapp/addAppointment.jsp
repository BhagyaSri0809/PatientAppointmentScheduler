<!DOCTYPE html>
<html>
<head>
    <title>Get Appointment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url("images/bg.jpg") no-repeat center center fixed;
            background-size: cover;   
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.35);
            z-index: -1;
        }
        .container {
            max-width: 520px;
            background: rgba(255, 255, 255, 0.96);
            padding: 30px;
            margin: 60px auto;
            border-radius: 14px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
        }
        h2 { text-align: center; margin-bottom: 25px; color: red; font-weight: 600; }
        .btn-success { width: 100%; padding: 11px; border-radius: 8px; }
        .nav-links { text-align: center; margin-top: 20px; border-top: 1px solid #ddd; padding-top: 15px; }
    </style>
</head>
<body>

<div class="container">
    <h2>Get Appointment</h2>

    <form action="AppointmentServlet" method="post">
        <input type="hidden" name="action" value="add">
        <input class="form-control mb-3" name="patient" placeholder="Patient Name" required>

        <select class="form-control mb-3" id="symptom" name="symptom" required onchange="loadDoctors()">
            <option value="">Select Symptom</option>
            <option value="Fever">Fever</option>
            <option value="Cold">Cold</option>
            <option value="Heart Problem">Heart Problem</option>
                        
            
        </select>

        <select class="form-control mb-3" id="doctor" name="doctor" required>
            <option value="">Select Doctor</option>
        </select>

        <input class="form-control mb-3" type="date" name="date" required>
        <input class="form-control mb-3" type="time" name="time" required>
        <input class="form-control mb-4" type="text" name="mobile" placeholder="Mobile Number" required>

        <button class="btn btn-success">Register</button>
    </form>
    <div class="nav-links">
        <p>Staff member? <a href="login.jsp" style="color: red; font-weight: bold; text-decoration: none;">Login to Admin</a></p>
    </div>
</div>
<script>
function loadDoctors() {
    const symptom = document.getElementById("symptom").value;
    const doctorSelect = document.getElementById("doctor");
    doctorSelect.innerHTML = '<option value="">Select Doctor</option>';
    const doctorsMap = {
        "Fever": ["Dr. Ramesh", "Dr. Sunitha"],
        "Cold": ["Dr. Kiran", "Dr. Anjali"],
        "Heart Problem": ["Dr. Naresh", "Dr. Lakshmi"]
    };
    if (doctorsMap[symptom]) {
        doctorsMap[symptom].forEach(doc => {
            const option = document.createElement("option");
            option.value = doc; option.text = doc;
            doctorSelect.appendChild(option);
        });
    }
}
</script>
</body>
</html>          