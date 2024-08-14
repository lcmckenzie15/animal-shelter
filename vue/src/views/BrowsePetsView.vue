<template>
  <div class="container">
    <button
      id="add-pet-button"
      type="button"
      class="btn btn-lg"
      @click="$router.push(`/add-new-pet`)"
      v-if="$store.state.token !== ''"
    >
      Add A Pet
    </button>
    
    <h1 class="title">Available Pets</h1>
    
    <div class="filters-container">
      <label for="filter1">Filter by Age: </label>
      <select name="filter1" v-model="ageFilter" v-on:change="getPetsByParams">
        <option value="all">All Ages</option>
        <option value="A">0 - 2 years</option>
        <option value="B">3 - 5 years</option>
        <option value="C">6+ years</option>
      </select>

      <label for="filter2">Filter by Species: </label>
      <select name="filter2" v-model="speciesFilter" v-on:change="getPetsByParams">
        <option value="all">All Species</option>
        <option value="cat">Cats</option>
        <option value="dog">Dogs</option>
      </select>

      <label for="filter3">Filter by Gender: </label>
      <select name="filter3" v-model="genderFilter" v-on:change="getPetsByParams">
        <option value="all">All Genders</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
      </select>
      
      <label for="filter4">Filter by Size: </label>
      <select name="filter4" v-model="sizeFilter" v-on:change="getPetsByParams">
        <option value="all">All Sizes</option>
        <option value="small">Small</option>
        <option value="medium">Medium</option>
        <option value="large">Large</option>
        <option value="x-large">X-Large</option>
      </select>
    </div>

    <div class="pet-info">
      <PetCard
        class="pet-card"
        v-for="pet in pets" :key="pet.id" :pet="pet"
        @click="$router.push(`/pets/${pet.id}`)"
      >
        <img :src="pet.profilePic" alt="Profile Picture" class="pet-image">
        <div class="pet-details">
          <h2 class="pet-name">{{ pet.name }}</h2>
          <p class="pet-description">{{ pet.description }}</p>
        </div>
      </PetCard>
    </div>
  </div>
</template>

<script>
import PetCard from '../components/PetCard.vue';
import petService from '../services/PetService.js';

export default {
  components: {
    PetCard
  },
  data() {
    return {
      pets: [],
      invalidCredentials: false,
      params: {},
      ageFilter: '',
      speciesFilter: '',
      genderFilter: '',
      sizeFilter: ''
    };
  },
  methods: {
    getPetsByParams() {
      this.params = {};
      if (this.ageFilter === 'A') {
        this.params.minage = 0;
        this.params.maxage = 2;
      } else if (this.ageFilter === 'B') {
        this.params.minage = 3;
        this.params.maxage = 5;
      } else if (this.ageFilter === 'C') {
        this.params.minage = 6;
      } 
       
      if (this.speciesFilter === 'cat') {
        this.params.species = "cat";
      } else if (this.speciesFilter === 'dog') {
        this.params.species = "dog";
      }

      if (this.genderFilter === 'male') {
        this.params.gender = "male";
      } else if (this.genderFilter === 'female') {
        this.params.gender = "female";
      } 

      if (this.sizeFilter === 'small') {
        this.params.petSize = "small";
      } else if (this.sizeFilter === 'medium') {
        this.params.petSize = "medium";
      } else if (this.sizeFilter === 'large') {
        this.params.petSize = "large";
      } else if (this.sizeFilter === 'x-large') {
        this.params.petSize = "x-large"
      }

      petService.getPets(this.params).then ((response) =>{
        this.pets = response.data;
      });
      
    }
  },
  async mounted() {
    try {
      const response = await petService.getPets();
      console.log('Fetched pets:', response.data);
      this.pets = response.data;
    } catch (error) {
      console.error('Error fetching pets:', error);
      this.invalidCredentials = true;
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

* {
  font-family: 'Poppins', sans-serif;
}


.container {
  position: relative;
  padding: 40px;
  max-width: 2000px;
  margin: 0 auto;
  border-radius: 12px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

#add-pet-button {
  background: radial-gradient(circle at 50% top, #FF5722, #FF7043);
  border: none;
  color: white;
  border-radius: 50px;
  padding: 12px 30px;
  font-size: 1.25rem;
  font-weight: 600;
  text-transform: uppercase;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  transition: background 0.4s, box-shadow 0.4s, transform 0.3s;
  position: relative;
}

#add-pet-button::before {
  content: '';
  position: absolute;
  top: 80%;
  left: 50%;
  width: 170%;
  height: 300%;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  transition: opacity 0.4s;
}

#add-pet-button:hover {
  background: radial-gradient(circle at 50% bottom, #FF7043, #FF5722);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
  transform: scale(1.05);
}

#add-pet-button:hover::before {
  opacity: 0;
}

.title {
  color: #333;
  font-size: 3rem;
  font-weight: 700;
  text-align: center;
  margin-bottom: 40px;
  text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
}

.filters-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 15px;
  margin-bottom: 40px;
}

.filters-container label {
  margin-right: 10px;
  font-size: 1.7rem;
  color: #333; /* Make the label text stand out */
}

.filters-container select {
  padding: 10px 20px;
  font-size: 1.0rem; /* Slightly increased font size for better readability */
  border: none;
  border-radius: 50px; /* Rounded pill shape */
  background: #607D8B; /* Distinct background color */
  color: #fff; /* White text for contrast */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  transition: background 0.3s, box-shadow 0.3s, transform 0.3s;
}

.filters-container select:focus {
  background: #607D8B; /* Slightly lighter background on focus */
  outline: none;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.filters-container select option {
  background: #607D8B; /* Ensure options match filter pill color */
  color: #fff;
}

.pet-info {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 30px;
  padding: 20px;
}

.pet-card {
  background: #ffffff;
  overflow: hidden;
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
  cursor: pointer;
  width: 300px;
  transition: transform 0.3s, box-shadow 0.3s;
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.pet-card:hover {
  transform: scale(1.05);
  box-shadow: 0 16px 32px rgba(0, 0, 0, 0.2);
}

.pet-card::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: linear-gradient(90deg, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 100%);
  transform: rotate(-30deg);
  opacity: 0;
  transition: opacity 0.4s, transform 0.4s;
}

.pet-card:hover::before {
  opacity: 1;
  transform: translateX(100%) rotate(-10deg);
}

.pet-card:hover .pet-image {
  transform: scale(1.1);
  filter: brightness(1.2);
}

.pet-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border: 4px solid transparent;
  border-image: linear-gradient(to right, #FF5722, #FF7043);
  border-image-slice: 1;
  border-image-width: 4px;
  transition: transform 0.3s, filter 0.3s;
}

.pet-card:hover .pet-image {
  transform: scale(1.1);
}

.pet-details {
  padding: 20px;
  text-align: center;
  width: 100%;
}

.pet-name {
  font-size: 1.5rem;
  font-weight: 600;
  margin: 10px 0;
}

.pet-description {
  font-size: 1rem;
  color: #666;
}
</style>
