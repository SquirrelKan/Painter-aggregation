module.exports = {
    devServer: {
      proxy: {
        '/api': {
          target: 'http://10.0.4.29:8090',
          changeOrigin: true
        }
      }
    }
  }