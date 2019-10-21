<template>
  <div>
    <!--<el-header>-->
    <el-menu
      :default-active="$route.path"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
      @update="login"
    >
      <el-row>
        <el-col :span="1" :offset="0">
          <el-menu-item index="/">首頁</el-menu-item>
        </el-col>
        <el-col :span="1" :offset="0">
          <el-menu-item index="/paint">繪師</el-menu-item>
        </el-col>
        <el-col :span="1" :offset="0">
          <el-menu-item index="/projects">企劃</el-menu-item>
        </el-col>
        <el-col :span="1" :offset="0">
          <el-menu-item index="/artworks">作品</el-menu-item>
        </el-col>
        <el-col :span="2" :offset="0">
          <el-menu-item index="/about">關於我們</el-menu-item>
        </el-col>
        <el-col :span="2" :offset="15">
          <el-menu-item v-if="!isLogin" index="/login">登入</el-menu-item>
          <el-menu-item v-else>
            <el-dropdown>
              <el-button type="primary">
                Hi {{userInfo.nickname}}
                <i class="el-icon-arrow-down el-icon--right"></i>
              </el-button>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>
                  <router-link to="/accoutinfo">個人資料</router-link>
                </el-dropdown-item>
                <el-dropdown-item>Action 2</el-dropdown-item>
                <el-dropdown-item>Action 3</el-dropdown-item>
                <el-dropdown-item>Action 4</el-dropdown-item>
                <el-dropdown-item>Action 5</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </el-menu-item>
        </el-col>
        <el-col :span="1">
          <el-menu-item v-if="!isLogin" index="/register">註冊</el-menu-item>
          <el-menu-item v-else @click="loginout">登出</el-menu-item>
        </el-col>
      </el-row>
    </el-menu>
    <!--</el-header>-->
    <el-main>
      <router-view></router-view>
    </el-main>
  </div>
</template>
<script>
// import { mapState } from 'vuex'
export default {
  name: "Name",
  provide: function() {
    return {
      reload: this.reload,
      getUserInfo: this.getuserinfo
    };
  },
  data() {
    return {
      activeIndex: "1",
      isLogin: false,
      userInfo: {
        username: "",
        identity_name: ""
      }
    };
  },
  mounted() {
    this.getUserInfo();
  },
  // computed: {
  //   ...mapState({
  //     // isLogin: state => state.isLogin
  //   })
  // },
  methods: {
    getUserInfo() {
      this.isLogin = false;
      let self = this;
      let claims = localStorage.getItem("claims");
      console.log(claims);
      if (claims) {
        self.$axios
          .get("/api/v1/auth/getUserInfo", {
            headers: {
              authorization: "Bearer " + claims
            }
          })
          .then(function(response) {
            if (response.data.status === "0000") {
              console.log(response.data);
              self.userInfo = response.data.userInfo;
              self.isLogin = true;
              // this.$store.commit('login')
              console.log(self.userInfo);
            }
          })
          .catch(function(_error) {
            console.log(_error);
          });
      }
    },
    handleSelect(key, keyPath) {
      if (key !== null) {
        this.$router.push(key);
      }
      // console.log(key, keyPath)
    },
    loginout() {
      // let self = this
      localStorage.removeItem("claims");
      // console.log(self.username)
      this.getUserInfo();
    },
    login() {
      this.getUserInfo();
    },
    reload() {
      this.getUserInfo();
    }
  },
  created: function() {
    // this.getUserInfo()
  }
};
</script>

<style scoped>
.el-header {
  position: fixed;
  right: 0;
  top: 50%;
  width: 8em;
  margin-top: -2.5em;
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

/* 設定 el-aside的css配置*/
.el-aside {
  color: #333;
  position: relative;
  float: left;
  top: 0px;
  bottom: 0px;
  background-color: rgb(238, 241, 246);
  height: 100vh;
}
.el-col {
  text-align: center;
}

/*.el-header, .el-footer {*/
/*  background-color: #B3C0D1;*/
/*  color: #333;*/
/*  text-align: center;*/
/*  line-height: 60px;*/
/*}*/
/*.el-aside {*/
/*  background-color: #D3DCE6;*/
/*  color: #333;*/
/*  text-align: center;*/
/*  line-height: 200px;*/
/*}*/
/*.el-main {*/
/*  background-color: #E9EEF3;*/
/*  color: #333;*/
/*  text-align: center;*/
/*  line-height: 160px;*/
/*}*/
/*body > .el-container {*/
/*  margin-bottom: 40px;*/
/*}*/
/*.el-container:nth-child(5) .el-aside,*/
/*.el-container:nth-child(6) .el-aside {*/
/*  line-height: 260px;*/
/*}*/
/*.el-container:nth-child(7) .el-aside {*/
/*  line-height: 320px;*/
/*}*/
</style>
