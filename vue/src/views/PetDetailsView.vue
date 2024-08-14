<template>
  <div class="container" v-if="pet.adopted">
    <div class="row">
      <div class="col image-col">
        <div class="image-container">
          <div class="adopted-overlay" v-if="pet.adopted">
            <i class="fa-solid fa-heart"></i>
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
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Age:</strong> {{ pet?.age }} years old</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Breed:</strong> {{ pet?.breed }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Size:</strong> {{ pet?.petSize }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Gender:</strong> {{ pet?.gender }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Color:</strong> {{ pet?.color }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Description:</strong> {{ pet?.description }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
          </tbody>
        </table>
        <div class="button-container">
          <button class="go-back-button" @click="$router.push(`/pets`)">Back</button>
          <button class="pet-update-button" @click="$router.push(`/pets/${pet.id}/edit`)"
            v-if="$store.state.token != ''">Update</button>
          <button class="pet-adopt-button" v-on:click="handleAdoptClick" data-toggle="modal"
            data-target="#congratsModel">Adopt</button>
        </div>
      </div>
    </div>
  </div>
  <div class="container" v-else>
    <div class="row">
      <div class="col image-col">
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
          <tbody>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Age:</strong> {{ pet?.age }} years old</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Breed:</strong> {{ pet?.breed }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Size:</strong> {{ pet?.petSize }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Gender:</strong> {{ pet?.gender }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Color:</strong> {{ pet?.color }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
            <tr>
              <td><strong>Description:</strong> {{ pet?.description }}</td>
            </tr>
            <tr class="spacer">
              <td></td>
            </tr>
          </tbody>
        </table>
        <div class="button-container">
          <button class="go-back-button" @click="$router.push(`/pets`)">Back</button>
          <button class="pet-update-button" @click="$router.push(`/pets/${pet.id}/edit`)"
            v-if="$store.state.token != ''">Update</button>
          <button class="pet-adopt-button" v-on:click="handleAdoptClick">Adopt</button>
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
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

* {
  font-family: 'Poppins', sans-serif;
}

.container {
  padding: 20px;
}

.row {
  display: flex;
  align-items: center;
  /* Align items vertically */
  justify-content: space-between;
}

.col {
  flex: 1;
}

.image-col {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.details-col {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  max-width: 600px;
  margin-left: 20px;
}

.image-container {
  position: relative;
  width: 100%;
  max-width: 600px;
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
  cursor: pointer;
  transition: all 0.3s ease;
  background-color: #FF5722;
  color: white;
  border-radius: 50px;
  padding: 10px 20px;
  border: none;
}

.pet-adopt-button,
.pet-update-button {
  margin-top: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
  background-color: #FF5722;
  color: white;
  border-radius: 50px;
  padding: 10px 20px;
  border: none;
}

.go-back-button:hover,
.pet-adopt-button:hover,
.pet-update-button:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-5px);
}

.name-of-pet {
  padding-top: 20px;
  font-size: 36px;
  font-weight: 700;
  color: #FF5722;
  text-align: center;
}

.pet-stuff {
  border-radius: 8px;
  width: 100%;
  margin-top: 30px;
  background-color: rgba(96, 125, 139, 0.1);
  padding: 20px;
  font-size: 18px;
  color: #263238;
}

.pet-stuff th {
  text-align: center;
  font-size: 24px;
  background-color: rgba(96, 125, 139, 0.4);
  border-radius: 8px;
  padding: 10px;
  color: #263238;
}

.pet-stuff td {
  padding: 10px 0;
  font-weight: 600;
}

.spacer {
  height: 5px;
}

.button-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding-top: 20px;
}

.go-back-button,
.pet-adopt-button,
.pet-update-button {
  margin: 0;
  padding: 10px 20px;
  height: 50px;
  background-color: #FF5722;
  color: white;
  border-radius: 50px;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
}

.go-back-button:hover,
.pet-adopt-button:hover,
.pet-update-button:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-5px);
}


body,
html {
  width: 100%;
  height: 100%;
}

.confetti {
  left: 0;
  pointer-events: none;
  position: fixed;
  top: 0;
  transform: translate3d(0, 0, 0);
  will-change: transform;
  height: 100%;
  width: 100%;
}

.confetti-item {
  position: absolute;
  transform: translate3d(0, 0, 0);
  will-change: transform;
}

@keyframes confetti-fall {
  0% {
    transform: translateY(-100%)
  }

  95% {
    animation-timing-function: ease-in-out;
    transform: translateY(calc(100vh - 55%))
  }

  100% {
    transform: translateY(calc(150vh - 65%))
  }
}
</style>
