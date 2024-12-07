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
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private DoctorRepository doctorRepository;
    
    @Autowired
    private AppointmentRepository appointmentRepository;

    @Override
    public Patient checkPatientLogin(String email, String password) {
        return patientRepository.checkPatientLogin(email, password);
    }

    @Override
    public Patient viewPatientProfile(int patientId) {
        return patientRepository.findById(patientId).orElse(null);
    }



    @Override
    public List<Doctor> viewAllDoctors() {
        return doctorRepository.findAll();
    }

	@Override
	public String PatientRegistration(Patient patient) {
		// TODO Auto-generated method stub
		patientRepository.save(patient);
		return "Patient Registered Successfully";
	}
	
	
	 @Override
	    public String updatepatient(Patient patient) {
	        Patient existingPatient = patientRepository.findById(patient.getId()).orElse(null);

	        if (existingPatient == null) {
	            return "Patient not found";
	        }

	        
	        existingPatient.setContact(patient.getContact());
	        existingPatient.setDateOfBirth(patient.getDateOfBirth());
	        existingPatient.setGender(patient.getGender());
	        existingPatient.setName(patient.getName());
	        existingPatient.setPassword(patient.getPassword());

	        patientRepository.save(existingPatient);
	        return "Patient updated successfully";
	    }
	 
	 
	 

	 @Override
	    public String bookAppointment(Appointment appointment) {
	        try {
	            
	            appointmentRepository.save(appointment);
	            return "Appointment booked successfully!";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "Error occurred while booking the appointment. Please try again.";
	        }
	    }
	 
	 

	 @Override
	    public Patient getPatientById(Integer patientId) {
	        return patientRepository.findById(patientId).orElse(null); // Return null if not found
	    }

	 @Override
	    public List<Appointment> getAppointmentsByPatientId(Integer patientId) {
	        // Fetch the list of appointments for the given patientId
	        return appointmentRepository.findByPatientId(patientId);
	    }
}



