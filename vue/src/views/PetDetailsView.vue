<template>
    <div class="container">
    <div class="row">
        <div class="col ">
    <button class="go-back-button" @click="$router.push(`/pets`)">Back </button>
    <div>
    <img :src="pet.profilePic" alt="Profile Picture" class="dog-pic">
</div>
</div>
       
        <div class="col ">
  <h1 class="name of pet">{{ pet?.name }}</h1>
</div>



<div class="col">
<table class="pet-stuff">
    <thead>
        <tr>
            <th>Details</th>
        </tr>
    </thead>
<tbody>
    <tr>Age: {{ pet?.age }} years old</tr>
  <tr>Breed: {{ pet?.breed }}</tr>
<tr>Size: {{ pet?.petSize }}</tr>
<tr>gender: {{ pet?.gender }}</tr>
<tr>color: {{ pet?.color }}</tr>
<tr>description: {{ pet?.description }}</tr>
</tbody>
</table>
<div>
    <button class="pet-adopt-button">Adopt</button>
</div>
</div>
</div>

</div >
</template>

<script>
import petService from '../services/PetService.js';
import Pet from '../components/PetDetails.vue';

export default  {
    components: {
        Pet
    },
    data() {
        return {
            pet: {}
        }
    },
    created() {
        petService.getPet(this.$route.params.id)
        .then(response => {
            this.pet = response.data;
        })
    }
}

</script>

<style>
.dog-pic {
    width: 300px;
margin-top: 100px;
border: solid #FF5722 5px;
border-radius: 25px;
}

.go-back-button {
   margin-top: 20px;
   cursor: pointer; 
  transition: all 0.3s ease; 
}

.name-of-pet {
    padding-top: 20px;
}

.go-back-button:hover {
  color: #FF5722;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
  transform: translateY(-5px);

}

.pet-stuff {
    border: 3px solid black;
    border-radius: 8px;
    width: 500px;
    margin-top: 30px;
    background-color: #fff;
}

.pet-adopt-button {
    margin-top: 200px;
    font-size: 40px;
}

</style>