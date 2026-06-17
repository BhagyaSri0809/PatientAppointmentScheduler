<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - City Hospital</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url("images/Hospital.png") no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: -1;
        }
        .login-card {
            max-width: 400px;
            margin: auto;
            background: rgba(255, 255, 255, 0.96);
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h2 { color: red; font-weight: 600; text-align: center; margin-bottom: 25px; }
        .btn-login { width: 100%; background-color: #198754; color: white; border-radius: 8px; padding: 10px; }
    </style>
</head>
<body>

<div class="login-card">
    <h2>Staff Login</h2>
    <form action="AdminServlet" method="post">
        <div class="mb-3">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>
        <div class="mb-3">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <button type="submit" class="btn btn-login">Login</button>
    </form>
    <div class="text-center mt-3">
        <a href="addAppointment.jsp" style="text-decoration: none; font-size: 14px;"   class="btn btn-success">Back to Bookings</a>
    </div>
</div>

</body>
</html>