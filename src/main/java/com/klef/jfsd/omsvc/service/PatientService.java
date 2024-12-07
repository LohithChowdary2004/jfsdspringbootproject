package com.klef.jfsd.omsvc.service;

import java.util.List;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;

public interface PatientService 
{
	Patient checkPatientLogin(String email, String password);
	
	public String PatientRegistration(Patient patient);
	
    
    Patient viewPatientProfile(int patientId);

    String updatepatient(Patient patient);
    
    List<Doctor> viewAllDoctors();
    
    String bookAppointment(Appointment appointment);
    List<Appointment> getAppointmentsByPatientId(Integer patientId);
    Patient getPatientById(Integer patientId);
}
