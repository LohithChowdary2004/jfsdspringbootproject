package com.klef.jfsd.omsvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.omsvc.model.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Integer> 
{

	@Query("select p from Patient p where p.email = ?1 and p.password = ?2")
    public Patient checkPatientLogin(String email, String password);
}
