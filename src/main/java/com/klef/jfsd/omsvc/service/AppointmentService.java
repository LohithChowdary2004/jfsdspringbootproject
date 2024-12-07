package com.klef.jfsd.omsvc.service;

import java.util.List;

import com.klef.jfsd.omsvc.model.Appointment;

public interface AppointmentService {
	
	List<Appointment> getAppointmentsByDoctorId(int doctorId);
	
	List<Appointment> getAppointmentsWithPatients();
	
	Appointment findById(int appointmentId);
    Appointment save(Appointment appointment);
    
    List<Appointment> findAppointmentsByPatientId(int patientId);
    
    public List<Appointment> getPendingAppointmentsByDoctorId(int doctorId);


}
