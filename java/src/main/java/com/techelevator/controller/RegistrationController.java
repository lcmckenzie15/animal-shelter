package com.techelevator.controller;

import com.techelevator.dao.RegistrationDao;
import com.techelevator.exception.DuplicateEmailException;
import com.techelevator.model.Registration;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;

@RestController
@CrossOrigin
public class RegistrationController {

    private RegistrationDao registrationDao;

    public RegistrationController(RegistrationDao registrationDao) {
        this.registrationDao = registrationDao;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/registration", method = RequestMethod.POST)
    public Registration addRegistration(@RequestBody @Valid Registration registration) {
        try {
            if (registration == null) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
            }
            return registrationDao.createRegistration(registration);
        } catch(DuplicateEmailException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Email is already registered.");
        }

    }




}
