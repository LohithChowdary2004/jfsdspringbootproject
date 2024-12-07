package com.klef.jfsd.omsvc.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.service.AppointmentService;
import com.klef.jfsd.omsvc.service.DoctorService;
import com.klef.jfsd.omsvc.service.PatientService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class DoctorController {
	
	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/doctorhome")
	public ModelAndView doctorhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("doctorhome");
		return mv;
	}
	
	@GetMapping("doctorlogin")
	public ModelAndView doctorlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("doctorlogin");
		return mv;
	}
	
	@GetMapping("doctorlogout")
	public ModelAndView doctorLogout(HttpServletRequest request) {
	    HttpSession session = request.getSession();

	    session.removeAttribute("doc"); 
	    //session.invalidate();

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("doctorlogin"); 
	    return mv;
	}

	@PostMapping("checkdoctorlogin")
	public ModelAndView checkDoctorLogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    Doctor doctor = doctorService.checkDoctorLogin(email, password);

	    if (doctor != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("doc", doctor); 
	        
	        
	        mv.setViewName("doctorhome");
	    } else {
	        mv.setViewName("doctorloginfail");
	        mv.addObject("message", "Login failed. Please try again.");
	    }
	    return mv;
	}

	@GetMapping("doctorsessionfail")
	public ModelAndView empsessionfail()
{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("doctorsessionfail");
	return mv;
}

	
	@GetMapping("viewallpatients")
	public ModelAndView viewAllPatients() {
	    ModelAndView mv = new ModelAndView();
	    List<Patient> patientList = doctorService.viewAllPatients();
	    mv.setViewName("viewallpatients");
	    mv.addObject("patientList", patientList);
	    return mv;
	}
	
	@GetMapping("viewallpatientsadmin")
	public ModelAndView viewallpatientsadmin() {
	    ModelAndView mv = new ModelAndView();
	    List<Patient> patientList = doctorService.viewAllPatients();
	    mv.setViewName("viewallpatientsadmin");
	    mv.addObject("patientList", patientList);
	    return mv;
	}
	
	@GetMapping("updatedoctor")
	public ModelAndView updateemp()
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("updatedoctor");
	return mv;
	}


	
	@PostMapping("update")
	public ModelAndView updateDoctor(HttpServletRequest request) {
	    
	    int id = Integer.parseInt(request.getParameter("id"));
	    String name = request.getParameter("name");
	    String gender = request.getParameter("gender");
	    String dob = request.getParameter("dob");
	    String specialization = request.getParameter("specialization");
	    double consultationFee = Double.parseDouble(request.getParameter("consultationFee"));
	    String qualification = request.getParameter("qualification");
	    int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
	    String contact = request.getParameter("contact");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    
	    Doctor doctor = new Doctor();
	    doctor.setId(id);
	    doctor.setName(name);
	    doctor.setGender(gender);
	    doctor.setDateOfBirth(LocalDate.parse(dob));  
	    doctor.setSpecialization(specialization);
	    doctor.setConsultationFee(consultationFee);
	    doctor.setQualification(qualification);
	    doctor.setExperienceYears(experienceYears);
	    doctor.setContact(contact);
	    doctor.setEmail(email);
	    doctor.setPassword(password);

	    
	    String msg = doctorService.updateDoctor(doctor);

	    
	    ModelAndView mv = new ModelAndView("updatesuccess");
	    mv.addObject("message", msg); 

	    return mv;
	}
	
	
	




}
