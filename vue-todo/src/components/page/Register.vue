<template>
  <div>
    <el-form :model="submitForm" status-icon :rules="rules" ref="submitForm" label-width="100px">
      <el-form-item label="暱稱" prop="nickName">
        <el-input v-model="submitForm.nickName" placeholder="請輸入暱稱" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="帳號" prop="username">
        <el-input v-model="submitForm.username" placeholder="請輸入帳號" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="email" prop="email">
        <el-input v-model="submitForm.email" placeholder="請輸入email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="密碼" prop="password">
        <el-input
          type="password"
          v-model="submitForm.password"
          placeholder="請輸入密碼"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="確認密碼" prop="confirmpassword">
        <el-input
          type="password"
          v-model="submitForm.confirmpassword"
          placeholder="確認密碼"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmitClick('submitForm')">註冊</el-button>
        <el-button type="primary" @click="toLogin()">登入</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import md5 from "js-md5";
export default {
  name: "Register",
  data() {
    let validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("請再輸入"));
      } else if (value !== this.submitForm.password) {
        callback(new Error("兩次輸入密碼不一致!"));
      } else {
        callback();
      }
    };
    return {
      submitForm: {
        nickName: "",
        username: "",
        email: "",
        password: "",
        confirmpassword: "",
        identity: "2",
      },
      rules: {
        nickName: [
          { required: true, message: "請輸入暱稱", trigger: "blur" },
          { min: 2, max: 6, message: "暱稱在6個字以內", trigger: "blur" },
        ],
        account: [
          { required: true, message: "請輸入帳號", trigger: "blur" },
          { min: 1, max: 50, message: "帳號在50個字以內", trigger: "blur" },
          { pattern: /^\S+$/, message: "不允許有空格", trigger: "blur" },
        ],
        email: [{ required: true, message: "請輸入email", trigger: "blur" }],
        password: [
          {
            required: true,
            message: "請輸入密碼",
            trigger: "blur",
          },
          {
            pattern: /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W_]).{6,20}$/,
            message: "请输入长度为6-20位包含数字、字母、特殊字符的密码",
            trigger: "blur",
          },
        ],
        confirmpassword: [
          // {
          //   required: true,
          //   message: "請輸入確認密碼",
          //   trigger: "blur"
          // },
          { validator: validatePass, trigger: "change" },
        ],
      },
    };
  },
  methods: {
    onSubmitClick(formName) {
      this.$refs[formName].validate((vaild) => {
        console.log(vaild);
      });
      let self = this;
      console.log(self.submitForm);
      if (self.submitForm.username !== "" && self.submitForm.password !== "") {
        self.$axios
          .post("/api/v1/auth/getUserInfo", {
            username: self.submitForm.username,
          })
          .then(function (response) {
            let data = response.data;
            console.log(data);
            if (data.status === "0001") {
              console.log("帳號存在");
              self.$message({
                showClose: true,
                message: "帳號存在，請重新輸入",
                type: "error",
              });
            } else if (data.status === "0000") {
              console.log("帳號不存在");
              self.$axios
                .post("/api/v1/auth/register", {
                  nickName: self.submitForm.nickName,
                  username: self.submitForm.username,
                  email: self.submitForm.email,
                  password: md5(self.submitForm.password),
                  identity: self.submitForm.identity,
                })
                .then(function (response) {
                  let data = response.data;
                  console.log(data);
                  if (data.status === 200) {
                    console.log;
                    localStorage.setItem("claims", response.data.data.claims);
                    self.$message({
                      showClose: true,
                      message: "恭喜妳，已成功註冊",
                      type: "success",
                    });
                    self.$router.push({ name: "AccoutInfo" });
                  } else {
                    self.$message({
                      showClose: true,
                      message: "登入失敗",
                      type: "error",
                    });
                  }
                });
            }
          });
      }
    },
    toLogin() {
      this.$router.push("/login");
    },
  },
  created: function () {
    let claims = localStorage.getItem("claims");
    if (claims) {
      this.$router.push({ name: "Home" });
    }
  },
};
</script>

<style>
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>
