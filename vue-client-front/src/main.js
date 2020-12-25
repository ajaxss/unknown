import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios';

axios.defaults.baseURL = 'http://localhost:88';
Vue.prototype.$axios = axios;
import './assets/iconfont/iconfont.css';

// 要用axios的时候直接this.$axios

//注册公用组件
import Uplaod from "./components/upnode.vue"
import TopMenu from "@/components/topmenu.vue";
import ButtomMenu from "@/components/bottom.vue"
Vue.component("top-menu",TopMenu);
Vue.component("bottom-menu",ButtomMenu);
Vue.component("video-menu",Uplaod);
Vue.use(ElementUI)

Vue.config.productionTip = false
import bottom from './components/bottom.vue'
import wangeadit from './components/wange.vue'
// import { from } from 'core-js/fn/array'
Vue.component('bottom-msg',bottom)
Vue.component('wange',wangeadit)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
