import http from '@ohos.net.http'
import {baseURL} from '../../../Utils/constant'

class UserModel{

  toLogin(user:string,pass:string): Promise<any> {
    console.log("toLogin",user,pass)

    return new Promise((resolve,reject)=>{
      // 1 创建http 请求对象
      let httpRequest = http.createHttp()

      // 2 发送请求
      httpRequest.request(
        `${baseURL}/userServer/userinfo/api/ldapSinIn`,
        {
          method:http.RequestMethod.POST,
          extraData:{username:user,password:pass}
        },

      ).then((res)=>{
        resolve(res)

      }).catch((err)=>{
        // console.log("login err:",JSON.stringify(err))
        reject(`request fail: ${JSON.stringify(err)}`)
      })

    })
  }
}
const userModel = new UserModel();
export default userModel