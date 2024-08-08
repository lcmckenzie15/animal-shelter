<template>
  <div class="pet-card">
    <div class="adopted-overlay" v-if="pet.adopted">
        <i class="fa-solid fa-heart"></i>
        <span class="adopted-text">ADOPTED</span>
    </div>
    <img :src="pet.profilePic" :alt="`${pet.name}'s profile picture`" class="pet-image" />
    <div class="pet-details">
      <h2 class="pet-name">{{ pet.name }}</h2>
      <p class="pet-breed">{{ pet.breed }}</p>
      <p class="pet-age">{{ pet.age }} years old</p>
      <p class="pet-description">{{ pet.description }}</p>
      <p class="pet-size">{{ pet.petSize }}</p>
      <p class="pet-color">{{ pet.color }}</p>
      <p class="pet-gender">{{ pet.gender }}</p>
      <button class="pet-adopt-button" @click="adoptPet" :disabled="pet.adopted">
        {{ pet.adopted ? 'Already Adopted' : 'Adopt' }}
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    pet: {
      type: Object,
      required: true
    }
  }
  
};
</script>

<style scoped>

.adopted-text {
  color: white;
  font-size: 11px;
  position: absolute;
  transform: translate(-50%, -50%);
  font-weight: bold;
  top: 28px;
  right: 12px;
transform: rotate(25deg);
}

.fa-heart {
  color: rgb(252, 100, 100); 
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 60px;
  transform: rotate(25deg);
}

.pet-card {
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  width: 200px;
  margin: 10px;
  text-align: center;
  background-color: #fff;
  position: relative;
}

.pet-image {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.pet-details {
  padding: 10px;
}

.pet-name {
  font-size: 1.2em;
  margin: 0;
}

.pet-breed,
.pet-age {
  font-size: 0.9em;
  margin: 5px 0;
}

.pet-description,
.pet-size,
.pet-color,
.pet-gender {
  font-size: 0.8em;
  margin: 5px 0;
}

.pet-adopt-button {
  background-color: #FF5722;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  disabled: true;
}


</style>
