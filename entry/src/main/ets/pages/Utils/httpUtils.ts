import axios from '@ohos/axios'

import window from '@ohos.window';

const service = axios.create({
  timeout:1000 * 60,
  headers:{
    "Content-Type": "application/json; charset=utf-8",
  }
});

service.defaults.headers.post["Access-Control-Allow-Origin"] = "*";

service.interceptors.request.use(
  (config)=>{
    // config.headers.Authorization = `Bearer ${}`
    return config;
  },
  (error)=>{
    return Promise.reject(error)
  }
)

service.interceptors.response.use(
  (response)=>{
    const newToken:any = response?.data?.data?.token;
    return Promise.resolve(response)
  },
  (error)=>{
    return error
  }
)

export {
  service
}