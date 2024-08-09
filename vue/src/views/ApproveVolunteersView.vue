<template>
    <div class="title">
        <h1 class="text-center">Approve Volunteers</h1>
    </div>
    <div class="registrations-list">
        <ApproveVolunteers 
            class="registration-card" 
            v-for="registration in registrations" 
            :key="registration.registrationId" 
            :registration="registration">
        </ApproveVolunteers>
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
    async created() {
        try {
            this.registrations = await VolunteerAppService.getRegistrations();
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
