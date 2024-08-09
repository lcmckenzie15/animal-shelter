package com.techelevator.controller;

import com.techelevator.dao.PetDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Pet;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
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
    @RequestMapping(path = "/pets/{id}", method = RequestMethod.PUT)
    public Pet updatePetStatus (@PathVariable int id, @Valid @RequestBody Pet pet){
        try {
            pet.setId(id);
            return petDao.updatePetStatus(pet);
        }catch(DaoException e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "pet not found!!");
        }
    }

    @RequestMapping(path = "/pets", method = RequestMethod.POST)
    public Pet createPet (@RequestBody @Valid Pet pet) {
        try {
            if (pet == null) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
            }
            return petDao.createPet(pet);
        } catch (DaoException e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Please verify your pet info is valid.");
        }
    }
}
