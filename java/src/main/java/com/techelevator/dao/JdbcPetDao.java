package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Pet;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPetDao implements PetDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcPetDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Pet> getPets() {
        List<Pet> pets = new ArrayList<>();
        String sql = "SELECT pet_id, species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted\n" +
                "\tFROM pets;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Pet pet = mapRowToPet(results);
                pets.add(pet);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pets;
    }

    private Pet mapRowToPet(SqlRowSet rs) {
        Pet pet = new Pet();
        pet.setId(rs.getInt("pet_id"));
        pet.setSpecies(rs.getString("species"));
        pet.setGender(rs.getString("gender"));
        pet.setAge(rs.getInt("age"));
        pet.setName(rs.getString("name"));
        pet.setBreed(rs.getString("breed"));
        pet.setPetSize(rs.getString("pet_size"));
        pet.setColor(rs.getString("color"));
        pet.setDescription(rs.getString("description"));
        pet.setProfilePic(rs.getString("profile_pic"));
        pet.isAdopted();
        return pet;
    }
}