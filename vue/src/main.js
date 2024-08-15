import { createApp } from 'vue'
import CapstoneApp from './App.vue'
import { createStore } from './store'
import router from './router'
import axios from 'axios'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'


axios.defaults.baseURL = import.meta.env.VITE_REMOTE_API;


let currentToken = localStorage.getItem('token');
let currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken) {

  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

const store = createStore(currentToken, currentUser);

const app = createApp(CapstoneApp);
app.use(store);
app.use(router);
app.mount('#app');