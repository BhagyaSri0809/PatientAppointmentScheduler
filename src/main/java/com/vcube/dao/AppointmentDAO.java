package com.vcube.dao;

import java.sql.*;
import java.util.*;
import model.Appointment;

public class AppointmentDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
    }

    // NEW: Admin Login Check
    public boolean checkAdmin(String user, String pass) throws Exception {
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    public boolean addAppointment(Appointment a) throws Exception {
        String sql = "INSERT INTO appointments (patient_name, symptom, doctor_name, appointment_date, appointment_time, mobile) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, a.getPatientName());
            ps.setString(2, a.getSymptom());
            ps.setString(3, a.getDoctorName());
            ps.setString(4, a.getDate());
            ps.setString(5, a.getTime());
            ps.setString(6, a.getMobile());
            return ps.executeUpdate() > 0;
        }
    }

    public List<Appointment> getAllAppointments() throws Exception {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments";
        try (Connection con = getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Appointment a = new Appointment();
                a.setId(rs.getInt("id"));
                a.setPatientName(rs.getString("patient_name"));
                a.setSymptom(rs.getString("symptom"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTime(rs.getString("appointment_time"));
                a.setMobile(rs.getString("mobile"));
                list.add(a);
            }
        }
        return list;
    }

    public Appointment editAppointment(int id) throws Exception {
        String sql = "SELECT * FROM appointments WHERE id=?";
        Appointment a = null;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Appointment();
                a.setId(rs.getInt("id"));
                a.setPatientName(rs.getString("patient_name"));
                a.setSymptom(rs.getString("symptom"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTime(rs.getString("appointment_time"));
                a.setMobile(rs.getString("mobile"));
            }
        }
        return a;
    }

    public boolean updateAppointment(Appointment a) throws Exception {
        String sql = "UPDATE appointments SET patient_name=?, symptom=?, doctor_name=?, appointment_date=?, appointment_time=?, mobile=? WHERE id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, a.getPatientName());
            ps.setString(2, a.getSymptom());
            ps.setString(3, a.getDoctorName());
            ps.setString(4, a.getDate());
            ps.setString(5, a.getTime());
            ps.setString(6, a.getMobile());
            ps.setInt(7, a.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteAppointment(int id) throws Exception {
        String sql = "DELETE FROM appointments WHERE id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}