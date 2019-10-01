<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="7"><div class="grid-content bg-purple"></div></el-col>
      <el-col :span="10">
        <el-form :model="submitForm" status-icon :rules="rules" ref="submitForm" label-width="100px">
          <el-form-item label="帳號" prop="username">
            <el-input v-model="submitForm.username" placeholder="請輸入帳號" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="密碼" prop="password">
            <el-input type="password" v-model="submitForm.password" placeholder="請輸入密碼" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmitClick('submitForm')">提交</el-button>
            <el-button type="primary" @click="toRegister()">註冊</el-button>
          </el-form-item>
        </el-form>
      </el-col>
      <el-col :span="7"></el-col>
    </el-row>
  </div>
</template>

<script>
import md5 from 'js-md5'
// import { mapState } from 'vuex'
export default {
  name: 'Login',
  inject: ['reload'],
  data () {
    return {
      isLogin: false,
      submitForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          { required: true, message: '請輸入帳號', trigger: 'blur' },
          { min: 1, max: 50, message: '帳號在50個字以內', trigger: 'blur' },
          { pattern: /^\S+$/, message: '不允許有空格', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入长度为6-20位包含数字、字母的密码', trigger: 'blur' }
          // { pattern: /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W_]).{6,20}$/, message: '请输入长度为6-20位包含数字、字母、特殊字符的密码', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    onSubmitClick (formName) {
      this.$refs[formName].validate((vaild) => {
        console.log(vaild)
      })
      let self = this
      if (self.submitForm.username !== '' && self.submitForm.password !== '') {
        self.$axios.post('/api/v1/auth/login', {
          username: self.submitForm.username,
          password: md5(self.submitForm.password)
        }).then(function (response) {
          let data = response.data
          // console.log(data)
          if (data.status === '0000') {
            localStorage.setItem('claims', response.data.claims)
            self.$message({
              showClose: true,
              message: '恭喜妳，已成功登陸',
              type: 'success'
            })
            // this.reload()
            // this.getuserinfo()
            // this.$store.commit('login')
            self.$router.push({name: 'Home'})
          } else {
            self.$message({
              showClose: true,
              message: '登入失敗',
              type: 'error'
            })
          }
        })
      }
      // if (item) {
      //   alert(item)
      // }
    },
    toRegister () {
      this.$router.push('/register')
    }
  },
  // computed: {
  //   ...mapState({
  //     isLogin: state => state.isLogin
  //   })
  // },
  created: function () {
    let claims = localStorage.getItem('claims')
    if (claims) {
      this.$router.push({name: 'Home'})
    }
  }
}
</script>

<style>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
.el-row {
  margin-bottom: 20px;
}
.el-col {
    border-radius: 4px;
}
.grid-content {
    border-radius: 4px;
    min-height: 36px;
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>
