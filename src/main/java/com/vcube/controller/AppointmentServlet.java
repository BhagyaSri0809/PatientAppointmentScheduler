package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appointment;

import java.io.IOException;

import com.vcube.dao.AppointmentDAO;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {

    AppointmentDAO dao = new AppointmentDAO();

    // ================= POST (ADD + UPDATE) =================
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {

            // ---------- ADD APPOINTMENT ----------
            if ("add".equals(action)) {

                Appointment a = new Appointment();
                a.setPatientName(req.getParameter("patient"));
                a.setSymptom(req.getParameter("symptom"));
                a.setDoctorName(req.getParameter("doctor"));
                a.setDate(req.getParameter("date"));
                a.setTime(req.getParameter("time"));
                a.setMobile(req.getParameter("mobile"));

             // Inside if ("add".equals(action)) { ... }
                boolean s = dao.addAppointment(a);

                if (s) {
                    req.setAttribute("bookedDetail", a);
                    req.getRequestDispatcher("bookingSuccess.jsp").forward(req, res);
                } else {
                    res.sendRedirect("addAppointment.jsp");
                }
            }

            // ---------- UPDATE APPOINTMENT ----------
            if ("update".equals(action)) {

                Appointment a = new Appointment();
                a.setId(Integer.parseInt(req.getParameter("id")));
                a.setPatientName(req.getParameter("patient"));
                a.setSymptom(req.getParameter("symptom"));
                a.setDoctorName(req.getParameter("doctor"));
                a.setDate(req.getParameter("date"));
                a.setTime(req.getParameter("time"));
                a.setMobile(req.getParameter("mobile"));

                dao.updateAppointment(a);
                res.sendRedirect("listAppointments.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= GET (DELETE + EDIT) =================
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            // ---------- DELETE ----------
            if (req.getParameter("delete") != null) {
                int id = Integer.parseInt(req.getParameter("delete"));
                dao.deleteAppointment(id);
                res.sendRedirect("listAppointments.jsp");
            }

            // ---------- EDIT ----------
            if (req.getParameter("edit") != null) {
                int id = Integer.parseInt(req.getParameter("edit"));
                Appointment a = dao.editAppointment(id);
                req.setAttribute("appointment", a);
                RequestDispatcher rd =
                        req.getRequestDispatcher("editAppointment.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}