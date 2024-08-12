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
      
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="2"></button>
      </div>
      
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="@/Pictures/logo.png" alt="Pet 1" class="d-block w-100">
        </div>
        <div class="carousel-item">
          <img src="@/Pictures/logo1.png" alt="Pet 2" class="d-block w-100">
        </div>
        <div class="carousel-item">
          <img src="@/Pictures/logo2.png" alt="Pet 3" class="d-block w-100">
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
export default {
};
</script>

<style scoped>
p {
  font-weight: 600;
}

.carousel {
  width: 300px;
  height: 200px;
}

.carousel img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
