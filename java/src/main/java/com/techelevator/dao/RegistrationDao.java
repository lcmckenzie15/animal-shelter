package com.techelevator.dao;

import com.techelevator.model.Registration;

import java.util.List;

public interface RegistrationDao {

    List<Registration> getRegistrationForms();

    Registration getRegistrationById(int registrationId);

    Registration createRegistration(Registration registration);

    Registration updateRegistrationStatus(Registration registration);

}
