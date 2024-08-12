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
      <button type="submit" @click="changePassword">Sign in</button>
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
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },

    changePassword() {
      if(changed_password == false) {
        this.$router.push( {name: 'register'});
      }
      
authService.updatePassword(this.user)


    }

  }
};
</script>

<style scoped>
:root {
  --primary-color: #607D8B;

  --secondary-color: #CFD8DC;

  --accent-color: #FF5722;

  --background-color: #ECEFF1;

  --text-color: #263238;

}

#volunteer-btn #register{
  color: #263238;
  margin-left: 10px;
}

#volunteer-btn #register:hover{
  text-decoration: underline;
  color: #FF5722;
}

#logo {
  text-align: center;
  margin-bottom: 10px; 
}

img {
  width: 600px;
  height: auto;
}

#login {
  margin: 0 auto;
  width: 300px;
  font-size: 22px;
  margin-top: -70px; 
  padding-left: 26px;
}

h1 {
  color: var(--primary-color);
  margin-bottom: 10px; 
}

button:hover {
  color: #FF5722;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
  transform: translateY(-5px);
}

button {
 display: flex;
margin-left: 95px;
font-size: 20px;
margin-top: 20px;
margin-bottom: 10px;
cursor: pointer; 
  transition: all 0.3s ease; 
}


.form-input-group {
  margin-bottom: 1rem;
  color: var(--text-color);
}

label {
  margin-right: 0.5rem;
}

#register {
  color: var(--text-color);
}

.invalid {
  color: red;
  width: 400px;
}
</style>