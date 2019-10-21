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
              <el-col :span="1" v-for="(item, index) in classDatas" :key="index">
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
              <el-col :span="1">全部</el-col>
              <el-col :span="1" v-for="(item, index) in styleDatas" :key="index">
                <span>{{ item.name }}</span>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="4">依繪師名稱搜尋</el-col>
              <el-col :span="4">
                <el-input v-model="input"></el-input>
              </el-col>
              <el-col :span="4">
                <el-button icon="el-icon-search">搜尋</el-button>
              </el-col>
            </el-row>
          </div>
        </el-card>
        <el-card class="paintInfo-card" v-for="(paintInfo, index) in tempList" :key="index">
          <!--<el-card class="paintInfo-card"">-->
          <div slot="header" class="clearfix">
            <el-row>
              <el-col :span="2">
                <div class="grid-content bg-purple">
                  <router-link :to="{name:'User', params: { pid:  paintInfo.nickname}}">
                    <el-image
                      style="width: 60px; height: 60px"
                      :src="paintInfo.icon"
                      :fit="paintInfo.nickname"
                    ></el-image>
                  </router-link>
                </div>
              </el-col>
              <el-col :span="2">
                <div class="grid-content bg-purple-light">
                  <span class="demonstration">{{paintInfo.nickname}}</span>
                </div>
              </el-col>
              <el-col :span="8">
                <div class="grid-content bg-purple">
                  <el-rate
                    v-model="paintInfo.rate"
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
          <!--<div class="block" >-->
          <!--<span class="demonstration">自定义</span>-->
          <!--  <el-image :src="src" >-->
          <!--    <div slot="placeholder" class="image-slot">-->
          <!--      加载中<span class="dot">...</span>-->
          <!--    </div>-->
          <!--  </el-image>-->
          <!--</div>-->
          <div>
            <el-row>
              <el-col
                :span="4"
                :offset="1"
                v-for="(image, index) in paintInfo.images"
                :key="index"
                class="text item"
              >
                <el-image style="width: 229.500px; height: 149.672px" :src="image.src" :fit="'fit'"></el-image>
              </el-col>
            </el-row>
          </div>
        </el-card>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          background
          :page-size="pageSize"
          layout="prev, pager, next"
          :total="paintInfos.length"
        ></el-pagination>
      </el-main>
      <el-footer>Footer</el-footer>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Paint",
  delimiters: ["${", "}"],
  data() {
    return {
      input: "",
      paintInfos: [
        {
          pid: "1",
          nickname: "風滅",
          icon: "https://s25.postimg.cc/98r2cyxdr/moe10.png",
          rate: 3,
          images: [
            {
              src:
                "https://cw1.tw/CW/images/article/201608/article-57a06c0800d14.jpg"
            },
            {
              src:
                "https://imgs.gvm.com.tw/upload/gallery/20171128/41252_02.jpg"
            }
          ]
        },
        {
          pid: "2",
          nickname: "奏夜",
          icon: "https://s25.postimg.cc/qysqxzg3j/moe9.png",
          rate: 5,
          images: [
            {
              src:
                "https://cw1.tw/CW/images/article/201608/article-57a06c0800d14.jpg"
            }
          ]
        }
      ],
      classDatas: [{ name: "全部" }, { name: "排序" }],
      styleDatas: [
        { name: "日系", id: 1 },
        { name: "平涂", id: 2 },
        { name: "萌系", id: 3 },
        { name: "厚涂", id: 4 },
        { name: "赛璐璐", id: 5 },
        { name: "日系", id: 6 },
        { name: "日系", id: 7 }
      ],
      total: 0,
      currentPage: 1,
      pageSize: 5,
      tempList: []
    };
  },
  mounted() {
    //this.getPaint()
    this.currentChangePage(this.paintInfos, this.currentPage);
  },
  methods: {
    getPaint() {
      let self = this;
      self.$axios
        .get("/api/v1/getPaint", {})
        .then(function(response) {
          // console.log(response.data)
          self.paintInfos = response.data.data.paints;
          self.tempList = [];
          for (var i = 0; i < self.pageSize; i++) {
            self.tempList.push(self.paintInfos[i]);
          }
        })
        .catch(function(_error) {
          console.log(_error);
        });
    },
    handleSizeChange: function(pageSize) {
      // 每页条数切换
      this.pageSize = pageSize;
      this.handleCurrentChange(this.currentPage);
    },
    handleCurrentChange: function(currentPage) {
      // 页码切换
      this.currentPage = currentPage;
      this.currentChangePage(this.paintInfos, currentPage);
    },
    // 分页方法（重点）
    currentChangePage(list, currentPage) {
      let from = (currentPage - 1) * this.pageSize;
      let to = currentPage * this.pageSize;
      this.tempList = [];
      for (; from < to; from++) {
        if (list[from]) {
          this.tempList.push(list[from]);
        }
      }
    }
  },
  created: function() {
    // let self = this
    // this.handleSizeChange()
    this.getPaint();
    // console.log(self.paintInfos)
    // console.log('test' + self.classDatas)
    // console.log(self.classDatas)
  }
};
</script>

<style scoped>
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
.el-main {
  margin: 0 auto;
}
.select-box {
  margin: 0 auto;
  width: 80vw;
  margin-bottom: 18px;
}
.paintInfo-card {
  width: 50vw;
  margin: 0 auto;
  margin-bottom: 18px;
}
</style>
