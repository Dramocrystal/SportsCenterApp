<template>
  <div class="homepage">
    <navbar />
    <div class="content">
      <div class="img-container">
      <img src="@/assets/manworkout.jpg" class="background-img">
      <div class="text">
        <label>{{ msg }}</label>
        <label> {{ msg2 }}</label>
        <div class="schedule">
          <label> Monday: {{ this.infos.week }}</label>
          <label> Tuesday: {{ this.infos.week }}</label>
          <label> Wednesday: {{ this.infos.week }}</label>
          <label> Thursday: {{ this.infos.week }}</label>
          <label> Friday: {{ this.infos.week }}</label>
          <label> Saturday: {{ this.infos.weekend }}</label>
          <label> Sunday: {{ this.infos.weekend }}</label>
        </div>
      </div>
     
      
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import navbar from '@/components/Navbar';
import api from '../api';

export default {
  name: 'homepage',
  components: {
    navbar
  },
  data() {
    return {
      msg: 'Welcome to the sports center',
      msg2: '',
      infos: {
        adress: '',
        week: '',
        weekend: ''
      },
    };
  },
  mounted() {
    this.fetchCenterData();
  },
  methods: {
    fetchCenterData() {
      api.get('/center/1')
        .then(response => {
          const data = response.data;
          this.infos.adress = data.adress;
          this.infos.week = data.weekSchedule;
          this.infos.weekend = data.weekendSchedule;
          this.createWelcomeMessage();
        })
        .catch(error => {
          this.errMsg = (error.response && error.response.data) || 'Fetch failed';
        });
    },
    createWelcomeMessage() {
      this.msg2 = "Come Meet us at " + this.infos.adress;
    }
  }
};
</script>

<style>

body, html {
    overflow-x: hidden;
}

.img-container {
  position: relative;
  display: flex;
}

.homepage {
    position: relative;
    width: 100%;
    height: 100%;
}

.content {
    position: relative;
    width: 100%;
    height: 100%;
}

.background-img {
    width: 100%;
    height: 60%;
    object-fit: cover;
}

.white-section {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40%;
    background-color: white;
    display: flex;
    justify-content: space-around; /* Align cards horizontally */
    align-items: center; /* Align cards vertically */
}

.text {
  position: absolute;
  top: 10%;
  left: 30%;
  color: white;
  font-size: 4vh;
  width: 100%;
  max-width: 900px;
  font-weight: bold;
  background-color: rgba(0, 0, 0, 0.3);
  border: 2px solid #fff;
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  padding: 12px;
  margin-right: 36px;
}

.schedule {
  color: white;
  font-size: 2vh; /* Adjust font size as needed */
  width: 100%;
  font-weight: lighter;
  display: flex;
  flex-direction: column;


}

</style>
