<template>
<div id="logo">
<img src="../Pictures/logo.png" alt="logo">
</div>
  <div id="login">
    <form v-on:submit.prevent="login">
      <h1 >Please Sign In</h1>
      <div class="invalid" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Email:</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit" @click="login">Sign in</button>
      <p id="volunteer-btn">Want to volunteer?<router-link id="register" v-bind:to="{ name: 'volunteer' }">Apply!</router-link></p>
      
    </form>
  </div>
</template>



<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
  authService.login(this.user)
    .then(response => {
      if (response.status === 200) {
        this.$store.commit("SET_AUTH_TOKEN", response.data.token);
        this.$store.commit("SET_USER", response.data.user);

        if (!response.data.user.changedPassword) {
          this.$router.push({ 
            name: "changedpassword", 
             
          });
        } else {
          this.$router.push("/");
        }
      }
    })
    .catch(error => {
      console.log (error)
      const response = error.response;
      if (response.status === 401) {
        this.invalidCredentials = true;
      }
    });
},


    changePassword() {
      if(changed_password == false) {
        this.$router.push( {name: 'changedpassword'});
      }
      
authService.updatePassword(this.user)


    }

  }
};
</script>



<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

* {
  font-family: 'Poppins', sans-serif;
}

:root {
  --primary-color: #4A90E2;
  --secondary-color: #D0E2F2;
  --accent-color: #F5A623;
  --background-color: #F9F9F9;
  --text-color: #333;
}

#logo {
  text-align: center;
  margin-bottom: 20px; 
}

img {
  width: 800px;
  height: auto;
  margin-bottom: -100px;
}

#login {
  margin: 0 auto;
  width: 350px;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: var(--background-color);
  
}

h1 {
  color: var(--primary-color);
  margin-bottom: 30px;
  font-size: 40px; 
  text-align: center;
}

button {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 18px;
  color: white;
  background-color: #607d8b;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
  margin-top: 20px;
}

button:hover {
  background-color: #FF5722;
  transform: translateY(-2px);
}

.form-input-group {
  margin-bottom: 1rem;
  color: var(--text-color);
  display: flex;
  flex-direction: column;
  align-items: center;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 600;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
}

input:focus {
  border-color: var(--primary-color);
  outline: none;
  box-shadow: 0 0 5px rgba(74, 144, 226, 0.3);
}

.alert {
  color: #E74C3C;
  margin-bottom: 20px;
  font-size: 14px;
}

#volunteer-btn {
  text-align: center;
  font-size: 16px;
}

#volunteer-btn #register {
  color: var(--primary-color);
  text-decoration: none;
  font-weight: 600;
}

#volunteer-btn #register:hover {
  text-decoration: underline;
}
</style>