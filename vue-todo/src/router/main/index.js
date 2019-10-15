import Main from '@/components/Main'
import Home from '@/components/Home'
import Paint from '@/components/Paint'
import Artworks from '@/components/Artworks'
import About from '@/components/About'
import Projects from '@/components/Projects'
import Login from '@/components/Login'
import Register from '@/components/Register'
import User from '@/components/User'
import AccoutInfo from '@/components/AccoutInfo'
import ProjectsInfo from '@/components/ProjectsInfo'
export default {
  path: '/',
  component: Main,
  meta: {
    title: '首頁 - 繪師集'
  },
  children: [{
    path: '',
    name: 'Home',
    meta: {
      title: '首頁 - 繪師集'
    },
    component: Home
  }, {
    path: '/paint',
    name: 'Paint',
    meta: {
      title: '繪師 - 繪師集'
    },
    component: Paint
  }, {
    path: '/artworks',
    name: 'Artworks',
    meta: {
      title: '作品集 - 繪師集'
    },
    component: Artworks
  }, {
    path: '/projects',
    name: 'Projects',
    meta: {
      title: '企劃列表 - 繪師集'
    },
    component: Projects
  }, {
    path: '/projects/:pid',
    name: 'ProjectsInfo',
    meta: {
      title: '企劃列表 - 繪師集'
    },
    component: ProjectsInfo
  }, {
    path: '/about',
    name: 'About',
    meta: {
      title: '關於我們 - 繪師集'
    },
    component: About
  }, {
    path: '/login',
    name: 'Login',
    meta: {
      title: '登入',
      isLogin: false
    },
    component: Login
  }, {
    path: '/register',
    name: 'Register',
    meta: {
      title: '註冊',
      isLogin: false
    },
    component: Register
  }, {
    path: '/user/:pid',
    name: 'User',
    meta: {
      title: '個人主頁',
      isLogin: false
    },
    component: User
  }, {
    path: '/accoutinfo',
    name: 'AccoutInfo',
    meta: {
      title: '帳號設定',
      isLogin: false
    },
    component: AccoutInfo
  }]
}