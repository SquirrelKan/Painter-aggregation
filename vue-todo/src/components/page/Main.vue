<template>
  <el-carousel :interval="4000" type="card" height="200px">
    <el-carousel-item v-for="(item, index) in items" :key="index">
      <el-image style="width: 400px; height: 200px" :src="item.name" :fit="'cover'"></el-image>
    </el-carousel-item>
  </el-carousel>
</template>

<script>
export default {
  name: "Home",
  delimiters: ["${", "}"],
  data() {
    return {
      items: [
        {
          name:
            "https://ddragon.leagueoflegends.com/cdn/9.11.1/img/champion/Teemo.png"
        },
        {
          name: "https://www.upmedia.mg/upload/article/20181128164925393485.jpg"
        },
        { name: "https://s.newtalk.tw/album/news/111/5a558de0a141b.jpg" },
        {
          name:
            "https://image.redbull.com/rbcom/052/2018-11-15/7a157157-d6f7-41c7-a0b8-2441f924ff40/0012/0/0/0/1730/6921/1950/1/kda-ahri-league-of-legends.jpg"
        },
        { name: "OAO" }
      ]
    };
  },
  methods: {},
  created: function() {
    // let self = this
    // console.log(self.items)
  }
};
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

/*.el-carousel__item:nth-child(2n) {*/
/*  background-color: #99a9bf;*/
/*text-align: center;*/
/*}*/

.el-carousel__item {
  /*background-color: #d3dce6;*/
  text-align: center;
}
</style>
