package com.klef.jfsd.omsvc.service;

import java.util.List;

import com.klef.jfsd.omsvc.model.Admin;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;

public interface AdminService {


    Admin checkAdminLogin(String uname, String pwd);

   
    List<Doctor> viewAllDoctors();

    
    List<Patient> viewAllPatients();

    
    String addDoctor(Doctor doctor);

   
	

    
    String deleteDoctor(int doctorId);

    
    String deletePatient(int patientId);

    
    long doctorCount();

    
    long patientCount();
    
    Doctor getDoctorById(int id);
}
