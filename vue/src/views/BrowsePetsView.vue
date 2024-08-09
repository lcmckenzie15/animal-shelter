<template>
  
  <div>
    
    <button id="add-pet-button" type=button class="btn btn-lg position-absolute translate-middle start-50 mt-4" style="background-color: #FF5722;" @click="$router.push(`/add-new-pet`)" v-if="$store.state.token != ''">Add A Pet</button>
      
    <h1 class="p-5 text-center">Available Pets</h1>
    <div class="pet-info container">
      <PetCard 
        class="pet-card bg-image" 
        v-for="pet in pets" :key="pet.id" :pet="pet"
        @click="$router.push(`/pets/${pet.id}`)">
        <img :src="pet.profilePic" alt="Profile Picture" class="w-100">
     
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
    invalidCredentials: false
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
.pet-info {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 20px;
  
}

.pet-card {
  transition: transform 0.5s ease, box-shadow 0.3s ease; 
  cursor: pointer; 
}

.pet-card:hover {
  transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
  transition: transform 0.5s ease, box-shadow 0.3s ease; 
}


</style>
