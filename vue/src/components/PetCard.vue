<template>
  <!-- <div class="pet-card" v-if = "isAdopted">
    <img :src="pet.profilePic" :alt="`${pet.name}'s profile picture`" class="pet-image"/>
    <div class="pet-details">
      <h2 class="pet-name">Adopted</h2>
    </div> -->
  <!-- </div> -->
  <div class="pet-card">
    <img :src="pet.profilePic" :alt="`${pet.name}'s profile picture`" class="pet-image"/>
    <div class="pet-details">
      <h2 class="pet-name">{{ pet.name }}</h2>
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
.pet-card {
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  overflow: hidden;
  width: 200px;
  margin: 10px;
  text-align: center;
  background-color: #fff;
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
</style>

  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  <!-- <style scoped>
  .pet-card {
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    overflow: hidden;
    width: 200px;
    margin: 10px;
    text-align: center;
    background-color: #fff;
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
  </style> -->
  