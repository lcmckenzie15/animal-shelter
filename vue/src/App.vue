<template>
  <div id="capstone-app">
    <nav id="nav" class="navbar navbar-expand-sm" style="background-color: #607D8B;">
      <a href="/" id="home-page">
        <img id="home-image" src="@/Pictures/logo1.png" alt="Home" style="width:200px; background-color: #CFD8DC;"
          class="rounded-circle">
      </a>
      <div class="d-flex justify-content-center">
        <router-link class="nav-item text-decoration-none text-light px-5 fs-1"
          v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="nav-item text-decoration-none text-light px-5 fs-1"
          v-bind:to="{ name: 'pets' }">Adopt</router-link>
        <router-link class="nav-item text-decoration-none text-light px-5 fs-1"
          v-bind:to="{ name: 'volunteer' }">Volunteer</router-link>
      </div>
      <div>
        <router-link id="approve" class="nav-item text-decoration-none text-light px-5 fs-1"
          v-bind:to="{ name: 'applications' }" v-if="isAdmin()">Applications</router-link>
      </div>
      <div>
        <router-link id="login" class="nav-item text-decoration-none text-light px-5 fs-1" v-bind:to="{ name: 'login' }"
          v-if="$store.state.token == ''">Login</router-link>
        <router-link id="login" class="nav-item text-decoration-none text-light px-5 fs-1"
          v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    </nav>
    <p style="background-image: url('@/Pictures/Paw-Background.png');"></p>
    <router-view />
    <!-- <p style="background-image: url('@/Pictures/Paw-Background.png');"></p> -->
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

<script>
export default {
  methods: {
    isAdmin() {
      if (!this.$store.state.user.authorities) {
        return false;
      }
      if (this.$store.state.user.authorities.length == 0) {
        return false;
      }
      return this.$store.state.user.authorities[0].name == 'ROLE_ADMIN';
    },
  }
};

</script>

<style>
.nav-item:hover {
  color: #FF5722 !important;
}

/* #login {
  padding-left: 500px !important;
} */
</style>
