<template>
    <div class="title">
        <h1 class="header text-center">Volunteer Applications</h1>
    </div>
    <div class="container mt-3">
        <div class="list-container">
            <div class="list-header">
                <div class="list-column">First Name</div>
                <div class="list-column">Last Name</div>
                <div class="list-column">Status</div>
                <div class="list-column">Action</div>
            </div>
            <div v-for="registration in registrations" :key="registration.registrationId" class="list-item">
                <div class="list-column">{{ registration.firstName }}</div>
                <div class="list-column">{{ registration.lastName }}</div>
                <div class="list-column">{{ registration.status }}</div>
                <div class="list-column">
                    <button class="view-button"
                        @click="$router.push(`/registration/forms/${registration.registrationId}`)">View</button>
                </div>
            </div>
        </div>
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
    font-weight: 600;
}

html,
body {
    height: 100%;
    background-color: #152733;
    overflow: hidden;
    margin: 0;
    padding: 0; 
}

.title {
    text-align: center;
    color: #fff;
    margin: 20px 0;
    font-size: 28px;
    font-weight: 600;
}

.container {
    display: flex;
    justify-content: center;
    align-items: flex-start; 
    min-height: calc(100vh - 60px);
    padding: 0 10px; 
}

.list-container {
    background-color: #607D8B;
    border-radius: 10px;
    padding: 20px;
    width: 100%;
    max-width: 900px;
    overflow: hidden;
    margin-top: 20px; 
}

.list-header,
.list-item {
    display: flex;
    padding: 10px 0;
    border-bottom: 1px solid #fff;
    color: white;
}

.list-header {
    font-weight: bold;
    border-bottom: 2px solid #fff;
    background-color: #455A64;
}

.list-column {
    flex: 1;
    text-align: center;
}

.list-item:last-child {
    border-bottom: none;
}

.view-button {
    background-color: white;
    color: #607D8B;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    cursor: pointer; 
  transition: all 0.3s ease; 
}

.view-button:hover {
    background-color: #f0f0f0;
    color: #ff5722;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
  transform: translateY(-5px);
}
</style>
