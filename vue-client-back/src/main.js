import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios';
// axios.defaults.baseURL = 'http://192.168.12.115:88';
axios.defaults.baseURL = 'http://localhost:88'
Vue.prototype.$axios = axios;
// 要用axios的时候直接this.$axios

import Left from "./components/letf.vue"
Vue.component("left-menu",Left);

Vue.use(ElementUI)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
