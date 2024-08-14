<template>
  <div class="volunteer-view container">
    <h1>What it Means to be a Volunteer</h1>
    <p class="intro-text">
      Volunteering at an animal shelter requires dedication, compassion, and a willingness to help. It’s a commitment that can
      change the lives of both the animals and the volunteers themselves. If you love animals and want to make a positive impact, consider becoming a
      volunteer at your local animal shelter.
    </p>
    <div class="responsibilities">
      <h2 class="text-center">Responsibilities Include:</h2>
      <div class="card-container">
        <div class="card">
          <h4>Animal Care and Socialization</h4>
          <ul>
            <li>Provide daily care for animals, including feeding, grooming, and cleaning their living spaces.</li>
            <li>Spend time socializing with the animals, offering companionship, playtime, and training to improve their adoptability.</li>
            <li>Monitor the health and behavior of the animals, reporting any concerns to the shelter staff.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Shelter Maintenance</h4>
          <ul>
            <li>Assist with general cleaning and maintenance tasks to ensure a safe and sanitary environment for the animals.</li>
            <li>Help organize and restock supplies, such as food, bedding, and medical supplies.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Administrative Support</h4>
          <ul>
            <li>Aid in clerical tasks such as answering phones, greeting visitors, and processing adoption paperwork.</li>
            <li>Maintain accurate records of animal care and volunteer activities.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Adoption Events and Outreach</h4>
          <ul>
            <li>Participate in adoption events and community outreach programs to promote the shelter and its animals.</li>
            <li>Help set up and break down event spaces, engage with potential adopters, and provide information about the adoption process.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Fundraising and Donations</h4>
          <ul>
            <li>Assist in organizing and running fundraising events to support the shelter’s operations.</li>
            <li>Help collect, sort, and distribute donated items such as food, toys, and blankets.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Training and Education</h4>
          <ul>
            <li>Attend training sessions to learn best practices for animal care and shelter operations.</li>
            <li>Educate the public about responsible pet ownership and the benefits of adopting shelter animals.</li>
          </ul>
        </div>
        <div class="card">
          <h4>Special Projects</h4>
          <ul>
            <li>Participate in special projects such as facility renovations, garden maintenance, or creating enrichment activities for the animals.</li>
            <li>Collaborate with other volunteers and staff on initiatives to improve the shelter environment.</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="text-center p-4">
      <h3 class="pb-4">Apply Now!</h3>
      <div class="d-grid p-4 apply-container">
        <button id="apply-button" type="button" class="btn btn-lg btn-block" @click="$router.push(`/volunteer-app`)">Apply</button>
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

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

* {
  font-family: 'Poppins', sans-serif;
}

.volunteer-view {
  padding: 20px;
  font-family: Arial, sans-serif;
}

h1 {
  color: #607D8B;
  text-align: center;
  margin-bottom: 20px;
}

.intro-text {
  color: #263238;
  text-align: center;
  margin-bottom: 30px;
  font-size: 1.1em;
  line-height: 1.6;
}

.responsibilities {
  margin-bottom: 30px;
}

h2 {
  color: #607D8B;
  margin-bottom: 20px;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
}

.card {
  background-color: #FFFFFF;
  border-radius: 8px;
  box-shadow: 0 10px 20px rgba(4, 11, 104, 0.4); /* Darker orange shadow */
  padding: 20px;
  width: 300px;
  transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 25px rgba(136, 37, 7, 0.6); /* Darker orange shadow on hover */
}

.card h4 {
  color: #607D8B;
  margin-bottom: 10px;
}

.card ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

.card ul > li {
  margin-bottom: 10px;
}

.apply-container {
  background-color:#FF5722;
  border-radius: 8px;
}

#apply-button {
  background-color: #FF5722;
  border: none;
  color: white;
  padding: 12px;
  font-size: 18px;
  border-radius: 8px;
  transition: background-color 0.3s;
}

#apply-button:hover {
  background-color: #6e6f4e;
}
</style>
