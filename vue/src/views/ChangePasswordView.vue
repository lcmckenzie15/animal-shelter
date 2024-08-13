<template>
  <div id="logo">
    <img src="../Pictures/logo.png" alt="logo">
  </div>
  <div id="register" class="text-center">
    <form v-on:submit.prevent="changePassword">
      <h1>Please Change Your Password</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="request.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" v-model="request.confirmPassword" required />
      </div>
      <button type="submit">Update</button>

    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      request: {
        password: '',
        confirmPassword: '',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems updating the password.',
      username: '', 
    };
  },
 
  methods: {
    changePassword() {
      if (this.request.password !== this.request.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
        return;
      } 
      
        authService.updatePassword(this.request)
          .then((response) => {
            if (response.status === 200) {
              this.$router.push({
                path: '/',
               
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            } else {
              this.registrationErrorMsg = 'An error occurred. Please try again.';
            }
          });
      }
    },
    clearErrors() {
      console.log('Clearing errors'); // Debugging line
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems updating the password.';
    },
  };
</script>

<style scoped>
#login-btn {
  color: var(--text-color);
 margin-left: -18px;
 margin-top: 15px;
}

#login-btn #router-two{
color: var(--accent-color);
margin-left: 5px;
}



#login-btn #router-two:hover{
  text-decoration: underline;

}

#logo {
  text-align: center;
  margin-bottom: 10px; 
}

img {
  width: 600px;
  height: auto;
}

#register {
  margin: 0 auto;
  width: 300px;
  font-size: 22px;
  margin-top: -80px; 
 
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
margin-left: 103px;
font-size: 20px;
margin-top: 30px;
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
</style>
