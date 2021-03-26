import axios from "axios";
import Vue from 'vue'

axios.defaults.timeout = 5000;


const instance = axios.create(config)

let config = {
    // 每次请求的协议、IP地址。  设置该配置后，每次请求路径都可以使用相对路径，例如"/admin/login"
    baseURL: "http://localhost",
    // 请求超时时间
    timeout: 10000,
    // 每次请求携带cookie
    withCredentials: true
}

axios.interceptors.request.use(
    config => {


        config.headers = {

            DeviceType: 'H5'
        } //設定響應頭部
        return config
    }
)

export function post(url, params) {


    return new Promise((resolve, reject) => {


        axios.post(url, params)
            .then(res => {


                resolve(res.data)
            })
            .catch(err => {


                reject(err.data)
            })
    })
}


export default instance