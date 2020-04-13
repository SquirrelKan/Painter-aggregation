<template>
  <div>
    <el-header></el-header>
    <el-container>
      <el-aside>
        {{project.nickname}}
        <span>截稿日期{{project.end_dt}}</span>
      </el-aside>
      <el-main>
        <el-card :body-style="{ padding: '0px' }">
          <div slot="header">
            <span>
              <!-- card title -->
            </span>
          </div>
          應徵截止
          需要人數
          截稿日期 稿酬{{project.lower_price}} ~{{project.upper_price}}
        </el-card>
        {{project}}
        <br />
        {{project.projects_name}}
        <br />
        {{project.style_name}}
        <br />
        <br />
        {{project.summary}}
        <el-image
          style="width: 100%; height: 30vh"
          :src="'https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg'"
          :fit="'none'"
        ></el-image>
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      nickname: "",
      Artworks: [{}],
      project: {}
    };
  },
  methods: {
    getProjectInfo(pid) {
      let self = this;
      self.$axios
        .post("/api/v1/project/getProject", {
          pid: pid
        })
        .then(function(response) {
          //console.log('getProjects test')
          self.project = response.data.data.project;
          if (self.project.projects_name != "")
            document.title = self.project.projects_name + " - 繪師集";
          // console.log(response.data.data);
          //console.log(self.projects)
          // self.tempList = [];
          // for (var i = 0; i < self.pageSize; i++) {
          //   self.tempList.push(self.projects[i]);
          // }
        })
        .catch(function(_error) {
          console.log(_error);
        });
    }
  },
  created: function() {
    this.nickname = this.$route.params.pid;
    this.getProjectInfo(this.$route.params.pid);
  }
};
</script>

<style scoped>
/* .el-header, */
.el-footer {
  background-color: #b3c0d1;
  color: #333;
  text-align: center;
  line-height: 60px;
}
.el-aside {
  background-color: #d3dce6;
  color: #333;
  text-align: center;
  line-height: 200px;
}
.el-main {
  background-color: #e9eef3;
  color: #333;
  text-align: center;
  line-height: 160px;
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
