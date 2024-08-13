<template>

  <svg class="dn">
  <defs>
    <symbol id="svg-confetti">
      <path fill="currentColor" d="M-.017 6.91L4.035.012l2.587 1.52L2.57 8.43z"></path>
    </symbol>
  </defs>
</svg>

  <div class="container" v-if="pet.adopted">
    <div class="row">
      <div class="col">
        <button class="go-back-button" @click="$router.push(`/pets`)">Back</button>
        <div class="image-container">
          <div class="adopted-overlay" v-if="pet.adopted">
            <i class="fa-solid fa-heart"></i>
            <span class="adopted-text">ADOPTED</span>
            <img :src="pet.profilePic" alt="Profile Picture" class="dog-pic" />
          </div>
        </div>
      </div>
      <div class="col">
        <h1 class="name-of-pet">{{ pet?.name }}</h1>
      </div>
      <div class="col">
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
          <button class="pet-adopt-button" v-on:click="handleAdoptClick" data-toggle="modal" data-target="#congratsModel">Adopt</button>
          <button class="pet-update-button" @click="$router.push(`/pets/${pet.id}/edit`)">Update</button>
        </div>
      </div>
    </div>
  </div>
  <div class="container" v-else>
    <div class="row">
      <div class="col">
        <button class="go-back-button" @click="$router.push(`/pets`)">Back</button>
        <div class="image-container">
          <img :src="pet.profilePic" alt="Profile Picture" class="dog-pic-no-adopt" />

        </div>
      </div>
      <div class="col">
        <h1 class="name-of-pet">{{ pet?.name }}</h1>
      </div>
      <div class="col">
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
      this.adoptPet();
      this.navigateToPets();
    }

  }
}
// function randomize(collection) {
//   var randomNumber = Math.floor(Math.random() * collection.length);
//   return collection[randomNumber];
// }

// function confetti() {
//   $(".confetti").remove();
//   var $confettiItems = $('<div class="confetti"></div>'),
//     colors = ["#3b5692", "#f9c70b", "#00abed", "#ea6747"],
//     height = 6.6,
//     width = 6.6;

//   var scale, $confettiItem;

//   for (var i = 0; i < 100; i++) {
//     scale = Math.random() * 1.75 + 1;
//     $confettiItem = $(
//       "<svg class='confetti-item' width='" +
//         width * scale +
//         "' height='" +
//         height * scale +
//         "' viewbox='0 0 " +
//         width +
//         " " +
//         height +
//         "'>\n  <use transform='rotate(" +
//         Math.random() * 360 +
//         ", " +
//         width / 2 +
//         ", " +
//         height / 2 +
//         ")' xlink:href='#svg-confetti' />\n</svg>"
//     );
//     $confettiItem.css({
//       animation:
//         Math.random() +
//         2 +
//         "s " +
//         Math.random() * 2 +
//         "s confetti-fall ease-in both",
//       color: randomize(colors),
//       left: Math.random() * 100 + "vw"
//     });
//     $confettiItems.append($confettiItem);
//   }
//   $("body").append($confettiItems);
// }

// $("#congratsModal").on("shown.bs.modal", function() {
//   confetti();
// });


</script>

<style scoped>
.fa-heart {
  color: rgb(252, 100, 100);
  position: absolute;
  top: 60px;
  right: 20px;
  font-size: 100px;
  transform: rotate(25deg);
}

.adopted-text {
  color: white;
  font-size: 18px;
  position: absolute;
  transform: translate(-50%, -50%);
  font-weight: bold;
  top: 87px;
  right: 22px;
  transform: rotate(25deg);
}

.container {
  padding: 20px;
}

.row {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.col {
  flex: 1;
}

.image-col {
  flex: 1;
}

.details-col {
  flex: 2;
}

.image-container {
  position: relative;
  width: 500px;
}

.dog-pic {
  width: 100%;
  height: auto;
  border: solid #FF5722 5px;
  border-radius: 25px;
  object-fit: cover;
  margin-top: 40px;
}

.dog-pic-no-adopt {
  width: 100%;
  height: auto;
  border: solid #FF5722 5px;
  border-radius: 25px;
  object-fit: cover;
  margin-top: 40px;
}

.go-back-button {
  margin-top: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.go-back-button:hover {
  color: #FF5722;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-5px);
}

.name-of-pet {
  padding-top: 20px;
}

.pet-stuff {
  border: 5px solid #607D8B;
  border-radius: 8px;
  width: 500px;
  margin-top: 30px;
  background-color: #fff;
  border-spacing: 0 10px;
  font-size: 20px;
  color: #263238;
}

.pet-stuff tr {
  padding: 10px 0;
  color: #263238;
}

.button-container {
  display: flex;
  gap: 10px;
  margin-top: 20px;
}

.pet-adopt-button,
.pet-update-button {
  font-size: 20px;
  transition: all 0.3s ease;
  cursor: pointer;
}

.pet-adopt-button:hover,
.pet-update-button:hover {
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
body, html {
  width: 100%;
  height: 100%;
  }

.confetti {
  left: 0;
  pointer-events: none ;
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
  95%{
    animation-timing-function: ease-in-out;
    transform: translateY(calc(100vh - 55%))
  }
  100% {
    transform: translateY(calc(150vh - 65%))
  }}
</style>
