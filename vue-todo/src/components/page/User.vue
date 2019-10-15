<template>
  <div>
    <!--<input type="text" v-model="nickname"/>-->
    <!--<el-image-->
    <!--  style="width: 100%; height: 30vh"-->
    <!--  :src="'https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg'">-->
    <!--</el-image>-->

    <main>
      <section>
        <div class="paintter-pag">
          <!-- <img src="../../assets/image/back1.png" alt=""> -->
        </div>
      </section>
      <section>
        <div class="paintter-main-pag">
          <section>
            <div class="paintter-main-pag">
              <img class="userimg" src="https://s25.postimg.cc/98r2cyxdr/moe10.png" alt />
              <span>{{nickname }}</span>
              <br />
              <span>{{userInfo1}}位粉絲</span>
              <br />
              <span>
                {{userInfo1}}位關注
                <ElButton type="button">+關注</ElButton>
              </span>
              <br />
              <span>
                <el-rate
                  v-model="rate"
                  disabled
                  show-score
                  text-color="#ff9900"
                  score-template="{value}"
                ></el-rate>
              </span>
              <span>共有{{userInfo1}}個評價</span>
              <br />
              <span>
                <el-button type="text" @click="dialogTableVisible = true">查看更多</el-button>
              </span>
            </div>
          </section>
        </div>
      </section>
      <section>
        <div class="paintter-body-pag">
          {{nickname}}安安
          {{userInfo}}
        </div>
      </section>
    </main>
    <el-dialog class="userInfo" title :visible.sync="dialogTableVisible">
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">
            <el-image style="width: 60px; height: 60px" :src="userInfo.icon" :fit="nickname"></el-image>
          </div>
        </el-col>
        <el-col :span="2">
          <div class="grid-content bg-purple-light">
            <span class="demonstration">{{userInfo.nickname}}</span>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="grid-content bg-purple">
            <el-rate
              v-model="rate"
              disabled
              show-score
              text-color="#ff9900"
              score-template="{value}"
            ></el-rate>
          </div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple">
            <span>{{userInfo1}}關注</span>
            <el-button style="float: right; padding: 3px 0" type="text">+關注</el-button>
          </div>
        </el-col>
      </el-row>
      {{userInfo1}}粉絲
      <el-divider></el-divider>
      <div style="text-align: center; border:solid 1px;">
        <el-image style="width: 60px; height: 60px" :src="userInfo.icon" :fit="fit"></el-image>
        <br />
        <div style="margin:auto; width:150px;">{{userInfo.about}}</div>
      </div>
      <el-divider></el-divider>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "User",
  data() {
    return {
      nickname: "",
      Artworks: [{}],
      userInfo: "",
      rate: 5,
      userInfo1: 87,
      dialogTableVisible: true,
      dialogFormVisible: false
    };
  },
  created: function() {
    console.log(this.$route.params.nickname);
    this.nickname = this.$route.params.nickname;
    this.getPaint();
  },
  methods: {
    getPaint() {
      let self = this;
      self.$axios
        .post("/api/v1/gettest", { nickname: self.nickname })
        .then(function(response) {
          console.log(response.data);
          self.userInfo = response.data.data.user[0];
          console.log(self.userInfo);
        })
        .catch(function(_error) {
          console.log(_error);
        });
    }
  }
};
</script>

<style scoped>
.paintter-pag {
  position: relative;
  width: 100%;
  height: 50vw;
  max-height: 640px;
  min-height: 176px;
  background-image: url(../../assets/image/back1.png);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-color: rgb(250, 250, 250, 0.2);
  background-position: center center;
  background-size: cover;
  /* border: solid 1px; */
  /* float: left; */
  /* margin-bottom: 5px; */
}
@media (min-height: 600px) and (max-height: 800px) {
  .paintter-pag {
    max-height: 540px;
  }
}

.paintter-main-pag {
  height: 30vh;
  width: 100%;
  border: solid 1px;
  float: left;
  text-align: center;
  /* margin: 0px auto; */
}

.paintter-main-pag.img {
  height: 30vh;
  width: 20%;
  border: solid 1px;
  display: flex;
  margin: 0px auto;
}

.userimg {
  position: relative;
  border-radius: 100%;
  max-height: 100px;
  max-width: 100px;
  /* border: solid 1px; */
  display: flex;
  margin: -40px auto;
}

.paintter-main-pag span {
  position: relative;
  height: 100px;
  max-width: 100px;
  /* margin: -80px auto; */
  top: 50px;
  font-size: 24px;
  /* text-align: center;
    display: flex; */
  /* margin: 0px auto; */
}

.paintter-body-pag {
  height: 200vh;
  width: 100%;
  float: left;
  border: solid 1px;
  background-color: #e6eaee;
}

.userInfo {
  /* width: 300px; */
  margin: auto;
}
.userInfo img {
  width: 84px;
}
</style>
