module.exports = {
    devServer: {
      proxy: {
        '/api': {
          target: 'http://localHost:8090',
          changeOrigin: true
        }
      }
    }
  }