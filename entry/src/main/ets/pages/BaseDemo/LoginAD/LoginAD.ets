// @ts-nocheck
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { HeaderBackRouter } from '../../Components/HeaderBackRouter'
import userModel from './model/userInfo'
import {Loading} from '../../Components/Loading'

@Entry
@Component
struct LoginInAD {
  @State params?: any = router?.getParams()

  @State user?:string = "newuser03"
  @State pass?:string = "123456789"

  @State loading:boolean = false

  handleLogin(){
    // 调 loading 出来
    this.loading = true

    userModel.toLogin(this.user,this.pass).then((res)=>{
      const result = JSON.parse(res.result)
      console.log("login res:",result.data)
      // 关闭 loading
      this.loading = false

      if(result?.data?.result===true){
        try {
          promptAction.showToast({
            message: 'Login Success',
            duration: 2000,
          });
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
        };
        // 跳转页面到 列表页
        setTimeout(()=>{
          router.replaceUrl(
            {
              url: "pages/BaseDemo/LoginAD/MainPage",
              params: { title: "Main Page" }
            },
              router.RouterMode.Single,
              (err) => {
              if (err) {
                console.log("router fails Login:", err.code, err.message)
              }
            }
          )
        },2000)


      }else{
        try {
          promptAction.showToast({
            message: 'Incorrect username or password',
            duration: 2000,
          });
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
        };
      }

    })

  }

  build() {
      Column() {

        Row() {
          HeaderBackRouter({ title: this.params?.title || "" })
        }

        Stack(){
          Column(){
            Loading({loading: this.loading})
          }.zIndex(999)

          Column({ space: 10 }){
            Row(){
              Text(`USR:`).margin({right:20}).padding(5)
              TextInput({
                placeholder:"username",
                text:this.user
              }).width("60%").borderRadius(5).type(InputType.Normal)
                .onChange( (value)=>{
                  console.log("username",value)
                  this.user = value
                })
            }.margin({top:50})

            Row(){
              Text(`PSW:`).margin({right:20}).padding(5)
              TextInput({
                placeholder:"password",
                text:this.pass
              }).width("60%").borderRadius(5).type(InputType.Password)
                .onChange( (value)=>{
                  // console.log("username",value)
                  this.pass = value
                })
            }

            Row(){
              Button('Login in').type(ButtonType.Normal).borderRadius(5)
                .onClick(()=>{
                  this.handleLogin()
                })

            }.margin({top:50})

          }.height("100%").width("100%").padding(20).zIndex(99)
        }

      }.width('100%')
  }
}