<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">
        <img src="../Pictures/home-logo.png" alt="Home" class="home-logo">
      </router-link>
      <router-link v-bind:to="{ name: 'home' }">Adopt</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'volunteer' }">Volunteer</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
/* :root {
    --primary-color: #607D8B;

    --secondary-color: #CFD8DC;

    --accent-color: #FF5722;

    --background-color: #ECEFF1;

    --text-color: #263238;
}
#nav {
  background-color: var(--primary-color);
  color: var(--secondary-color);
  font-size: 25px;
  padding: 20px 300px; 
  display: flex; 
  gap: 20px; 
  align-items: center; 
}

.home-logo {
  width: 100px;
  height: auto;
cursor: pointer;
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
} */

</style>
