<template>
<div id="logo">
<img src="../Pictures/logo.png" alt="logo">
</div>
  <div id="login">
    <form v-on:submit.prevent="login">
      <h1 >Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Email</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit">Sign in</button>
      <p>
      <router-link id="register" v-bind:to="{ name: 'register' }">Want to volunteer? Sign up.</router-link></p>
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

.form-input-group {
  margin-bottom: 1rem;
}
label {
  margin-right: 0.5rem;
}

#register{
  color: var(--text-color);
}

img{
  width: 700px;
  height: auto;
  text-align: center;
  
}

h1{
  color: var(--primary-color);

}

button:hover{
  color: var(--accent-color);
}

.form-input-group {
  color: var(--text-color);
}

#login {
  margin: 0 auto;
  width: 300px;
  font-size: 22px;
}


</style>