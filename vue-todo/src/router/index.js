import Vue from 'vue'
import Router from 'vue-router'
import Main from './main'
import Admin from './admin'

Vue.use(Router)

export default new Router({
  routes: [Main, Admin]
})
