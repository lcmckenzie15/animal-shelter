package com.techelevator.controller;

import com.techelevator.dao.PetDao;
import com.techelevator.model.Pet;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
public class PetController {

    private PetDao petDao;

    public PetController(PetDao petDao) {
        this.petDao = petDao;
    }

    @RequestMapping(path = "/pets", method = RequestMethod.GET)
    public List<Pet> pets() {
        return petDao.getPets();
    }

    @RequestMapping(path = "/pets/{id}", method = RequestMethod.GET)
    public Pet getPetById (@PathVariable int id) {
        Pet pet = petDao.getPetById(id);
        if (pet == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Pet doesn't exists");
        }
        return pet;
    }

}
