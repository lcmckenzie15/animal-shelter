<template>
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3 class="text-center">Pet Information</h3>
                        <p class="text-center">Please fill in the form below with the pet's details.</p>

                        <form class="requires-validation form-rounded" novalidate v-on:submit.prevent="submitPet">
                            <div class="col-md-12 mb-4">
                                <label for="species" class="form-label">Species:</label>
                                <select class="form-select" id="species" required v-model="pet.species">
                                    <option selected disabled>Species</option>
                                    <option>Cat</option>
                                    <option>Dog</option>
                                </select>
                                <div class="valid-feedback">Species is valid!</div>
                                <div class="invalid-feedback">Please select a species.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="gender" class="form-label">Gender:</label>
                                <select class="form-select" id="gender" required v-model="pet.gender">
                                    <option selected disabled>Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                                <div class="valid-feedback">Gender is valid!</div>
                                <div class="invalid-feedback">Please select a gender.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="age" class="form-label">Age:</label>
                                <input type="number" class="form-control" id="age" min="1" max="20" required v-model="pet.age">
                                <div class="valid-feedback">Age is valid!</div>
                                <div class="invalid-feedback">Please enter a valid age.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="name" class="form-label">Name:</label>
                                <input type="text" class="form-control" id="name" required v-model="pet.name">
                                <div class="valid-feedback">Name is valid!</div>
                                <div class="invalid-feedback">Please enter a name.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="breed" class="form-label">Breed:</label>
                                <input type="text" class="form-control" id="breed" required v-model="pet.breed">
                                <div class="valid-feedback">Breed is valid!</div>
                                <div class="invalid-feedback">Please enter a breed.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="size" class="form-label">Size:</label>
                                <select class="form-select" id="size" required v-model="pet.petSize">
                                    <option selected disabled>Size</option>
                                    <option>Small</option>
                                    <option>Medium</option>
                                    <option>Large</option>
                                    <option>X-Large</option>
                                </select>
                                <div class="valid-feedback">Size is valid!</div>
                                <div class="invalid-feedback">Please select a size.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="color" class="form-label">Color:</label>
                                <input type="text" class="form-control" id="color" required v-model="pet.color">
                                <div class="valid-feedback">Color is valid!</div>
                                <div class="invalid-feedback">Please enter a color.</div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <label for="description" class="form-label">Description:</label>
                                <textarea class="form-control" id="description" rows="3" required v-model="pet.description"></textarea>
                                <div class="valid-feedback">Description is valid!</div>
                                <div class="invalid-feedback">Please enter a description.</div>
                            </div>

                            <input type="file" id="picture" name="picture-upload" v-on:click.prevent="openUploadWidget" required>
                            {{ pet.profilePic }}
                            <div class="form-button mt-4">
                                <button id="submit" type="submit" class="btn btn-submit">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="alert alert-danger alert-dismissible" v-if="showError">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Error!</strong> Please check that all fields are completed.
    </div>
</template>

<script>
import PetService from '../services/PetService';

export default {
    data() {
        return {
            pet: {
                species: '',
                gender: '',
                age: '',
                name: '',
                breed: '',
                petSize: '',
                color: '',
                description: '',
                profilePic: ''
            },
            showError: false
        };
    },
    methods: {
        openUploadWidget(){
            console.log("Hits openUploadWidget method");
            const widget = window.cloudinary.createUploadWidget(
                {cloudName: "df1ugxbgd", uploadPreset: "add-new-pet"},
                (error, result) => {
                    if (!error && result && result.event === 'success'){
                        console.log("Done uploading . . .", result.info);
                        this.pet.profilePic = result.info.secure_url;
                    }
                }
            );

            widget.open();
        },

        submitPet() {
            if (this.pet.species=='' || this.pet.gender=='' || this.pet.age==0 || this.pet.name=='' 
                || this.pet.breed=='' || this.pet.petSize=='' || this.pet.color=='' || this.pet.profilePic==''){
                    this.showError=true;
                    return
                } 
            PetService.addNewPet(this.pet).then((response) => {
                console.log(response);
                
                if (response.status == 200) {
                    this.pet = {
                    species: '',
                    gender: '',
                    age: '',
                    name: '',
                     breed: '',
                    petSize: '',
                    color: '',
                    description: '',
                    profilePic: ''
                    };
                    this.$router.push('/pets');
                }
            
            }).catch((error) => {
                this.showError = true;
            });
        }
    }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

*,
body {
    font-family: 'Poppins', sans-serif;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    -moz-osx-font-smoothing: grayscale;
}

html,
body {
    height: 100%;
    background-color: #152733;
    overflow: hidden;
}

.form-holder {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    min-height: 100vh;
}

.form-holder .form-content {
    position: relative;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 60px;
}

.form-content .form-items {
    padding: 60px;
    display: inline-block;
    width: 100%;
    min-width: 900px;
    min-height: 700px;
    border-radius: 10px;
    text-align: left;
    transition: all 0.4s ease;
    background-color: #607D8B;
}

.form-rounded {
    border-radius: 10px;
    padding: 20px;
    background-color: #607D8B;
}

.form-content h3 {
    color: #fff;
    text-align: center;
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 20px;
}

.form-content p {
    color: #fff;
    text-align: center;
    font-size: 17px;
    font-weight: 300;
    line-height: 20px;
    margin-bottom: 30px;
}

.form-content input[type=text],
.form-content input[type=number],
.form-content textarea,
.form-content select {
    width: 100%;
    padding: 12px 20px;
    text-align: left;
    border: 0;
    outline: 0;
    border-radius: 6px;
    background-color: #fff;
    font-size: 15px;
    font-weight: 300;
    color: #8D8D8D;
    transition: all 0.3s ease;
    margin-top: 16px;
}

.form-content input:hover,
.form-content input:focus,
.form-content textarea:hover,
.form-content textarea:focus,
.form-content select:hover,
.form-content select:focus {
    background-color: #ebeff8;
    color: #8D8D8D;
}

.form-content .form-button {
    text-align: center;
}

.btn-submit {
    background-color: #fff;
    color: #000;
    border: 0;
    box-shadow: none;
}

.btn-submit:hover,
.btn-submit:focus,
.btn-submit:active {
    background-color: #f0f0f0;
    color: #000;
    border: none;
    box-shadow: none;
}

.invalid-feedback {
    color: #ff606e;
}

.valid-feedback {
    color: #2acc80;
}

label{
    color: rgb(255, 255, 255);
}

input[type='file'] {
    color: rgba(0, 0, 0, 0);
    
}

#picture:hover {
    color: rgba(0, 0, 0, 0);
}
</style>
