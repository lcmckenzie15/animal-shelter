import axios from 'axios';



export default{
    create(app) {
        return axios.post('/registration', app);
    },

    getRegistrations(params) {
        return axios.get('/registration/forms', { params });
    },

    getRegistrationById(id) {
        return axios.get(`registration/forms/${id}`);
    },
    updateRegistrationStatus(id, registration) {
        return axios.put(`/registration/forms/${id}`, registration);
    }
};