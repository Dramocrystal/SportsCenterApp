import axios from 'axios';

const api = axios.create({
  baseURL: 'https://sportapi.yazidtech.com'
});

export default api;
