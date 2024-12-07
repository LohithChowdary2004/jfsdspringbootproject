package com.klef.jfsd.omsvc.service;

import java.util.List;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;

public interface DoctorService 
{
	Doctor checkDoctorLogin(String email, String password);
	
    
    List<Patient> viewAllPatients();

    
    Patient getPatientById(int patientId);

 

    
    String deletePatient(int patientId);
    
    String updateDoctor(Doctor d);
     List<Appointment> getAppointmentsByDoctorId(int doctorId);
     


}
