<template>
  <div class="pet-card">
    <div class="main">
      <div class="ribbon-wrapper">
        <div class="ribbon-green">
          <span>Adopted</span>

        </div>
        <img :src="pet.profilePic" :alt="`${pet.name}'s profile picture`" class="pet-image"/>
      </div>
      <div class="pet-details">
        <h2 class="pet-name">{{ pet.name }}</h2>
      </div>
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
  border-radius: 30px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  width: 200px;
  margin: 10px;
  text-align: center;
  background-color: #fff;
  position: relative;
  overflow: hidden; /* Ensure no overflow from child elements */
}

.main {
  display: block;
  width: 100%;
  height: 200px;
  margin: 0;
  border-radius: 30px;
  position: relative;
  overflow: hidden; /* Ensure image does not overflow */
}

.ribbon-wrapper {
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
}

.ribbon-green {
  color: #fff;
  text-align: center;
  transform: rotate(25deg);
  position: absolute;
  top: 10px; /* Adjust as needed */
  right: 10px; /* Adjust as needed */
  background-color: #33b819;
  padding: 7px; /* Ensure padding is set properly */
  display: flex;
  flex-direction: column;
  align-items: center;
}

.pet-image {
  width: 100%;
  height: 100%;
  object-fit: cover; /* Ensures the image covers the container */
  display: block; /* Remove any potential inline display issues */
}

.pet-details {
  padding: 10px;
  position: absolute;
  bottom: 0;
  width: 100%;
  background: rgb(250, 139, 105);
  border-bottom-left-radius: 30px;
  border-bottom-right-radius: 30px;
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

