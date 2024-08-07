import axios from 'axios';



export default{
    create(app) {
        return axios.post('/registration', app);
    }
};