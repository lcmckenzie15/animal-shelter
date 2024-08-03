<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'home' }">Adopt</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'home' }">Volunteer</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
:root {
    --primary-color: #607D8B;
   
    --secondary-color: #CFD8DC;
    /* test */
    --accent-color: #FF5722;
    
    --background-color: #ECEFF1;

    --text-color: #263238;
    
}

#nav {
  background-color: var(--primary-color);
  color: #CFD8DC;
}

a{
  color: var(--background-color);
  text-decoration: none;
}

a:visited{
  color: var(--background-color);
  text-decoration: none;
}

a:hover{
  color: var(--accent-color);
}

</style>
