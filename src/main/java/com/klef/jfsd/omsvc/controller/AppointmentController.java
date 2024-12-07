package com.klef.jfsd.omsvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.omsvc.model.Appointment;
import com.klef.jfsd.omsvc.model.Doctor;
import com.klef.jfsd.omsvc.model.Patient;
import com.klef.jfsd.omsvc.repository.AppointmentRepository;
import com.klef.jfsd.omsvc.repository.PatientRepository;
import com.klef.jfsd.omsvc.service.AppointmentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AppointmentController {

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private PatientRepository patientRepository;
    
    @Autowired
    private AppointmentService appointmentService;

    @GetMapping("/appointments")
    public String getAppointments(Model model) {
        List<Appointment> appointments = appointmentRepository.findAll();  // Fetch all appointments
        List<AppointmentWithPatient> appointmentsWithPatients = new ArrayList<>();

        for (Appointment appointment : appointments) {
            Patient patient = patientRepository.findById(appointment.getPatientId()).orElse(null);  // Fetch patient by patient_id
            appointmentsWithPatients.add(new AppointmentWithPatient(appointment, patient));
        }

        model.addAttribute("appointmentsWithPatients", appointmentsWithPatients);
        return "appointments";  // Return the view (JSP)
    }
    
    @GetMapping("/viewappointments")
    public ModelAndView viewAppointments(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        // Retrieve the doctor object from the session
        Doctor doctor = (Doctor) request.getSession().getAttribute("doc");

        if (doctor == null) {
            // If no doctor is logged in, redirect to session fail page
            mv.setViewName("doctorsessionfail");
            return mv;
        }

        // Fetch the doctorId from the session
        int doctorId = doctor.getId();

        // Fetch pending appointments for the logged-in doctor
        List<Appointment> pendingAppointments = appointmentService.getPendingAppointmentsByDoctorId(doctorId);

        // Add the list of pending appointments to the model
        mv.addObject("appointmentsWithPatients", pendingAppointments);

        // Return the view for displaying appointments
        mv.setViewName("viewappointments"); // This is the JSP page where the appointments will be shown
        return mv;
    }
    
    
    
    @PostMapping("/respondToAppointment")
    public String respondToAppointment(
            @RequestParam("appointmentId") int appointmentId, 
            @RequestParam("response") String response, 
            Model model) {

        // Fetch the appointment by ID
        Appointment appointment = appointmentService.findById(appointmentId);
        
        if (appointment != null) {
            // Set the response
            appointment.setResponse(response);
            
            // Update the status to 'Completed'
            appointment.setStatus("Completed");
            
            // Save the updated appointment
            appointmentService.save(appointment);
            
            model.addAttribute("message", "Response submitted successfully.");
        } else {
            model.addAttribute("message", "Appointment not found.");
        }

        // Redirect to the appointments page or show a success message
        return "redirect:/viewappointments"; // Redirect back to the view appointments page
    }




    // Helper class to store Appointment and Patient together
    public static class AppointmentWithPatient {
        private Appointment appointment;
        private Patient patient;

        public AppointmentWithPatient(Appointment appointment, Patient patient) {
            this.appointment = appointment;
            this.patient = patient;
        }

        public Appointment getAppointment() {
            return appointment;
        }

        public Patient getPatient() {
            return patient;
        }
    }
}
