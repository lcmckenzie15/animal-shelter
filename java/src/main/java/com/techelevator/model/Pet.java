package com.techelevator.model;

public class Pet {

    private int id;
    private String species;
    private String gender;
    private int age;
    private String name;
    private String breed;
    private String petSize;
    private String color;
    private String description;
    private String profilePic;
    private boolean isAdopted;

    public Pet() {}

    public Pet(int id, String species, String gender, int age, String name, String breed,
               String petSize, String color, String description, String profilePic, boolean isAdopted) {
        this.id = id;
        this.species = species;
        this.gender = gender;
        this.age = age;
        this.name = name;
        this.breed = breed;
        this.petSize = petSize;
        this.color = color;
        this.description = description;
        this.profilePic = profilePic;
        this.isAdopted = isAdopted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getPetSize() {
        return petSize;
    }

    public void setPetSize(String petSize) {
        this.petSize = petSize;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public boolean isAdopted() {
        return isAdopted;
    }

    public void setAdopted(boolean isAdopted) {
        this.isAdopted = isAdopted;
    }
}
