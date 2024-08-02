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
    /* Primary Color */
    --secondary-color: #CFD8DC;
    /* Secondary Color */
    --accent-color: #CFD8DC;
    /* Accent Color */
    --background-color: #CFD8DC;
    /* Background Color */
}

#nav {
  background-color: var(--primary-color);
  color: #CFD8DC;
}

</style>