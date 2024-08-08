<template>
  <div class="pet-card">
    <div class="ribbon-wrapper" v-if="pet.adopted">
      <div class="ribbon-green" v-if="pet.adopted">
        <span>Adopted</span>
      </div>
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

.ribbon-wrapper {
  position: absolute;
  top: 10px;
  right: -10px;
  width: 75px;
  height: 75px;
  overflow: hidden;
}

.ribbon-green {
  position: absolute;
  top: 19px;
  right: -21px;
  transform: rotate(45deg);
  background-color: #33B819;
  color: white;
  padding: 5px 0;
  width: 100px;
  text-align: center;
  box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
}
</style>
