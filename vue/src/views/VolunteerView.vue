<template>
  <div class="volunteer-view container">
    <h1>What it Means to be a Volunteer</h1>
    <p>Volunteering at an animal shelter requires dedication,
      compassion, and a willingness to help. It’s a commitment that can
      change the lives of both the animals and the volunteers themselves.
      If you love animals and want to make a positive impact, consider becoming a
      volunteer at your local animal shelter.
    </p>
    <div class="container">
      <h2 class="text-center">Responsibilities include: </h2>
      <ul>
        <ul>
          <h4 class="pt-3">Animal Care and Socialization:</h4>
          <li>Provide daily care for animals, including feeding, grooming, and cleaning their living spaces.</li>
          <li>Spend time socializing with the animals, offering companionship, playtime, and training to improve their
            adoptability.</li>
          <li>Monitor the health and behavior of the animals, reporting any concerns to the shelter staff.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Shelter Maintenance:</h4>
          <li>Assist with general cleaning and maintenance tasks to ensure a safe and sanitary environment for the
            animals.</li>
          <li>Help organize and restock supplies, such as food, bedding, and medical supplies.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Administrative Support:</h4>
          <li>Aid in clerical tasks such as answering phones, greeting visitors, and processing adoption paperwork.</li>
          <li>Maintain accurate records of animal care and volunteer activities.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Adoption Events and Outreach:</h4>
          <li>Participate in adoption events and community outreach programs to promote the shelter and its animals.
          </li>
          <li>Help set up and break down event spaces, engage with potential adopters, and provide information about the
            adoption process.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Fundraising and Donations:</h4>
          <li>Assist in organizing and running fundraising events to support the shelter’s operations.</li>
          <li>Help collect, sort, and distribute donated items such as food, toys, and blankets.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Training and Education:</h4>
          <li>Attend training sessions to learn best practices for animal care and shelter operations.</li>
          <li>Educate the public about responsible pet ownership and the benefits of adopting shelter animals.</li>
        </ul>
        <ul>
          <h4 class="pt-3">Special Projects:</h4>
          <li>Participate in special projects such as facility renovations, garden maintenance, or creating enrichment
            activities for the animals.</li>
          <li>Collaborate with other volunteers and staff on initiatives to improve the shelter environment.</li>
        </ul>
      </ul>
    </div>
    <div class="text-center p-4">
      <h3 class="pb-4">Apply Now!</h3>
      <div class="d-grid p-4" style="background-color: #FF5722;">
        <button id="apply-button" type=button class="btn btn-lg btn-block" @click="$router.push(`/volunteer-app`)">Apply</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'VolunteerView',
};
</script>

<style scoped>
.volunteer-view {
  padding: 20px;
  font-family: Arial, sans-serif;
}

h1 {
  color: #FF5722;
  text-align: center;
}

p {
  color: #263238;
  text-align: center;
}

</style>