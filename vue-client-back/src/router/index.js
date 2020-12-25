import Vue from 'vue'
import VueRouter from 'vue-router'
import Admin from '../views/Home.vue'
import Login from '../views/Login.vue'

import UserM from '../components/userm.vue'
import NewsM from '../components/newsm.vue'
import AddNews from '../components/addnews.vue'
import SocietyM from '../components/societym.vue'
import AddSociety from '../components/addsociety.vue'
import TagM from '../components/tagm.vue'
import AddTag from '../components/addtag.vue'

Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    name:'Login',
    component:Login

  },
  {
    path: '/Admin',
    name: 'Admin',
    component: Admin,
    redirect:'/Admin/UserM',
    beforeEnter(to,from,next){
      if(localStorage.getItem("userInfo")){
        next()
      }else{
        next('/')
      }
    },
    children:[
      {
        path:'UserM',
        name:'UserM',
        component:UserM
      },
      {
        path:'NewsM',
        name:'NewsM',
        component:NewsM
      },
      {
        path:'AddNews',
        name:'AddNews',
        component:AddNews
      },
      {
        path:'SocietyM',
        name:'SocietyM',
        component:SocietyM
      },
      {
        path:'AddSociety',
        name:'AddSociety',
        component:AddSociety
      },
      {
        path:'TagM',
        name:'TagM',
        component:TagM
      },
      {
        path:'AddTag',
        name:'AddTag',
        component:AddTag
      },
    ]
  },
  
]

const router = new VueRouter({
  routes
})


export default router
