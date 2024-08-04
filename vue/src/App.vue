<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">
        <img :src="logo" alt="logo" class="logo" />
      </router-link>
      <router-link v-bind:to="{ name: 'adopt' }">Adopt</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'volunteer' }">Volunteer</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<script>
import logo from '@/assets/logo.png';

export default {
  data() {
    return {
      logo
    };
  }
};
</script>

<style>
:root {
    --primary-color: #607D8B;

    --secondary-color: #CFD8DC;

    --accent-color: #FF5722;

    --background-color: #ECEFF1;

    --text-color: #263238;
}

.logo {
  width: 100px; /* Adjust size as needed */
  height: auto; /* Maintain aspect ratio */
}


#nav {
  background-color: var(--primary-color);
  color: #CFD8DC;
  font-size: 25px;
  padding: 100px 300px 20px; 
  display: flex; 
  gap: 20px; 
  align-items: center; /* Vertically align items */
}

a {
  color: var(--background-color);
  text-decoration: none;
}

a:visited {
  color: var(--background-color);
  text-decoration: none;
}

a:hover {
  color: var(--accent-color);
}

</style>
