<template>
  <div id="logo">
    <img src="../Pictures/logo.png" alt="logo">
  </div>
  <div id="register" class="text-center ">
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

#register {
  margin: 0 auto;
  width: 350px;
  /* Adjust width if needed */
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: var(--background-color);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;

}

h1 {
  color: var(--primary-color);
  margin-bottom: 30px;
  font-size: 40px;
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
  width: 100%;
  /* Ensure inputs take up full width of container */
  margin-bottom: 1rem;
  color: var(--text-color);
  display: flex;
  flex-direction: column;
  align-items: center;
  /* Center the contents horizontally */
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 600;
}

input {
  width: 100%;
  /* Make input fields take full width of .form-input-group */
  max-width: 300px;
  /* Constrain the maximum width of the input fields */
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
</style>
