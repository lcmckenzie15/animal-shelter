<template>
    <div>
        <h1 class="text-center">Application Details</h1>
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
            <button class="approve-btn">Approve</button>
            <button class="deny-btn">Deny</button>
        </div>
    </div>
</template>

<script>
import VolunteerAppService from '../services/VolunteerAppService.js';
import Registration from '../components/ApproveVolunteers.vue';

export default {
    components: {
        Registration
    },
    data() {
        return {
            registration: {}
        }
    },
    created() {
        VolunteerAppService.getRegistrationById(this.$route.params.id)
            .then(response => {
                this.registration = response.data;
            })
    },
}
</script>

<style scoped>
.container {
    max-width: 600px;
    margin: auto;
}

.details-box {
    border: 2px solid black;
    border-radius: 10px;
    padding: 20px;
    background-color: #f9f9f9;
}

table {
    width: 100%;
    border-spacing: 10px;
}

td strong {
    text-align: left;
    display: inline-block;
    width: 150px;
    vertical-align: middle;
}

td:last-child {
    text-align: left;
    padding-left: 20px;
}

.button-group {
    margin-top: 20px;
    text-align: center;
}

.approve-btn,
.deny-btn {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.deny-btn {
    background-color: #dc3545;
}

.approve-btn:hover {
    background-color: #0056b3;
}

.deny-btn:hover {
    background-color: #c82333;
}
</style>
