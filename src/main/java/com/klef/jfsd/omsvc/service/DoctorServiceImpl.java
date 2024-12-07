package com.klef.jfsd.omsvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.repository.AppointmentRepository;
import com.klef.jfsd.omsvc.repository.DoctorRepository;
import com.klef.jfsd.omsvc.repository.PatientRepository;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorRepository doctorRepository;
    
    @Autowired
    private PatientRepository patientRepository;
    
    @Autowired
    private AppointmentRepository appointmentRepository;

    @Override
    public Doctor checkDoctorLogin(String email, String password) {
        return doctorRepository.checkDoctorLogin(email, password);
    }

    @Override
    public List<Patient> viewAllPatients() {
        return patientRepository.findAll();
    }

    @Override
    public Patient getPatientById(int patientId) {
        return patientRepository.findById(patientId).orElse(null);
    }



    @Override
    public String deletePatient(int patientId) {
        patientRepository.deleteById(patientId);
        return "Patient deleted successfully";
    }
    
    
    
    @Override
    public String updateDoctor(Doctor d) {
        
        Doctor doc = doctorRepository.findById(d.getId()).get();
        
        
        doc.setContact(d.getContact());
        doc.setDateOfBirth(d.getDateOfBirth());
        doc.setSpecialization(d.getSpecialization());
        doc.setGender(d.getGender());
        doc.setName(d.getName());
        doc.setPassword(d.getPassword());
        doc.setConsultationFee(d.getConsultationFee());
        doc.setQualification(d.getQualification());
        doc.setExperienceYears(d.getExperienceYears());
        
        
        doctorRepository.save(doc);
        
        return "Doctor updated successfully";
    }
    
    
    public List<Appointment> getAppointmentsByDoctorId(int doctorId) {
        return appointmentRepository.findByDoctorId(doctorId);
    }

}
