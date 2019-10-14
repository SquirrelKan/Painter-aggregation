// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-TW'
import axios from 'axios'
import store from './store'
// import VueSession from 'vue-session'

Vue.prototype.$axios = axios
Vue.use(Element, { locale })
Vue.config.productionTip = false
// Vue.use(VueSession)

router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})

/* eslint-disable no-new */
new Vue({
  data: {},
  el: '#app',
  router,
  store,
  render: h=>h(App),
  methods: {
    checkLogion () {
      // 检查是否存在session
      // cookie操作方法在源码里有或者参考网上的即可
      if (!this.getCookie('session')) {
        // 如果没有登录状态则跳转到登录页
        this.$router.push('/login')
      } else {
        // 否则跳转到登录后的页面
        this.$router.push('/')
      }
    }
  }
})
