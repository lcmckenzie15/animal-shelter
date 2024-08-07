<template>
    <div class="h1 container text-center pt-5">
    Volunteer Application
    </div>
<section v-if="showSuccess">
    <div class="container">
        <strong>Success!</strong> Thank you for your application! It has been submitted to an administrator for evaluation.
    </div>
</section>  

<section v-else>
    <div class="alert alert-danger alert-dismissible" v-if="showError">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Error!</strong> There was an error submitting your application. Please try again.
    </div>   
    <form class="container pt-4" v-on:submit.prevent="submitForm">
        <div class="row p-3">
        <label for="email">Email:</label>
        <input type="email" class="form-control" placeholder="Enter email" id="email" required v-model="NewApp.email">
        </div>

        <label for="phonenum">Phone Number:</label>
        <div class="row p-3">  
        <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" class="form-control" placeholder="123-456-7890" id="phonenum" required v-model="NewApp.phoneNumber">
        </div>

        <label for="dob">Date-Of-Birth:</label>
        <div class="row p-3">
            <input type="date" class="form-control" placeholder="Enter date-of-birth" id="dob" required v-model="NewApp.dateOfBirth">
        </div>

        <label for="firstname">First Name:</label>
        <div class = "row p-3">
            <input type="text" class="form-control" placeholder="Enter your first name" id="firstname" required v-model="NewApp.firstName">
        </div>

        <label for="lastname">Last Name:</label>
        <div class="row p-3">
            <input type="text" class="form-control" placeholder="Enter your last name" id="lastname" required v-model="NewApp.lastName">
        </div>
    
        <button type="submit" class="btn btn-dark rounded-pill">Submit</button>
    </form>
</section>


    
</template>

<script>
    import VolunteerAppService from '../services/VolunteerAppService';

    export default {
        data(){
            return {
               NewApp: {
                email: "",
                phoneNumber: "",
                dateOfBirth: "",
                firstName: "",
                lastName: "",
               },
               showSuccess: false,
               showError: false,
            }
        },
        methods: {
            submitForm() {
                VolunteerAppService.create(this.NewApp).then((response) => {
                    // console.log(response);
                    if (response.status == 201) {
                        this.showSuccess = true;
                        this.NewApp = {};
                    } 
                }).catch((e) => {
                    this.showError = true;
                });
               
            },
            
            
    
        }
    }

</script>

<style scoped>

</style>