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
    }
}