import axios from 'axios';
export default {
    getPets(params) {
        return axios.get('/pets', { params });
    },
}