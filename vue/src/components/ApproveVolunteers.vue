<template>
    <div class="registration-card">
        <div class="information">
            <p class="id">{{ registration.registrationId }}</p>
            <p class="email">{{ registration.email }}</p>
            <p class="phoneNumber">{{ registration.phoneNumber }}</p>
            <p class="birthDate">{{ registration.dateOfBirth }}</p>
            <p class="firstName">{{ registration.firstName }}</p>
            <p class="lastName">{{ registration.lastName }}</p>
            <p class="status">{{ registration.status }}</p>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        registration: {
            type: Object,
            required: true
        }
    }
};
</script>

<style scoped>
.registration-card {
    border: 1px solid #ddd;
    padding: 16px;
    margin: 8px;
    border-radius: 8px;
    width: 300px;
}

.information {
    display: flex;
    flex-direction: column;
}
</style>
