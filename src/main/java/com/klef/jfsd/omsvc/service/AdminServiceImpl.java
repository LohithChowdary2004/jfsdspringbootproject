package com.klef.jfsd.omsvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.omsvc.model.Admin;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.repository.AdminRepository;
import com.klef.jfsd.omsvc.repository.DoctorRepository;
import com.klef.jfsd.omsvc.repository.PatientRepository;

@Service
public class AdminServiceImpl implements AdminService
{
    @Autowired
    private AdminRepository adminRepository;
    
    @Autowired
    private DoctorRepository doctorRepository;
    
    @Autowired
    private PatientRepository patientRepository;

    @Override
    public Admin checkAdminLogin(String uname, String pwd) 
    {
        return adminRepository.checkAdminLogin(uname, pwd);
    }
    
    @Override
    public List<Doctor> viewAllDoctors() 
    {
        return doctorRepository.findAll();
    }
    
    @Override
    public List<Patient> viewAllPatients() 
    {
        return patientRepository.findAll();
    }
    
    @Override
    public String deleteDoctor(int doctorId) 
    {
        doctorRepository.deleteById(doctorId);
        return "Doctor deleted successfully";
    }
    
    @Override
    public String deletePatient(int patientId) 
    {
        patientRepository.deleteById(patientId);
        return "Patient deleted successfully";
    }
    
    @Override
    public long doctorCount() 
    {
        return doctorRepository.count();
    }
    
    @Override
    public long patientCount() 
    {
        return patientRepository.count();
    }

    @Override
    public String addDoctor(Doctor doctor) 
    {
        
         doctorRepository.save(doctor);
         
         return "Doctor Added Sucessfully";
        
    }
    
    @Override
    public Doctor getDoctorById(int id) {
        Optional<Doctor> doctorOptional = doctorRepository.findById(id);
        return doctorOptional.orElse(null); 
    }


}

