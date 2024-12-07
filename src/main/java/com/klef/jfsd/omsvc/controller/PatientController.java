package com.klef.jfsd.omsvc.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.service.AppointmentService;
import com.klef.jfsd.omsvc.service.PatientService;

import ch.qos.logback.core.joran.spi.HttpUtil.RequestMethod;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PatientController {

	@Autowired
    private PatientService patientService;
	
	@Autowired
    private AppointmentService appointmentService;

    @GetMapping("/regpatient")
    public ModelAndView patientRegister() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("regpatient"); 
        return mv;
    }

    @PostMapping("/insertpatient")
    public ModelAndView insertPatient(HttpServletRequest request) {
        String name = request.getParameter("pname");
        String gender = request.getParameter("pgender");
        String dob = request.getParameter("pdob");
        String email = request.getParameter("pemail");
        String password = request.getParameter("ppwd");
        String contact = request.getParameter("pcontact");


        Patient patient = new Patient();
        patient.setName(name);
        patient.setGender(gender);
        patient.setDateOfBirth(LocalDate.parse(dob)); 
        patient.setEmail(email);
        patient.setPassword(password);
        patient.setContact(contact);

        
        String msg = patientService.PatientRegistration(patient);  
    
        
        ModelAndView mv = new ModelAndView("patsuccess");
        mv.addObject("message", msg);

        return mv;
    }
    
    
    @GetMapping("patientlogin")
    public ModelAndView patientLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("patientlogin"); 
        return mv;
    }

    @PostMapping("checkpatientlogin")
    public ModelAndView checkPatientLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Patient patient = patientService.checkPatientLogin(email, password);  // Validate patient login credentials
        
        if (patient != null) {
            HttpSession session = request.getSession();  // Create or get session
            session.setAttribute("pa", patient);  // Store patient object in session with "p" as the key

            mv.setViewName("patienthome");  // Redirect to the patient's home page
        } else {
            mv.setViewName("patientloginfail");  // Redirect to login fail page if credentials are incorrect
            mv.addObject("message", "Login failed. Please check your email and password.");
        }
        return mv;
    }
    
    @GetMapping("patientlogout")
    public ModelAndView patientLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();  // Get the current session

        // session.removeAttribute("pa");  // Optionally remove the "p" attribute
        session.invalidate();  // Invalidate the entire session to remove all attributes

        ModelAndView mv = new ModelAndView();
        mv.setViewName("patientlogin");  // After logout, redirect to the login page
        return mv;
    }
    
    @GetMapping("patientsessionfail")
    public ModelAndView patientsessionfail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("patientsessionfail");  // Redirect to the session failure page
        return mv;
    }



    
    @GetMapping("patienthome")
    public ModelAndView patienthome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("patienthome"); 
        return mv;
    }   
    
    
    
    
    
    @GetMapping("updatepatient")
    public ModelAndView updatePatientPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatepatient"); 
        return mv;
    }

    
    @PostMapping("updatep")
    public ModelAndView updatepatient(HttpServletRequest request) {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        
        Patient patient = new Patient();
        patient.setId(id);
        patient.setName(name);
        patient.setGender(gender);
        patient.setDateOfBirth(LocalDate.parse(dob)); 
        patient.setContact(contact);
        patient.setEmail(email);
        patient.setPassword(password);

        
        String msg = patientService.updatepatient(patient);

        
        ModelAndView mv = new ModelAndView("updatesuccessp"); 
        mv.addObject("message", msg); 

        return mv;
    }
    
    

    
    @GetMapping("/bookAppointment")
    public String bookAppointment(Model model) {
        List<Doctor> doctors = patientService.viewAllDoctors();
        model.addAttribute("doctors", doctors);
        return "bookAppointment"; 
    }

    
    @PostMapping("/bappointment")
    public ModelAndView bappointment(HttpServletRequest request) {

        
        Integer patientId = Integer.parseInt(request.getParameter("patient_id"));
        Integer doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        String appointmentDate = request.getParameter("appointment_date");
        String appointmentTime = request.getParameter("appointment_time");
        String problem = request.getParameter("problem");
        Integer age = Integer.parseInt(request.getParameter("age"));

        
        LocalDate date = LocalDate.parse(appointmentDate);
        LocalTime time = LocalTime.parse(appointmentTime);

        
        Appointment appointment = new Appointment();
        appointment.setPatientId(patientId);
        appointment.setDoctorId(doctorId);
        appointment.setAppointmentDate(date);
        appointment.setAppointmentTime(time);
        appointment.setProblem(problem);
        appointment.setAge(age);
        appointment.setCreatedAt(LocalDate.now()); 
        appointment.setStatus("Pending"); 

        
        String result = patientService.bookAppointment(appointment);

        
        ModelAndView mv = new ModelAndView("appointmentConfirmation");
        mv.addObject("result", result);

        return mv;
    }
    
    
    @GetMapping("/myappointments")
    public ModelAndView myappointments(HttpServletRequest request) {
        
        Patient patient = (Patient) request.getSession().getAttribute("pa");

        if (patient == null) {
            
            return new ModelAndView("redirect:/patientsessionfail");
        }

        
        List<Appointment> appointments = patientService.getAppointmentsByPatientId(patient.getId());

        
        ModelAndView mv = new ModelAndView("myappointments");
        mv.addObject("appointments", appointments);

        return mv;
    }

    
    @GetMapping("viewalldoctorsp")
    public ModelAndView viewalldoctorsp() {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctors = patientService.viewAllDoctors(); 
        mv.addObject("doctorList", doctors); 
        mv.setViewName("viewalldoctorsp"); 
        return mv;
    }

    
    @GetMapping("/viewPatientAppointments")
    public String viewPatientAppointments(Model model, HttpServletRequest request) {
        // Retrieve the logged-in patient from the session
        Patient patient = (Patient) request.getSession().getAttribute("pa");  // "pa" is the session attribute for logged-in patient

        // If no patient is found in the session, redirect to session fail page
        if (patient == null) {
            return "redirect:/patientsessionfail"; // Redirect to the session fail page
        }

        // Get all appointments for the logged-in patient
        List<Appointment> appointments = appointmentService.findAppointmentsByPatientId(patient.getId());

        // Add the appointments to the model
        model.addAttribute("appointments", appointments);

        // Return the view name to render the JSP page
        return "viewPatientAppointments"; // JSP page name
    }


}
