<template>
  <el-tabs :tab-position="tabPosition">
    <el-tab-pane label="進行中" style="border: solid 1px;">
      <div style="height: 1124px;width:816px;border: 2px solid;">
        <div style="width:395px;height:443px;border: solid 2px;">
          <div>
            <h1>我式標題</h1>
          </div>
          <div style="position: absolute;top: 410px;">截稿日:2019/08/07</div>
          <div style="position: absolute;top: 410px;left:216px;right:auto;  ">1,000~2,000 TWD/張</div>
          <div style="position:absolute;top:11px;left:314px;">風格:日系</div>
          <div style="position: absolute;top:67px;left:10px;">公開權限:不可公開</div>
          <div style="top:66px;left:265px;position:absolute;">交稿格式:PNG</div>
          <div
            style="position: absolute;top:105px;left:15px;width:373px;height:295px; border:2px solid;"
          ></div>
        </div>
        <div style="position: absolute;top:5px;left:400px;width:410px; height:441px;border:solid;"></div>
        <div
          class="userinfo"
          style="position: absolute;top:5px;left:867px;height:664px; width:255px;border:solid;"
        >
          <img class="userimg" src="https://s25.postimg.cc/98r2cyxdr/moe10.png" alt />
          <div>CEO</div>
          <div>修改個人資料</div>
          <div>全部計畫</div>
          <div>應徵紀錄</div>
          <div>新邀請</div>
          <div>新指名</div>
          <div>系統訊息</div>
          <el-calendar>
            <template slot="dateCell" slot-scope="{date,data}">
              <p
                :class="data.isSelected ? 'is-selected' : ''"
              >{{ data.day.split('-').slice(2).join('-') }} {{ data.isSelected ? '✔️' : ''}}</p>
            </template>
          </el-calendar>
        </div>
      </div>
    </el-tab-pane>
    <el-tab-pane label="已完成">配置管理</el-tab-pane>
    <el-tab-pane label="已中斷">角色管理</el-tab-pane>
  </el-tabs>
</template>
<script>
export default {
  name: "PaintIndex",
  data() {
    return {
      tabPosition: "left"
    };
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
