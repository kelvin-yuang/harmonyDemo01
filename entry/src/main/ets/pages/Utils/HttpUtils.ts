import http from '@ohos.net.http'
import {baseURL,userService} from './constant'

function httpUtil(params:any){
  return new Promise((resolve,reject)=>{
    // 1 创建http 请求对象
    let httpRequest = http.createHttp()

    // 2 发送请求
    httpRequest.request(
      `${baseURL}${userService}${params.url}`,
      {
        method:params.method,
        extraData:params.extraDate
      },

    ).then((res)=>{
      resolve(res)

    }).catch((err)=>{
      // console.log("login err:",JSON.stringify(err))
      reject(`request fail: ${JSON.stringify(err)}`)
    })
  })
}
export {
  httpUtil
}