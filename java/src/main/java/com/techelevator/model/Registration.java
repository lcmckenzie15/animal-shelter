package com.techelevator.model;

import java.time.LocalDate;

public class Registration {

    private int registrationId;
    private String email;
    private String phoneNumber;
    private LocalDate dateOfBirth;
    private String firstName;
    private String lastName;
    private String status;

    // Constructors

    public Registration(){}

    public Registration(int registrationId, String email, String phoneNumber, LocalDate dateOfBirth,
                        String firstName, String lastName, String status) {
        this.registrationId = registrationId;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dateOfBirth = dateOfBirth;
        this.firstName = firstName;
        this.lastName = lastName;
        this.status = status;
    }

    // Getters
    public int getRegistrationId() {
        return registrationId;
    }
    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getStatus() {
        return status;
    }

    // Setters
    public void setRegistrationId(int registrationId) {
        this.registrationId = registrationId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
