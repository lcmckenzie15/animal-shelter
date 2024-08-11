<template>
    <div>
        <h1 class="header text-center">Application Details</h1>
    </div>
    <div class="container">
        <div class="details-box">
            <table>
                <tbody>
                    <tr>
                        <td><strong>First Name: </strong></td>
                        <td>{{ registration?.firstName }}</td>
                    </tr>
                    <tr>
                        <td><strong>Last Name: </strong></td>
                        <td>{{ registration?.lastName }}</td>
                    </tr>
                    <tr>
                        <td><strong>Email: </strong></td>
                        <td>{{ registration?.email }}</td>
                    </tr>
                    <tr>
                        <td><strong>Phone Number: </strong></td>
                        <td>{{ registration?.phoneNumber }}</td>
                    </tr>
                    <tr>
                        <td><strong>Date of Birth: </strong></td>
                        <td>{{ registration?.dateOfBirth }}</td>
                    </tr>
                    <tr>
                        <td><strong>Status: </strong></td>
                        <td>{{ registration?.status }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="button-group">
            <button class="approve-btn" @click="approveRegistration">Approve</button>
            <button class="deny-btn" @click="denyRegistration">Deny</button>
        </div>
        <div v-if="errorMessage" class="error-message">{{ errorMessage }}</div>
    </div>
</template>

<script>
import VolunteerAppService from '../services/VolunteerAppService.js';
import AuthService from '../services/AuthService.js';

export default {
    data() {
        return {
            user: {
                username: '',
                password: 'password',
                confirmPassword: 'password',
                role: 'ROLE_USER',
            },
            registration: {},
            errorMessage: ''
        }
    },
    created() {
        VolunteerAppService.getRegistrationById(this.$route.params.id)
            .then(response => {
                this.registration = response.data;
            })
            .catch(error => {
                console.error('Error fetching registration:', error);
                this.errorMessage = 'There was an error fetching the registration details. Please try again.';
            });
    },
    methods: {
        approveRegistration() {
            if (this.registration.status !== 'pending' && `${this.registration.status}` !== 'Denied') {
                this.errorMessage = 'This application is already approved.';
                return;

            }

            this.registration.status = 'Approved';

            VolunteerAppService.updateRegistrationStatus(this.$route.params.id, this.registration)
                .then(() => {
                    this.user.username = this.registration.email;
                    AuthService.register(this.user);

                    this.errorMessage = '';
                })
                .catch(error => {
                    console.error('Error updating registration status:', error);
                    this.errorMessage = 'There was an error approving the registration. Please try again.';
                });
        },

        denyRegistration() {
            if (this.registration.status !== 'pending' && `${this.registration.status}` !== 'Approved') {
                this.errorMessage = 'This application is already denied.';
                return;

            }

            this.registration.status = 'Denied';

            VolunteerAppService.updateRegistrationStatus(this.$route.params.id, this.registration)
                .then(() => {
                    this.errorMessage = '';
                })
                .catch(error => {
                    console.error('Error updating registration status:', error);
                    this.errorMessage = 'There was an error denying the registration. Please try again.';
                });

        }

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

.header {
    text-align: center;
    color: #607D8B;
    margin-top: 50px;
    margin-bottom: 50px;
    font-size: 38px;
    font-weight: 500;
}

.error-message {
    color: white;
    background-color: #d9534f;

    margin-top: 20px;
    text-align: center;
    font-size: 18px;
}

html,
body {
    height: 100%;
    background-color: #152733;
    overflow: hidden;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 40px auto;
    padding: 20px;
    background-color: #607D8B;
    border-radius: 10px;
}

.details-box {
    border: 1px solid #455A64;
    border-radius: 10px;
    padding: 20px;
    background-color: #455A64;
    color: white;
}

table {
    width: 100%;
    border-spacing: 10px;
}

td strong {
    text-align: left;
    display: inline-block;
    width: 200px;
    vertical-align: middle;
    color: #fff;
    padding-bottom: 15px;
}

td:last-child {
    text-align: left;
    padding-left: 20px;
    color: #e0e0e0;
}

.button-group {
    margin-top: 20px;
    text-align: center;
}

.approve-btn,
.deny-btn {
    background-color: #fff;
    border: none;
    padding: 10px 20px;
    margin-left: 35px;
    margin-right: 50px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 20px;
    transition: background-color 0.3s ease;
}

.approve-btn {
    background-color: white;
    color: #607D8B;
}

.deny-btn {
    background-color: #455A64;
    color: #fff;
}

.approve-btn:hover {
    background-color: #07d44b;
    color: #fff;
}

.deny-btn:hover {
    background-color: #d9534f;
}
</style>
