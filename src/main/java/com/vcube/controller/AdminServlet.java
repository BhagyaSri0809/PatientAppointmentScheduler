package com.vcube.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.vcube.dao.AppointmentDAO;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String user = req.getParameter("username");
        String pass = req.getParameter("password");
        AppointmentDAO dao = new AppointmentDAO();

        try {
            if (dao.checkAdmin(user, pass)) {
                HttpSession session = req.getSession();
                session.setAttribute("adminUser", user);
                res.sendRedirect("listAppointments.jsp");
            } else {
                res.sendRedirect("login.jsp?error=invalid");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
    

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate(); // Destroys the session
        res.sendRedirect("login.jsp");
    }
}