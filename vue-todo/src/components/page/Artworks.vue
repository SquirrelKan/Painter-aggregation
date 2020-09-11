<template>
  <div>
    <el-container>
      <el-main>
        <el-card class="select-box">
          <div class="text item">
            <el-row>
              <el-col :span="4">
                <span>排序：</span>
              </el-col>
              <el-col :span="4">
                <span>综合评价</span>
              </el-col>
              <el-col :span="4">
                <span>最新入驻</span>
              </el-col>
              <el-col :span="4">
                <span>近期活跃</span>
              </el-col>
            </el-row>
          </div>
          <el-divider></el-divider>
          <div class="text item">
            <el-row>
              <el-col :span="2">
                <span>類型:</span>
              </el-col>
              <el-col :span="1" v-for="(item, index) in greneDatas" :key="index">
                <span>{{ item.name }}</span>
              </el-col>
            </el-row>
          </div>
          <el-divider></el-divider>
          <div class="text item">
            <el-row>
              <el-col :span="2">
                <span>風格:</span>
              </el-col>
              <el-col :span="1" v-for="(item, index) in styleDatas" :key="index">
                <span>
                  <a>{{ item.name }}</a>
                </span>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="4">依繪師名稱搜尋</el-col>
              <el-col :span="4">
                <el-input v-model="filter_name"></el-input>
              </el-col>
              <el-col :span="4">
                <el-button icon="el-icon-search">搜尋</el-button>
              </el-col>
            </el-row>
          </div>
        </el-card>
        <el-card class="artworks-card" v-for="(artwork, index) in filter_rows()" :key="index">
          <div slot="header" class="clearfix">
            <el-row>
              <el-col :span="2">
                <div class="grid-content bg-purple">
                  <router-link
                    :to="{name:'User', params: { id: artwork.id,nickname:artwork.nickname}}"
                  >
                    <el-image
                      style="width: 60px; height: 60px"
                      :src="artwork.icon"
                      :fit="artwork.nickname"
                    ></el-image>
                  </router-link>
                </div>
              </el-col>
              <el-col :span="2">
                <div class="grid-content bg-purple-light">
                  <span class="demonstration">{{artwork.nickname}}</span>
                </div>
              </el-col>
              <el-col :span="8">
                <div class="grid-content bg-purple">
                  <el-rate
                    v-model="artwork.rate"
                    disabled
                    show-score
                    text-color="#ff9900"
                    score-template="{value}"
                  ></el-rate>
                </div>
              </el-col>
              <el-col :span="4">
                <div class="grid-content bg-purple">
                  <el-button style="float: right; padding: 3px 0" type="text">邀請</el-button>
                </div>
              </el-col>
            </el-row>
          </div>
        </el-card>
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Artworks",
  data() {
    return {
      filter_name: "",
      greneDatas: [{ name: "全部" }, { name: "排序" }],
      styleDatas: [
        { name: "日系", id: 1 },
        { name: "平涂", id: 2 },
        { name: "萌系", id: 3 },
        { name: "厚涂", id: 4 },
        { name: "赛璐璐", id: 5 },
        { name: "日系", id: 6 },
        { name: "日系", id: 7 }
      ],
      Artworks: [{}]
    };
  },
  methods: {
    getGenre() {
      let self = this;
      self.$axios.get("/api/v1/common/genre", {}).then(function(response) {
        self.greneDatas = response.data.data;
      });
    },
    getStyle() {
      let self = this;
      self.$axios.get("/api/v1/common/style", {}).then(function(response) {
        self.styleDatas = response.data.data;
      });
    },
    filter_rows: function() {
      var filter_name = this.filter_name;
      return filter_name !== ""
        ? this.Artworks.filter(searchResult => {
            return searchResult.nickname.indexOf(filter_name) > -1;
          })
        : this.Artworks;
    }
  },
  created: function() {
    this.getGenre();
    this.getStyle();
    let self = this;
    console.log(self.Artworks);
  }
};
</script>

<style scoped>
.el-header,
.el-footer {
  background-color: #b3c0d1;
  color: #333;
  text-align: center;
  line-height: 60px;
}
.text {
  font-size: 14px;
}
.select-box {
  margin: 0 auto;
  width: 80vw;
  margin-bottom: 18px;
}
.artworks-card {
  width: 50vw;
  margin: 0 auto;
  margin-bottom: 18px;
}
.el-aside {
  background-color: #d3dce6;
  color: #333;
  text-align: center;
  line-height: 200px;
}
.el-main {
  margin: 0 auto;

  /* background-color: #e9eef3;
  color: #333;
  text-align: center;
  line-height: 160px; */
}
body > .el-container {
  margin-bottom: 40px;
}
.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}
.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
</style>
