import axios from 'axios';
export default {
    getPets(params) {
        return axios.get('/pets', { params });
    },

    getPet(id) {
        return axios.get(`/pets/${id}`);
    },

    adoptPet(id, pet) {
        return axios.put(`/pets/${id}`, pet);
    },

    addNewPet(pet) {
        return axios.post("/pets", pet);
    },

    getRandomPets() {
        return axios.get('/pets/random');
    },

    updatePetListing(id, pet) {
        return axios.put(`/pets/details/${id}`, pet);
    }
}