export default {
  login (state) {
    state.isLogin = true
  },
  decrease (state, payload) {
    state.isLogin = false
    state.payload = payload
  }
}
