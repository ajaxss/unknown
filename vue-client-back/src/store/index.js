import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userInfo:JSON.parse(localStorage.getItem("userInfo"))||{},
  },
  mutations: {
    setuerInfo(state,v){
      localStorage.setItem('userInfo',JSON.stringify(v));
      state.userInfo = v
    }
  },
  actions: {
  },
  modules: {
  }
})
