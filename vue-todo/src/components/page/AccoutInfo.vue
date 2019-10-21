<template>
  <div>
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item title="個人資料設定" name="1">
        <el-form ref="updateInfo" :model="updateInfo" label-width="120px">
          <el-form-item label="真實姓名">
            <!--<el-input v-if="updateInfo.realname===''" v-model="updateInfo.name" ></el-input>-->
            <el-input v-model="updateInfo.realname" :disabled="isrealname"></el-input>
          </el-form-item>
          <el-form-item label="暱稱">
            <el-input v-model="updateInfo.nickname"></el-input>
          </el-form-item>
          <el-form-item label="手機">
            <el-input v-model="updateInfo.phone"></el-input>
          </el-form-item>
          <el-form-item label="email">
            <el-input v-model="updateInfo.email"></el-input>
          </el-form-item>
          <el-form-item label="生日">
            <el-col :span="11">
              <el-date-picker
                :disabled="isbirthday"
                type="date"
                value-format="yyyy-MM-dd"
                format="yyyy/MM/dd"
                @change="formatTime"
                placeholder="Pick a date"
                v-model="updateInfo.birthday"
                style="width: 100%;"
              ></el-date-picker>
            </el-col>
          </el-form-item>
          <el-form-item label="圖片">
            <el-col :span="11">
              <el-input v-model="updateInfo.icon"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="地址">
            <el-col :span="11">
              <el-input v-model="updateInfo.address"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item>
            <el-button>取消</el-button>
            <el-button type="primary" @click="onSubmit">送出</el-button>
          </el-form-item>
        </el-form>
      </el-collapse-item>
    </el-collapse>
    <el-dialog title="帳號資訊確認" :visible.sync="dialogVisible" width="30%">
      <el-row>
        <el-col>
          <!--<el-col v-for='o in updateInfo' :key='index' >-->
          <span>{{updateInfo}}</span>
          <!--</el-col>-->
        </el-col>
      </el-row>
      <span slot="footer" class="dialog-footer">
        <el-button @click="restData">Cancel</el-button>
        <el-button type="primary" @click="sendData">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false,
      activeNames: ["1"],
      // dialog: {
      //   title: ''
      // },
      isrealname: false,
      isbirthday: false,
      userInfo: {
        realname: "",
        nickname: "",
        email: "",
        phone: "",
        birthday: "",
        icon: "",
        address: ""
      },
      updateInfo: {
        realname: "",
        nickname: "",
        email: "",
        phone: "",
        birthday: "",
        icon: "",
        address: ""
      }
    };
  },
  methods: {
    onSubmit() {
      this.dialogVisible = true;
      if (!this.isrealname) {
        this.updateInfo.realname = this.updateInfo.realname;
      }
      if (!this.isbirthday) {
        this.updateInfo.birthday = this.updateInfo.birthday;
      }
      // console.log('submit!')
    },
    sendData() {
      let self = this;
      let claims = localStorage.getItem("claims");
      this.dialogVisible = false;
      self.$axios
        .post("/api/v1/accountmgt/updateAccountInfo", {
          headers: {
            authorization: "Bearer " + claims
          },
          updateInfo: self.updateInfo
        })
        .then(function(response) {
          let data = response.data;
          // console.log(data)
          if (data.status === "0000") {
            // localStorage.setItem('claims', response.data.claims)
            self.$message({
              showClose: true,
              message: "恭喜妳，已成功更新",
              type: "success"
            });
            // this.reload()
            // this.getuserinfo()
            // self.$router.push({name: 'Home'})
          } else {
            self.$message({
              showClose: true,
              message: "更新失敗",
              type: "error"
            });
          }
        });
      console.log(this.updateInfo);
    },
    restData() {
      this.dialogVisible = false;
      this.updateInfo = this.userInfo;
    },
    formatTime(time) {
      this.createdate = time;
    },
    handleSubmit(val) {},
    handleChange(val) {
      console.log(val);
    }
  },
  created: function() {
    let claims = localStorage.getItem("claims");
    let self = this;
    if (!claims) {
      this.$router.push({ name: "Login" });
    }
    // let self = this
    self.$axios
      .get("/api/v1/accountmgt/getAccountInfo", {
        headers: {
          authorization: "Bearer " + claims
        }
      })
      .then(function(response) {
        // response
        if (response.data.status === "0000") {
          self.userInfo = response.data.userInfo;
          self.updateInfo = response.data.userInfo;
          if (self.updateInfo.birthday) {
            self.isbirthday = true;
          }
          if (self.updateInfo.realname) {
            self.isrealname = true;
          }
          // console.log(self.userInfo)
        }
      })
      .catch(function(_error) {
        console.log(_error);
      });
  }
};
</script>
