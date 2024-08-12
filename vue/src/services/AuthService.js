import axios from 'axios';


export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },

  loginAdmin(admin) {
    return axios.post('/login', admin)
  },

  updatePassword(user) {
    return axios.put('/users/:id', user)
  }
}
