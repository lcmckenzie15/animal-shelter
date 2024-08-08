<template>
  <div id="capstone-app">
    <nav id="nav" class="navbar navbar-expand-sm" style="background-color: #607D8B;">
    <a href="/" id="home-page">
      <img id="home-image" src="@/Pictures/logo1.png" alt="Home" style="width:200px; background-color: #CFD8DC;" class="rounded-circle">
    </a>
      <div class="d-flex justify-content-center">
        <router-link class="nav-item text-decoration-none text-light px-5" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="nav-item text-decoration-none text-light px-5" v-bind:to="{ name: 'pets' }">Adopt</router-link>
        <router-link class="nav-item text-decoration-none text-light px-5" v-bind:to="{ name: 'volunteer' }">Volunteer</router-link>
      </div>
      <div>
        <router-link class="nav-item text-decoration-none text-light px-5" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
        <router-link class="nav-item text-decoration-none text-light px-5" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    </nav>
    <router-view />
    <div class="container-fluid my-5 p-0">
      <footer class="text-center text-white mt-auto" style="background-color: #CFD8DC;">
        <!-- Grid container -->
        <div class="container pt-4">
          <section class="mb-4">
            <!--social media icons-->
            <a class="btn btn-link btn-floating btn-lg m-1" href="#!" role="button" data-mdb-ripple-color="dark">
              <i class="fab fa-facebook-f fa-2x" style="color: #3b5998;"></i>
            </a>
            <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button"
              data-mdb-ripple-color="dark">
              <i class="fab fa-twitter fa-2x" style="color: #55acee;"></i>
            </a>
            <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button"
              data-mdb-ripple-color="dark">
              <i class="fab fa-youtube fa-2x" style="color: #ed302f;"></i>
            </a>
            <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button"
              data-mdb-ripple-color="dark">
              <i class="fab fa-instagram fa-2x" style="color: #ac2bac;"></i>
            </a>
            <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button"
              data-mdb-ripple-color="dark">
              <i class="fab fa-linkedin-in fa-2x" style="color: #0082ca;"></i>
            </a>
            <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button"
              data-mdb-ripple-color="dark">
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
  </div>
</template>
<style scoped>
/* :root {
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
} */
</style>
