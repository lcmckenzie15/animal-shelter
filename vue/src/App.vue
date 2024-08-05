<template>
  <div id="capstone-app" >
    <div id="nav">
      <img src="@/Pictures/logo.png" alt="Home" class="logo" @click="goHome">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'home' }">Adopt</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'volunteer' }">Volunteer</router-link>&nbsp;|&nbsp;
      <router-link class="login-link" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
      <router-link class="login-link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    <router-view />
  </div>
  <div class="container-fluid my-5">

    <footer class="text-center text-white mt-auto" style="background-color: #ECEFF1; width: 100%;">
      <!-- Grid container -->
      <div class="container pt-4">
        <section class="mb-4">
    <!--social media icons-->
    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-facebook-f fa-2x" style="color: #3b5998;"></i>
          </a>
          <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-twitter fa-2x" style="color: #55acee;"></i>
          </a>
          <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-youtube fa-2x" style="color: #ed302f;"></i>
          </a>
          <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-instagram fa-2x" style="color: #ac2bac;"></i>
          </a>
          <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-linkedin-in fa-2x" style="color: #0082ca;"></i>
          </a>
          <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark">
            <i class="fab fa-reddit-alien fa-2x" style="color: #ff4500;"></i>
          </a>
    </section>
</div>
 <!-- Copyright -->
 <div class="text-center text-light p-3" style="background-color: #607D8B;">
        TechElevator © 2024 Copyright
      </div>
    </footer>

  </div>
</template>
<style>
:root {
	--primary-color: #607D8B;
	--secondary-color: #CFD8DC;
	--accent-color: #FF5722;
	--background-color: #ECEFF1;
	--text-color: #263238;
}
#nav {
  background-color: var(--background-color);
  color: var(--text-color);
  font-size: 25px;
  padding: 5px;
  display: flex;
  align-items: center;
}


.logo {
  width: 300px;
  height: auto;
  cursor: pointer;
  margin-right: auto;
}


.nav-links {
  display: flex;
  gap: 20px;
  flex-grow: 1;
}


a {
  color: var(--text-color);
  text-decoration: none;
}


a:visited {
  color: var(--text-color);
  text-decoration: none;
}


a:hover {
  color: var(--accent-color);
}


.login-link {
  color: var(--text-color);
  margin-left: auto;
}

.login-link:visited {
  color: var(--text-color);
}


</style>
