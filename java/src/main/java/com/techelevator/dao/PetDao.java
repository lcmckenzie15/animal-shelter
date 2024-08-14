package com.techelevator.dao;

import com.techelevator.model.Pet;

import java.util.List;

public interface PetDao {

    List<Pet> getPets(int minAge, int maxAge, String species, String gender, String petSize);

    Pet getPetById(int petId);

    Pet updatePetStatus(Pet pet);

    Pet createPet(Pet pet);

    List<Pet> get3RandomPets();

    Pet updatePetListing(Pet pet);
}
