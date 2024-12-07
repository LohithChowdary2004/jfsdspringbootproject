package com.klef.jfsd.omsvc.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name="appointments")
public class Appointment {
	

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="appointment_id")
    private int appointmentId;

    @Column(name="patient_id", nullable=false)
    private int patientId;

    @Column(name="doctor_id", nullable=false)
    private int doctorId;

    @Column(name="appointment_date", nullable=false)
    private LocalDate appointmentDate;

    @Column(name="appointment_time", nullable=false)
    private LocalTime appointmentTime;

    @Column(name="status", nullable=false)
    private String status = "Pending";  

    @Column(name="response")
    private String response;

    @Column(name="age", nullable=false)
    private int age;

    @Column(name="problem", nullable=false, length=500)
    private String problem;

    @Column(name="created_at", nullable=false)
    private LocalDate createdAt;

    @Column(name="updated_at")
    private LocalDate updatedAt;
    
    @ManyToOne
    private Patient patient;

    // Getters and Setters
    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public LocalTime getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(LocalTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Patient getPatient() {
        return patient;
    }
}
