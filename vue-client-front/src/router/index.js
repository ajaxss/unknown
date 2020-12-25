import Vue from 'vue'
import VueRouter from 'vue-router'


import Home from '../views/lj/Home.vue'
import User from '../views/lj/User.vue'

import Node from '../components/lj/User/node.vue'
import Video from '../components/lj/User/video.vue'
import Massage from '../components/lj/User/massage.vue'
import nodecontent from '../views/nodecontent.vue'
import explore from '../views/Explore.vue'
import nodemsg from '../views/nodecontent.vue'
import pubu from '../components/pubu.vue'
import Liability from '../views/lj/Society.vue'


Vue.use(VueRouter)
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}

const routes = [{
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/User',
    name: 'User',
    component: User,
    beforeEnter(to, from, next) {
      if (localStorage.getItem('u_id')) {
        next()
      } else {
        next('/login')
      }
    },
    redirect: '/User/Node',
    children: [{
        path: 'Node',
        name: 'Node',
        component: Node,
      },
      {
        path: 'Video',
        name: 'Video',
        component: Video
      },
      {
        path: 'Massage',
        name: 'Massage',
        component: Massage
      }
    ]
  },

  {
    path: '/nodecontent',
    component: nodecontent
  },
  {
    path: '/Explore',
    component: explore,
    redirect: '/Explore/allnode',
    children: [{
        path: "allnode",
        component: pubu,
      },
      {
        path: 'nodemsg',
        component: nodemsg,
      }
    ]
  },

  {
    path: '/login',
    name: 'login',
    component: () => import('../views/login.vue'),
    beforeEnter(to, from, next) {
      if (localStorage.getItem('u_id')) {
        next('/User')
      } else {
        next()
      }
    }
  },
  {
    path: '/register',
    component: () => import('../views/register.vue')
  },

  {
    path: '/News',
    component: () => import('../views/news.vue')
  },
  {
    path:'/Liability',
    name:'Liability',
    component:Liability,
  },
]

const router = new VueRouter({
  routes
})


export default router