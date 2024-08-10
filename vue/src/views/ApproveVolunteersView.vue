<template>
    <div class="title">
        <h1 class="text-center">Approve Volunteers</h1>
    </div>
    <div class="container mt-3">
        <table class="table table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="registration in registrations" :key="registration.registrationId">
        <td>{{ registration.firstName }}</td>
        <td>{{ registration.lastName }}</td>
        <td>{{ registration.status }}</td>
        <td><button @click="$router.push(`/registration/forms/${registration.registrationId}`)">View</button>
        </td>
      </tr>
    </tbody>
  </table>
    </div>
</template>

<script>
import ApproveVolunteers from '../components/ApproveVolunteers.vue';
import VolunteerAppService from '../services/VolunteerAppService';

export default {
    components: {
        ApproveVolunteers
    },
    data() {
        return {
            registrations: []
        };
    },
    async mounted() {
        try {
           const response = await VolunteerAppService.getRegistrations();
           this.registrations = response.data;
            console.log('Fetched registrations', response.data);
        } catch (error) {
            console.error('Error fetching registrations:', error);
        }
    }
};
</script>

<style scoped>
.title {
    text-align: center;
}

.registrations-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.registration-card {
    margin: 10px;
}
</style>
