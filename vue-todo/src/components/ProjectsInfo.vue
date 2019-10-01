<template>
    <div>
      <el-image
        style="width: 100%; height: 30vh"
        :src="'https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg'"
        :fit="'none'">
      </el-image>
      {{nickname }}
      <!--<input type="text" v-model="nickname"/>-->
            <!--<el-image-->
            <!--  style="width: 100%; height: 30vh"-->
            <!--  :src="'https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg'">-->
            <!--</el-image>-->
    </div>
</template>

<script>
export default {
  name: 'User',
  data () {
    return {
      nickname: '',
      Artworks: [
        {}
      ]
    }
  },
  created: function () {
    this.nickname = this.$route.params.pid
  }
}
</script>

<style scoped>
  .div{
  }
</style>
