<template>
  <div class="container-fluid p-5 text-dark text-center">
    <h1>AdopTE</h1>
    <p>Welcome to AdopTE, where every pet's journey to a loving home begins. 
      Our mission is to unite compassionate individuals with animals in need through our comprehensive adoption services, 
      engaging volunteer opportunities, and valuable resources. At AdopTE, 
      we're dedicated to ensuring that each furry friend finds a safe and joyful life.
      Join us in making a positive impact, one adoption at a time.</p>
  </div>

  
  <div class="d-flex justify-content-center">
    
    <div id="carousel1" class="carousel slide mx-2" data-bs-ride="carousel">
      
      <!-- <div class="carousel-indicators">
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="0"></button>
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="2"></button>
      </div> -->
      
      <div class="carousel-inner">
        <div class="carousel-item" v-for="(pet, index) in pets" :key="pet.id" :class="{'active': index == 0}">
          <img v-bind:src="pet.profilePic" alt="Pet 1" class="d-block w-100">
        </div>
      </div>
      
      <button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </div>
</template>

<script>
import PetService from '../services/PetService';

export default {
  data(){
    return {
      pets: []
    }
  },
  created(){
    PetService.getRandomPets().then((response) =>  {
      this.pets = response.data;
    });
    
  }
};
</script>

<style scoped>
p {
  font-weight: 600;
}

.carousel {
  width: 350px;
  height: 200px;
}

.carousel img {
  
  height: 100%;
 
}
</style>
