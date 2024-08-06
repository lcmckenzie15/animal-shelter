package com.techelevator.dao;

import com.techelevator.model.Registration;

public interface RegistrationDao {

    Registration getRegistrationById(int registrationId);
    Registration createRegistration(Registration registration);

}
