<template>
  <div class="container" v-if="pet.adopted">
    <div class="row">
      <div class="col image-col">
        <button class="go-back-button" @click="$router.push('/pets')">Back</button>
        <div class="image-container">
          <div class="adopted-overlay" v-if="pet.adopted">
            <i class="fa-solid fa-heart"
              style="color: rgb(252, 100, 100); position: absolute; top: 10px; right: 10px; font-size: 100px; transform: rotate(25deg);"></i>
            <span class="adopted-text">ADOPTED</span>
            <img :src="pet.profilePic" alt="Profile Picture" class="dog-pic" />
          </div>
        </div>
      </div>
      <div class="col details-col">
        <h1 class="name-of-pet">{{ pet?.name }}</h1>
        <table class="pet-stuff">
          <thead>
            <tr>
              <th>Details</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Age:</strong> {{ pet?.age }} years old</td>
            </tr>
            <tr>
              <td><strong>Breed:</strong> {{ pet?.breed }}</td>
            </tr>
            <tr>
              <td><strong>Size:</strong> {{ pet?.petSize }}</td>
            </tr>
            <tr>
              <td><strong>Gender:</strong> {{ pet?.gender }}</td>
            </tr>
            <tr>
              <td><strong>Color:</strong> {{ pet?.color }}</td>
            </tr>
            <tr>
              <td><strong>Description:</strong> {{ pet?.description }}</td>
            </tr>
          </tbody>
        </table>
        <div class="button-container">
          <button class="pet-adopt-button" v-on:click="handleAdoptClick" data-toggle="modal"
            data-target="#congratsModel">Adopt</button>
          <button class="pet-update-button" @click="$router.push('/pets/${pet.id}/edit')"
            v-if="$store.state.token != ''">Update</button>
        </div>
      </div>
    </div>
  </div>
  <div class="container" v-else>
    <div class="row">
      <div class="col image-col">
        <button class="go-back-button" @click="$router.push('/pets')">Back</button>
        <div class="image-container">
          <img :src="pet.profilePic" alt="Profile Picture" class="dog-pic-no-adopt" />
        </div>
      </div>
      <div class="col details-col">
        <h1 class="name-of-pet">{{ pet?.name }}</h1>
        <table class="pet-stuff">
          <thead>
            <tr>
              <th>Details</th>
            </tr>
          </thead>
          <div class="table-body">
          <tbody>
            <tr>
              <td><strong>Age:</strong> {{ pet?.age }} years old</td>
            </tr>
            <tr>
              <td><strong>Breed:</strong> {{ pet?.breed }}</td>
            </tr>
            <tr>
              <td><strong>Size:</strong> {{ pet?.petSize }}</td>
            </tr>
            <tr>
              <td><strong>Gender:</strong> {{ pet?.gender }}</td>
            </tr>
            <tr>
              <td><strong>Color:</strong> {{ pet?.color }}</td>
            </tr>
            <tr>
              <td><strong>Description:</strong> {{ pet?.description }}</td>
            </tr>
          </tbody>
        </div>
        </table>
        <div class="button-container">
          <button class="pet-adopt-button" v-on:click="handleAdoptClick">Adopt</button>
          <button class="pet-update-button" @click="$router.push(`/pets/${pet.id}/edit`)" v-if="$store.state.token != ''">Update</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import petService from '../services/PetService.js';
import Pet from '../components/PetDetails.vue';
import confetti from 'canvas-confetti';

export default {
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
  },
  methods: {
    adoptPet() {
      petService.adoptPet(this.pet.id, this.pet);
    },
    navigateToPets() {
      window.location.reload();
    },
    handleAdoptClick() {
      this.launchConfetti();
      this.adoptPet();
      setTimeout(() => {
        this.navigateToPets();
      }, 1000);
    },
    launchConfetti() {
      confetti({
        particleCount: 100,
        spread: 70,
        origin: { y: 0.6 }
      });
    }
  }
}
</script>

<style scoped>


.adopted-text {
  color: white;
  font-size: 18px;
  position: absolute;
  transform: translate(-50%, -50%);
  font-weight: bold;
  top: 35px;
  right: 13px;
  transform: rotate(25deg);
}

.container {
  padding: 20px;
}

.row {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

.col {
  flex: 1;
}

.image-col {
  flex: 1;
  order: 1;
}

.details-col {
  flex: 2;
  order: 2;
}

.image-container {
  position: relative;
  width: 100%;
  max-width: 500px;
  margin-top: 30px;
}

.dog-pic,
.dog-pic-no-adopt {
  width: 100%;
  height: auto;
  border: solid #FF5722 5px;
  border-radius: 25px;
  object-fit: cover;
}

.go-back-button {
  margin-top: 20px;
  cursor: pointer;
  background-color: #FF5722;
  color: white;
  border: none;
  border-radius: 50px;
  padding: 10px 20px;
  transition: all 0.3s ease;
}

.go-back-button:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-5px);
}

.name-of-pet {
  padding-top: 20px;
  font-size: 32px;
  color: #FF5722;
  font-weight: bold;
  text-align: center;
  text-shadow: 2px 2px #FFCCBC;
}

.pet-stuff {
  border-radius: 12px;
  width: 100%;
  margin-top: 30px;
  background-color: rgba(96, 125, 139, 0.2);
  border-spacing: 0 10px;
  font-size: 20px;
  color: #263238;
  padding: 20px;
}

.pet-stuff th {
  background-color: rgba(96, 125, 139, 0.4);
  border-radius: 8px;
  text-align: center;
  font-size: large;
  padding: 10px;
  color: #263238;
}

.button-container {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 20px;
}

tbody tr td{
  padding: 10px 30px 10px 30px;
}


.pet-adopt-button,
.pet-update-button {
  font-size: 20px;
  background-color: #FF5722;
  color: white;
  border: none;
  border-radius: 50px;
  padding: 10px 20px;
  transition: all 0.3s ease;
  cursor: pointer;
}

.pet-adopt-button:hover,
.pet-update-button:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-5px);
}

@media (max-width: 768px) {
  .row {
    flex-direction: column;
  }

  .image-col {
    order: 1;
  }

  .details-col {
    order: 2;
  }

  .dog-pic,
  .dog-pic-no-adopt {
    width: 100%;
    height: auto;
  }

  .pet-stuff {
    width: 100%;
  }

  .button-container {
    flex-direction: column;
    align-items: center;
  }

  .go-back-button {
    width: 100%;
    margin-bottom: 10px;
  }
}
</style>
