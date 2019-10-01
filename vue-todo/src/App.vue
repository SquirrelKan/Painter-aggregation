<template>
  <div id="app">
    <!--<img src="./assets/logo.png">-->
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App'
  // provide: function () {
  //   return {
  //     reload: this.reload
  //   }
  // },
  // data () {
  //   return {
  //     isRouterAlive: true
  //   }
  // },
  // metods: {
  //   reload () {
  //     this.isRouterAlive = false
  //     this.$nextTick(function () {
  //       this.isRouterAlive = true
  //     })
  //   }
  // }
}
</script>

<style>
*{
  padding: 0;
  margin: 0;
}
html,body{
  width: 100%;
  height: 100%;
}
#app {
  height: 100%;
}

</style>
