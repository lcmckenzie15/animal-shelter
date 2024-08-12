package com.techelevator.controller;

import com.techelevator.dao.RegistrationDao;
import com.techelevator.exception.DaoException;
import com.techelevator.exception.DuplicateEmailException;
import com.techelevator.model.Registration;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class RegistrationController {

    private RegistrationDao registrationDao;

    public RegistrationController(RegistrationDao registrationDao) {
        this.registrationDao = registrationDao;
    }

    @RequestMapping(path = "/registration/forms", method = RequestMethod.GET)
    public List<Registration> registrationForms() {
        return registrationDao.getRegistrationForms();
    }

    @RequestMapping(path ="/registration/forms/{id}", method = RequestMethod.GET)
    public Registration getRegistrationById (@PathVariable int id) {
        Registration registration = registrationDao.getRegistrationById(id);
        if (registration == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Registration form does not exist.");
        }
        return registration;
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

    @RequestMapping(path = "/registration/forms/{id}", method = RequestMethod.PUT)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public Registration updateRegistrationStatus(@PathVariable int id, @Valid @RequestBody Registration registration) {
        try {
            registration.setRegistrationId(id);
            return registrationDao.updateRegistrationStatus(registration);
        } catch(DaoException e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Registration form not found.");
        }

    }









}
