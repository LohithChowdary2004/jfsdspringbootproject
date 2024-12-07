package com.klef.jfsd.omsvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.repository.AppointmentRepository;
import com.klef.jfsd.omsvc.repository.PatientRepository;

@Service
public class AppointmentServiceImpl implements AppointmentService{
	
	@Autowired
    private AppointmentRepository appointmentRepository;
    @Autowired
    private PatientRepository patientRepository;

    @Override
    public List<Appointment> getAppointmentsByDoctorId(int doctorId) {
        return appointmentRepository.findByDoctorId(doctorId);

}
    
    



   
    public List<Appointment> getAppointmentsWithPatients() {
        // Fetch all appointments
        List<Appointment> appointments = appointmentRepository.findAll();

        // Loop through appointments and fetch the associated patient for each
        for (Appointment appointment : appointments) {
            Patient patient = patientRepository.findById(appointment.getPatientId()).orElse(null);
            if (patient != null) {
                // Add the patient details to the appointment in a custom way (not modifying the Appointment model)
                appointment.setResponse(patient.getName()); // Example: appending patient info to the response (or some other field)
            }
        }

        return appointments;
    }
    
    
    @Override
    public Appointment findById(int appointmentId) {
        return appointmentRepository.findById(appointmentId).orElse(null);
    }

    @Override
    public Appointment save(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }
    
    @Override
    public List<Appointment> findAppointmentsByPatientId(int patientId) {
        return appointmentRepository.findByPatientId(patientId);
    }
    
    
    @Override
    public List<Appointment> getPendingAppointmentsByDoctorId(int doctorId) {
        return appointmentRepository.findByDoctorIdAndStatus(doctorId, "Pending");
    }

}
