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
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Age:</strong> {{ pet?.age }} years old</td></tr>
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Breed:</strong> {{ pet?.breed }}</td></tr>
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Size:</strong> {{ pet?.petSize }}</td></tr>
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Gender:</strong> {{ pet?.gender }}</td></tr>
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Color:</strong> {{ pet?.color }}</td></tr>
    <tr class="spacer"><td></td></tr>
    <tr><td><strong>Description:</strong> {{ pet?.description }}</td></tr>
    <tr class="spacer"><td></td></tr>
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

<style scoped>
.dog-pic {
    width: 500px;
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
    border: 5px solid #607D8B;
    border-radius: 8px;
    width: 600px;
    height: 400px;
    margin-top: 30px;
    background-color: #fff;
    border-spacing: 0 10px;
   font-size: 20px;
   color: #263238;
}

.pet-stuff tr {
    padding: 10px 0; 
    color: #263238
}

.pet-adopt-button {
    margin-top: 200px;
    font-size: 40px;
    margin-left: 40%;
    transition: all 0.3s ease; 
}

.pet-adopt-button:hover {
    color: #FF5722;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
    transform: translateY(-5px);
}

tr th {
    border: solid 5px #607D8B;
    text-align: center;
    font-size: large;
    color: #263238;
}

tbody tr {
    font-weight: 600;

}

.spacer {
    height: 5px;
}

.spacer td {
    background-color: #fff;
}

</style>