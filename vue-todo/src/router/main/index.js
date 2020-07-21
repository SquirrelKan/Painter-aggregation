/* eslint-disable */
export default {
  path: '/',
  component: () => import( /* webpackChunkName: "Home" */ '@/components/page/Home'),
  meta: {
    title: '首頁 - 繪師集'
  },
  children: [{
      path: '',
      name: 'Main',
      meta: {
        title: '首頁 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "Main" */ '@/components/page/Main')
    }, {
      path: '/PaintInfo',
      name: 'Paint',
      meta: {
        title: '繪師 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "PaintInfo" */ '@/components/page/PaintInfo')
    }, {
      path: '/artworks',
      name: 'Artworks',
      meta: {
        title: '作品集 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "Artworks" */ '@/components/page/Artworks')
    }, {
      path: '/projects',
      name: 'Projects',
      meta: {
        title: '企劃列表 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "Projects" */ '@/components/page/Projects')
    }, {
      path: '/projects/:pid',
      name: 'ProjectsInfo',
      meta: {
        title: '企劃列表 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "ProjectsInfo" */ '@/components/page/ProjectsInfo')
    }, {
      path: '/about',
      name: 'About',
      meta: {
        title: '關於我們 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "About" */ '@/components/page/About')
    }, {
      path: '/login',
      name: 'Login',
      meta: {
        title: '登入',
        isLogin: false
      },
      component: () => import( /* webpackChunkName: "Login" */ '@/components/page/Login')
    }, {
      path: '/register',
      name: 'Register',
      meta: {
        title: '註冊',
        isLogin: false
      },
      component: () => import( /* webpackChunkName: "Register" */ '@/components/page/Register')
    }, {
      path: '/user/:nickname',
      name: 'User',
      meta: {
        title: '個人主頁',
        isLogin: false
      },
      component: () => import( /* webpackChunkName: "User" */ '@/components/page/User')
    }, {
      path: '/accoutinfo',
      name: 'AccoutInfo',
      meta: {
        title: '帳號設定',
        isLogin: false
      },
      component: () => import( /* webpackChunkName: "AccoutInfo" */ '@/components/page/AccoutInfo')
    }, {
      path: '/forgetPassword',
      name: 'ForgetPassword',
      meta: {
        title: '忘記密碼',
        isLogin: false
      },
      component: () => import( /* webpackChunkName: "ForgetPassword" */ '@/components/page/ForgetPassword')
    }, {
      path: '/paintindex',
      name: 'PaintIndex',
      meta: {
        title: '首頁 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "Main" */ '@/components/page/PaintIndex')
    }, {
      path: '/invite',
      name: 'Invite',
      meta: {
        title: '首頁 - 繪師集'
      },
      component: () => import( /* webpackChunkName: "Main" */ '@/components/page/Invite')
    },
    {
      path: '/404',
      component: () => import( /* webpackChunkName: "404" */ '@/components/page/404.vue'),
      meta: {
        title: '404'
      }
    }
  ]
}
