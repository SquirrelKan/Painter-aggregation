<template>
  <div class="el-container">
    <div style="height:100vh;width:80vw;border:solid;">
      <div>應徵紀錄</div>
      <el-table :data="tableData" stripe style="top:20px;width: 100%">
        <el-table-column prop="date" label="日期" width="180"></el-table-column>
        <el-table-column prop="inviteMan" label="邀請人" width="180"></el-table-column>
        <el-table-column prop="projectTitle" label="企劃標題"></el-table-column>
        <el-table-column prop="deadline" label="應徵截止日" width="180"></el-table-column>
        <el-table-column prop="price" label="稿酬/張TWD" width="180"></el-table-column>
        <el-table-column prop="status" label="狀態" width="180"></el-table-column>
      </el-table>
    </div>

    <div class="userinfo" style="height:100vh;width:20vw;border:solid;">
      <img class="userimg" src="https://s25.postimg.cc/98r2cyxdr/moe10.png" alt />
      <div>CEO</div>
      <div>修改個人資料</div>
      <div>全部計畫</div>
      <div>應徵紀錄</div>
      <div>新邀請</div>
      <div>新指名</div>
      <div>系統訊息</div>
      <el-calendar id="calendar">
        <template slot="dateCell" slot-scope="{date, data}">
          <div v-if="data.day.split('-').slice(1)[0] == value">
            <!-- //判断显示当前页，value是显示当前月份 -->
            <div
              v-if="handleSelected(data.day) == 0 "
              class="calendar-day"
            >{{ data.day.split('-').slice(2).join('-') }}</div>
            <div
              v-if="handleSelected(data.day) == 1 "
              class="calendar-day"
              style="color: red;"
            >{{ data.day.split('-').slice(2).join('-') }}</div>

            <!-- <p v-if="handleSelected(data.day) == 0 ">缺勤两次</p>
            <p v-if="handleSelected(data.day) == 1 ">缺勤一次</p>
            <p v-if="handleSelected(data.day) == 2 ">打卡正常</p>-->
          </div>
        </template>
      </el-calendar>
    </div>
  </div>
</template>
<script>
export default {
  name: "Invite",
  data() {
    return {
      tableData: [
        {
          date: "2016-05-02",
          inviteMan: "想不到公司",
          projectTitle: "想不到",
          deadline: "2020/01/10",
          price: 3000,
          popcount: 2,
          status: "未讀取"
        },
        {
          date: "2016-05-02",
          inviteMan: "看不到公司",
          projectTitle: "看不到",
          deadline: "2020/01/10",
          price: 878787,
          popcount: 2,
          status: "未讀取"
        }
      ],
      attendanceDetailsData: [
        {
          number: 1,
          time: "2020-07-08"
        }
      ],
      value: 7
    };
  },
  methods: {
    handleSelected(day) {
      console.log(day)
      let flag = 0; //默认显示为0
      this.attendanceDetailsData.forEach(item => {
        //this.attendanceDetailsData是后台返回的数据
        if (item.time == day) {
          //判断显示数据
          flag = item.number;
          return;
        }
      });
      return flag;
    }
  }
};
</script>

<style scoped>
.is-selected {
  color: #1989fa;
}
.userinfo {
  text-align: center;
}
.userimg {
  position: relative;
  border-radius: 100%;
  max-height: 100px;
  max-width: 100px;
  /* border: solid 1px; */
  display: flex;
  margin: auto;
}
</style>
