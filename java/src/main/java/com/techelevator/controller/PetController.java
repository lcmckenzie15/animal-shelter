package com.techelevator.controller;

import com.techelevator.dao.PetDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Pet;
import org.apache.coyote.Request;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
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
    public List<Pet> pets(@RequestParam(defaultValue = "0") int minage, @RequestParam(defaultValue = "99") int maxage,
                          @RequestParam(defaultValue = "%%") String species, @RequestParam(defaultValue = "%%") String gender, @RequestParam(defaultValue = "%%") String petSize) {
        return petDao.getPets(minage, maxage, species, gender, petSize);
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
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Pet not found.");
        }
    }

    @RequestMapping(path = "/pets", method = RequestMethod.POST)
    @PreAuthorize("isAuthenticated()")
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

    @RequestMapping(path = "/pets/random", method = RequestMethod.GET)
    public List<Pet> randomPets() {
        return petDao.get3RandomPets();
    }

    @RequestMapping(path = "/pets/details/{id}", method = RequestMethod.PUT)
    @PreAuthorize("isAuthenticated()")
    public Pet updatePetListing (@PathVariable int id, @Valid @RequestBody Pet pet) {
        try {
            pet.setId(id);
            return petDao.updatePetListing(pet);
        } catch(DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Pet not found.");
        }
    }
}
