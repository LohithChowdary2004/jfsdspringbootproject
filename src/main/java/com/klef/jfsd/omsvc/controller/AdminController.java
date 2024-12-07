package com.klef.jfsd.omsvc.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.omsvc.model.Admin;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.service.AdminService;
import com.klef.jfsd.omsvc.service.DoctorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private DoctorService doctorService;
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		
		
		return mv;
	}
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	

	@PostMapping("checkadminlogin")
	public ModelAndView checkAdminLogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");

	    Admin admin = adminService.checkAdminLogin(auname, apwd);

	    if (admin != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("ad", admin); 

	        mv.setViewName("adminhome");
	    } else {
	        mv.setViewName("adminloginfail");
	        mv.addObject("message", "Login failed. Please try again.");
	    }
	    return mv;
	}

	
	
	@GetMapping("adminlogout")
	public ModelAndView adminLogout(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    //session.removeAttribute("ad"); 
	    session.invalidate(); 

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminlogin"); 
	    return mv;
	}
	
	@GetMapping("adminsessionfail")
	public ModelAndView empsessionfail()
{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("adminsessionfail");
	return mv;
}

	
	
	@GetMapping("doctorreg")
    public ModelAndView doctorRegistrationForm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctorreg"); 
        return mv;
    }

    
    @PostMapping("adddoctor")
    public ModelAndView addDoctor(HttpServletRequest request) {
        // Retrieve form parameters
        String name = request.getParameter("dname");
        String email = request.getParameter("demail");
        String password = request.getParameter("dpassword");
        String contact = request.getParameter("dcontact");
        String specialization = request.getParameter("dspecialization");
        int experienceYears = Integer.parseInt(request.getParameter("dexperienceYears"));
        String qualification = request.getParameter("dqualification");
        LocalDate dateOfBirth = LocalDate.parse(request.getParameter("ddateOfBirth")); // Ensure format is 'yyyy-MM-dd'
        String gender = request.getParameter("dgender");
        double consultationFee = Double.parseDouble(request.getParameter("dconsultationFee"));

       
        Doctor doctor = new Doctor();
        doctor.setName(name);
        doctor.setEmail(email);
        doctor.setPassword(password);
        doctor.setContact(contact);
        doctor.setSpecialization(specialization);
        doctor.setExperienceYears(experienceYears);
        doctor.setQualification(qualification);
        doctor.setDateOfBirth(dateOfBirth);
        doctor.setGender(gender);
        doctor.setConsultationFee(consultationFee);

        
        
        String msg=adminService.addDoctor(doctor);

        
        ModelAndView mv = new ModelAndView("regsuccess"); 
        mv.addObject("message", msg);
        return mv;
    }
	
	
    @GetMapping("viewalldoctors")
    public ModelAndView viewAllDoctors() 
    {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctorList = adminService.viewAllDoctors();
        mv.setViewName("viewalldoctors");
        mv.addObject("doctorList", doctorList);
        return mv;
    }
    
	
    	
    @GetMapping("deletedoctor")
    public ModelAndView deleteDoctorPage() {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctorList = adminService.viewAllDoctors();
        mv.setViewName("deletedoctor");
        mv.addObject("doctorList", doctorList);
        return mv;
    }

    @GetMapping("deleteDoctorById")
    public String deleteDoctorById(@RequestParam("id") int doctorId) {
        adminService.deleteDoctor(doctorId);
        return "redirect:/deletedoctor";
    }

    
    
    @GetMapping("/updatedoctors")
    public String viewAllDoctors(Model model) {
        List<Doctor> doctorList = adminService.viewAllDoctors(); 
        model.addAttribute("doctorList", doctorList);
        return "updatedoctors"; 
    }

    
    @PostMapping("/loadDoctorDetails")
    public String loadDoctorDetails(@RequestParam("doctorId") int doctorId, Model model) {
        Doctor doctor = adminService.getDoctorById(doctorId);
        if (doctor != null) {
            model.addAttribute("doctorDetails", doctor);
            return "updatedoctoradmin"; 
        } else {
            return "redirect:/updatedoctors"; 
        }
    }

    
    @PostMapping("/updateDoctor")
    public String updateDoctor(@RequestParam("id") int id,
                               @RequestParam("name") String name,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password,
                               @RequestParam("contact") String contact,
                               @RequestParam("specialization") String specialization,
                               @RequestParam("experienceYears") int experienceYears,
                               @RequestParam("qualification") String qualification,
                               @RequestParam("dob") String dob,  
                               @RequestParam("gender") String gender,
                               @RequestParam("consultationFee") double consultationFee) {

        
        LocalDate dateOfBirth = LocalDate.parse(dob);

        Doctor doctor = adminService.getDoctorById(id);
        if (doctor != null) {
            
            doctor.setName(name);                
            doctor.setEmail(email);             
            doctor.setPassword(password);       
            doctor.setContact(contact);          
            doctor.setSpecialization(specialization); 
            doctor.setExperienceYears(experienceYears); 
            doctor.setQualification(qualification);
            doctor.setDateOfBirth(dateOfBirth);   
            doctor.setGender(gender);            
            doctor.setConsultationFee(consultationFee); 

            
            doctorService.updateDoctor(doctor); 
        }
        return "redirect:/viewalldoctors";  
    }
	
}
