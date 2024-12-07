package com.klef.jfsd.omsvc.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="doctor_table")
public class Doctor 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name="doctor_id")
   private int id;

   @Column(name="doctor_name", nullable=false, length=50)
   private String name;

   @Column(name="doctor_email", nullable=false, unique=true, length=50)
   private String email;

   @Column(name="doctor_password", nullable=false, length=50)
   private String password;

   @Column(name="doctor_contact", nullable=false, unique=true, length=20)
   private String contact;

   @Column(name="doctor_specialization", nullable=false, length=50)
   private String specialization;

   @Column(name="doctor_experience_years")
   private int experienceYears;

   @Column(name="doctor_qualification", length=50)
   private String qualification;

   @Column(name="doctor_date_of_birth", nullable=false)
   private LocalDate dateOfBirth;

   @Column(name="doctor_gender", length=10)
   private String gender;

   @Column(name="doctor_consultation_fee")
   private double consultationFee;

   // Getters and Setters
   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getContact() {
      return contact;
   }

   public void setContact(String contact) {
      this.contact = contact;
   }

   public String getSpecialization() {
      return specialization;
   }

   public void setSpecialization(String specialization) {
      this.specialization = specialization;
   }

   public int getExperienceYears() {
      return experienceYears;
   }

   public void setExperienceYears(int experienceYears) {
      this.experienceYears = experienceYears;
   }

   public String getQualification() {
      return qualification;
   }

   public void setQualification(String qualification) {
      this.qualification = qualification;
   }

   public LocalDate getDateOfBirth() {
      return dateOfBirth;
   }

   public void setDateOfBirth(LocalDate dateOfBirth) {
      this.dateOfBirth = dateOfBirth;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public double getConsultationFee() {
      return consultationFee;
   }

   public void setConsultationFee(double consultationFee) {
      this.consultationFee = consultationFee;
   }
}

