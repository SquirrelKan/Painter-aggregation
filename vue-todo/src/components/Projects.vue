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
          <span class="demonstration">默认</span>
          <el-slider v-model="datavalue"></el-slider>
          <el-divider></el-divider>
          <el-row>稿酬區間</el-row>
          <el-row>
            <el-col :span="11">
              <div class="grid-content bg-purple">
                <el-input placeholder="50"></el-input>
              </div>
            </el-col>
            <el-col :span="2">
              <span>~</span>
            </el-col>
            <el-col :span="11">
              <div class="grid-content bg-purple-light">
                <el-input placeholder="不限"></el-input>
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
          <el-col class="cardheight" :span="12" v-for="(item ,index) in projects" :key="index">
            <router-link :to="{name:'ProjectsInfo', params: { pid: item.projects_id}}">
              <el-card class="box-card">
                <el-row>
                  <!--{{ item }}-->
                  <!--{{item.userid}}-->
                  {{item.projects_name}}
                  <br />
                  發布於{{ item.release_time }}
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
                    {{item.end_time}}
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
      checkList: ["选中且禁用", "商業企劃"],
      datavalue: 0,
      projects: [
        {
          value: "選項1",
          label: "發布時間"
        },
        {
          value: "選項2",
          label: "稿酬預算"
        },
        {
          value: "選項3",
          label: "雇主信譽"
        },
        {
          value: "選項4",
          label: "應徵人數"
        }
      ],
      value: "",
      projectsInfo: [
        {
          pid: 1,
          name: "風滅",
          date: "2019-09-02",
          use: "其他·插图"
        },
        {
          pid: 2,
          name: "風滅",
          date: "2019-09-02",
          use: "其他·插图"
        },
        {
          pid: 3,
          name: "風滅",
          date: "2019-09-02",
          use: "其他·插图"
        },
        {
          pid: 4,
          name: "風滅",
          date: "2019-09-02",
          use: "其他·插图"
        }
      ]
    };
  },
  methods: {
    getProjects() {
      let self = this;
      self.$axios
        .get("/api/v1/project/getProjects", {})
        .then(function(response) {
          //console.log('getProjects test')
          self.projects = response.data.data.projects;
          //       console.log(response.data.data)
          //console.log(self.projects)
          self.tempList = [];
          for (var i = 0; i < self.pageSize; i++) {
            self.tempList.push(self.projects[i]);
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
      this.currentChangePage(this.projects, currentPage);
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
    this.getProjects();
  }
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
