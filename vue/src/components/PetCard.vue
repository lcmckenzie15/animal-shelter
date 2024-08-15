<template>
  <div class="pet-card">
    <img :src="pet.profilePic" :alt="`${pet.name}'s profile picture`" class="pet-image"/>
    <div class="pet-details">
      <h2 class="pet-name">{{ pet.name }}</h2>
    </div>
    <div class="adopted-overlay" v-if="pet.adopted">
        <i class="fa-solid fa-heart"></i>
        <span class="adopted-text">ADOPTED</span>
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
  },
  methods: {
    isAdopted() {
      if (pet.adopted == true) {
        return true;
      } else {
        return false;
      }
    },
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

.pet-card {
  border: 1px solid #ddd;
  border-radius: 30px;
  width: 200px;
  margin: 10px;
  text-align: center;
  background-color: #fff;
  position: relative;
  overflow: hidden; 
}

.fa-heart {
  color: rgb(252, 100, 100); 
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 60px;
  transform: rotate(25deg);
}


.pet-image {
  width: 100%;
  height: 100%;
  object-fit: cover; 
  display: block; 
}

.pet-details {
  position: absolute;
  bottom: 0;
  width: 100%;
  background-color: #ff561e;
 
  border-bottom-left-radius: 30px;
  border-bottom-right-radius: 30px;
}

.pet-name {
  font-size: 1.2em;
  margin: 0;
  color: white;
}

.pet-breed,
.pet-age {
  font-size: 0.9em;
  margin: 5px 0;
}
</style>

