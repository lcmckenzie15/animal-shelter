<template>
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3 class="text-center">Volunteer Application</h3>
                        <p class="text-center">Please fill in the form below.</p>
                        <section v-if="showSuccess">
                            <div class="container" id="success-message">
                                <h1><strong>Success!</strong></h1>
                                <p>Thank you for your application! It has been submitted to an
                                administrator for evaluation.</p>
                            </div>
                        </section>

                        <section v-else>
                            <div class="alert alert-danger alert-dismissible" v-if="showError">
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                <strong>Error!</strong> This email is already registered.
                            </div>

                            <form class="requires-validation form-rounded" novalidate v-on:submit.prevent="submitForm">

                                <div class="col-md-12 mb-4">
                                    <input class="form-control" type="email" placeholder="Email" id="email" required
                                        v-model="NewApp.email">
                                    <div class="valid-feedback">Email field is valid!</div>
                                    <div class="invalid-feedback">Email field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 mb-4">
                                    <input class="form-control" type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                        placeholder="Phone Number (123-456-7890)" id="phonenum" required
                                        v-model="NewApp.phoneNumber">
                                    <div class="valid-feedback">Phone number is valid!</div>
                                    <div class="invalid-feedback">Phone number cannot be blank!</div>
                                </div>

                                <div class="col-md-12 mb-4">
                                    <input class="form-control" type="date" placeholder="Date-Of-Birth" id="dob"
                                        required v-model="NewApp.dateOfBirth">
                                    <div class="valid-feedback">Date of birth is valid!</div>
                                    <div class="invalid-feedback">Date of birth cannot be blank!</div>
                                </div>

                                <div class="col-md-12 mb-4">
                                    <input class="form-control" type="text" placeholder="First Name" id="firstname"
                                        required v-model="NewApp.firstName">
                                    <div class="valid-feedback">First name is valid!</div>
                                    <div class="invalid-feedback">First name cannot be blank!</div>
                                </div>

                                <div class="col-md-12 mb-4">
                                    <input class="form-control" type="text" placeholder="Last Name" id="lastname"
                                        required v-model="NewApp.lastName">
                                    <div class="valid-feedback">Last name is valid!</div>
                                    <div class="invalid-feedback">Last name cannot be blank!</div>
                                </div>

                                <div class="form-button mt-4">
                                    <button id="submit" type="submit" class="btn btn-submit">Submit</button>
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import VolunteerAppService from '../services/VolunteerAppService';

export default {
    data() {
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
                if (response.status == 201) {
                    this.showSuccess = true;
                    this.NewApp = {};
                }
            }).catch(() => {
                this.showError = true;
            });
        },
    }
}
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
.form-content input[type=password],
.form-content input[type=email],
.form-content input[type=tel],
.form-content input[type=date] {
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
.form-content input:focus {
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

#success-message {
    color: #fff;
    padding: 20px;
    margin: 20px 0;
    border-radius: 10px;
}

#success-message h1 {
    font-size: 28px;
    font-weight: 800;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

#success-message h1::before {
    margin-right: 10px;
    font-size: 1.2em;
}

#success-message p {
    font-size: 18px;
    text-align: center;
    margin-bottom: 0;
}

</style>
