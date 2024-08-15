import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'


import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import ChangePasswordView from '../views/ChangePasswordView.vue';
import VolunteerView from '../views/VolunteerView.vue';
import BrowsePetsView from '../views/BrowsePetsView.vue';
import PetDetailsView from '../views/PetDetailsView.vue';
import VolunteerAppView from '../views/VolunteerAppView.vue';
import PetFormView from '../views/PetFormView.vue';
import ApproveVolunteersView from '../views/ApproveVolunteersView.vue';
import ApplicationDetailsView from '../views/ApplicationDetailsView.vue';
import UpdatePetListingView from '../views/UpdatePetListingView.vue';


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/registration/forms',
    name: 'applications',
    component: ApproveVolunteersView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/pets/:id',
    name: 'pet-details',
    component: PetDetailsView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/volunteer',
    name: 'volunteer',
    component: VolunteerView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/pets',
    name: 'pets',
    component: BrowsePetsView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/changepassword',
    name: 'changedpassword',
    component: ChangePasswordView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/volunteer-app',
    name: 'volunteer-app',
    component: VolunteerAppView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/add-new-pet',
    name: 'pet-form',
    component: PetFormView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/registration/forms/:id',
    name: 'application-details',
    component: ApplicationDetailsView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/pets/:id/edit',
    name: 'update-pet-details',
    component: UpdatePetListingView,
    met: {
      requiresAuth: true
    }
  },
];


const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to) => {


  const store = useStore();


  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);


  if (requiresAuth && store.state.token === '') {
    return { name: "login" };
  }

});

export default router;
