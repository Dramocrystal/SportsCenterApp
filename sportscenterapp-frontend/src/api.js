import axios from 'axios';

const api = axios.create({
  baseURL: 'http://sportapi.yazidtech.com'
});

export default api;