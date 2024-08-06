<template>
  <div>
    <h1>Available Pets</h1>
    <div class="pet-info container">
      <PetCard v-for="pet in pets" :pet="pet">
            <img :src="pet.profilePic" alt="Profile Picture">
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

h1 {
  color: #000000;
  text-align: center;
};

</style>
