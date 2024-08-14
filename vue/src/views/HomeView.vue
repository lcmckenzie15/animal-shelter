<template>
  <div class="container-fluid p-5 text-dark text-center">
    <p class="homepage-text">
      Welcome to AdopTE, where every pet's journey to a loving home begins.
      Our mission is to unite compassionate individuals with animals in need through our comprehensive adoption
      services, engaging volunteer opportunities, and valuable resources. At AdopTE,
      we're dedicated to ensuring that each furry friend finds a safe and joyful life.
      Join us in making a positive impact, one adoption at a time.
    </p>
  </div>

  <div class="d-flex justify-content-center">
    <div id="carousel1" class="carousel slide mx-2" data-bs-ride="carousel" data-bs-interval="3000">
      <div class="carousel-inner">
        <div class="carousel-item" v-for="(chunk, index) in chunkedPets" :key="index" :class="{ 'active': index == 0 }">
          <div class="row">
            <div class="col-4" v-for="pet in chunk" :key="pet.id">
              <a :href="'/pets/' + pet.id">
                <img v-bind:src="pet.profilePic" alt="Pet Image" class="d-block w-100 img-fluid border">
              </a>
              <div class="pet-info rounded-pill">
                <span class="pet-details">{{ pet.name }} - Age: {{ pet.age }}</span>
              </div>
            </div>
          </div>
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
  data() {
    return {
      pets: []
    }
  },
  computed: {
    chunkedPets() {
      return this.pets.reduce((resultArray, item, index) => {
        const chunkIndex = Math.floor(index / 3);
        if (!resultArray[chunkIndex]) {
          resultArray[chunkIndex] = [];
        }
        resultArray[chunkIndex].push(item);
        return resultArray;
      }, []);
    }
  },
  created() {
    PetService.getRandomPets().then((response) => {
      this.pets = response.data;
    });
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

* {
  font-family: 'Poppins', sans-serif;
}

p.homepage-text {
  font-size: 1.5rem;
  font-weight: 600;
  padding: 0 100px;
  text-align: center;
  line-height: 1.7;
}

.carousel {
  width: 1000px;
  height: 400px;
  position: relative;
}

.carousel img {
  width: 100%;
  height: 250px;
  object-fit: cover;
  border: 3px solid #FF5722;
  border-radius: 10px;
  box-sizing: border-box;
  transition: transform 0.3s ease;
}

.carousel img:hover {
  transform: scale(1.05);
}

.carousel-control-prev,
.carousel-control-next {
  width: 50px;
  height: 50px;
  background-color: rgba(255, 87, 34, 0.5);
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 30%;
  transform: translateY(-50%);
  opacity: 1;
  z-index: 2;
}

.carousel-control-prev {
  left: -60px;
}

.carousel-control-next {
  right: -60px;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  filter: invert(1);
  width: 25px;
  height: 25px;
}

.pet-info {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 10px;
}

.pet-details {
  font-size: 1.2rem;
  background-color: #FF5722;
  color: white;
  padding: 5px 20px;
  border-radius: 50px;
  display: inline-block;
}
</style>
