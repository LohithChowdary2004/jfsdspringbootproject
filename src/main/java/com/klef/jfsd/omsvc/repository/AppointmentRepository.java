package com.klef.jfsd.omsvc.repository;

import com.klef.jfsd.omsvc.model.Appointment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AppointmentRepository extends JpaRepository<Appointment, Integer> {
	
	
	List<Appointment> findByDoctorId(int doctorId);
	 List<Appointment> findByPatientId(int patientId);
	 
	 @Query("SELECT a FROM Appointment a WHERE a.doctorId = ?1 AND a.status = ?2")
	 List<Appointment> findByDoctorIdAndStatus(int doctorId, String status);


}
