package com.klef.jfsd.omsvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;

@Repository
public interface DoctorRepository  extends JpaRepository<Doctor, Integer>
{

	@Query("select d from Doctor d where d.email = ?1 and d.password = ?2")
    public Doctor checkDoctorLogin(String email, String password);
	
	@Query("SELECT a FROM Appointment a WHERE a.doctorId = ?1")
	List<Appointment> findByDoctorId(int doctorId);
	
	



}
