<template>
  <div>
    <el-container>
      <el-aside>
        <!--<el-form>-->
        <el-card class="box-card">
          企划分区
          <el-checkbox-group v-model="checkList">
            <el-row>
              <el-checkbox label="商業企劃"></el-checkbox>
            </el-row>
            <el-row>
              <el-checkbox label="個人企劃"></el-checkbox>
            </el-row>
            <el-row>
              <el-checkbox label="一般企劃"></el-checkbox>
            </el-row>
          </el-checkbox-group>
          <el-divider></el-divider>企劃類型
          <el-divider></el-divider>截稿日期
          <span class="demonstration" style="float:right;">{{ deadline }}</span>
          <el-slider
            v-model="datavalue"
            @input="currentChangeSilder"
            :show-tooltip="false"
            :max="3"
            :marks="marks"
          ></el-slider>
          <el-divider></el-divider>
          <el-row>稿酬區間</el-row>
          <el-row>
            <el-col :span="11">
              <div class="grid-content bg-purple">
                <el-input v-model="price.lower_price" placeholder="50"></el-input>
              </div>
            </el-col>
            <el-col :span="2">
              <span>~</span>
            </el-col>
            <el-col :span="11">
              <div class="grid-content bg-purple-light">
                <el-input v-model="price.upper_price" placeholder="不限"></el-input>
              </div>
            </el-col>
          </el-row>
          <el-divider></el-divider>排序方式
          <el-select v-model="value" placeholder="请选择">
            <el-option
              v-for="item in projects"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-card>
        <!--</el-form>-->
      </el-aside>
      <el-main>
        <el-row :gutter="20">
          <el-col class="cardheight" :span="12" v-for="(item ,index) in projectsInfo" :key="index">
            <router-link :to="{name:'ProjectsInfo', params: { pid: item.projects_id}}">
              <el-card class="box-card">
                <el-row>
                  <el-col>
                    <span>{{item.projects_name}}</span>
                    <el-button style="float: right; padding: 3px 0" type="text">
                      {{item.lower_price}} ~ {{item.upper_price}}
                      <span>NTD/張</span>
                    </el-button>
                    <el-divider></el-divider>
                    <!-- 發布於{{ item.start_dt }} -->
                  </el-col>
                </el-row>
                <el-row>{{item.date}}</el-row>
                <el-row>
                  <el-col :span="6">
                    <span>用途</span>
                    <br />
                    <span>{{item.use_name}}</span>
                  </el-col>
                  <el-col :span="6">
                    截稿日期
                    <br />
                    {{item.end_dt}}
                  </el-col>
                  <el-col :span="6">
                    風格要求
                    <br />
                    {{item.style_name}}
                  </el-col>
                  <el-col :span="6">
                    應徵人數
                    <br />
                  </el-col>
                </el-row>
                <el-row>
                  <el-divider></el-divider>
                  <el-col>
                    詳細摘要
                    <span style="font-size: 12px; color:rgb(74, 10, 10);">{{item.summary}}</span>
                  </el-col>
                </el-row>
              </el-card>
            </router-link>
          </el-col>
        </el-row>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          background
          :page-size="pageSize"
          layout="prev, pager, next"
          :total="total"
        ></el-pagination>
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      total: 0,
      currentPage: 1,
      pageSize: 5,
      tempList: [],
      list: [],
      price: { lower_price: "", upper_price: "" },
      checkList: ["选中且禁用", "商業企劃"],
      datavalue: 0,
      projects: [
        {
          value: "選項1",
          label: "發布時間",
        },
        {
          value: "選項2",
          label: "稿酬預算",
        },
        {
          value: "選項3",
          label: "雇主信譽",
        },
        {
          value: "選項4",
          label: "應徵人數",
        },
      ],
      value: "",
      marks: {
        0: "",
        1: "",
        2: "",
        3: "",
      },
      deadline: "一個月內",
      projectsInfo: [],
    };
  },
  methods: {
    getProjects() {
      let self = this;
      self.$axios
        .get("/api/v1/project/projects", {})
        .then(function (response) {
          //console.log('getProjects test')
          self.projectsInfo = response.data.data.projects;
          // console.log(response.data.data);
          //console.log(self.projects)
          self.tempList = [];
          // for (var i = 0; i < self.pageSize; i++) {
          //   self.tempList.push(self.projects[i]);
          // }
        })
        .catch(function (_error) {
          console.log(_error);
        });
    },
    handleSizeChange: function (pageSize) {
      // 每页条数切换
      this.pageSize = pageSize;
      this.handleCurrentChange(this.currentPage);
    },
    handleCurrentChange: function (currentPage) {
      // 页码切换
      this.currentPage = currentPage;
      this.currentChangePage(this.projectsInfo, currentPage);
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
    },
    currentChangeSilder() {
      console.log("aa");
      var s = "一個月內";
      switch (this.datavalue) {
        case 0:
          s = "一個月內";
          break;
        case 1:
          s = "三個月內";
          break;
        case 2:
          s = "六個月內";
          break;
        case 3:
          s = "全部";
          break;
      }
      this.deadline = s;
    },
  },
  created: function () {
    this.getProjects();
  },
};
</script>

<style scoped>
.cardheight {
  /*margin: 0 0 0 20;*/
  margin-bottom: 20px;
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
/*text-align: center;*/
/*  line-height: 200px;*/
/*  height: 600px;*/
/*}*/
/*.el-main {*/
/*background-color: #E9EEF3;*/
/*color: #333;*/
/*text-align: center;*/
/*line-height: 160px;*/
/*width: 60vw;*/
/*height: 60vh;*/
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
