import hilog from '@ohos.hilog'
import {getRandomInt} from '../Utils/Utils'

class ValueObject {
  value: string = ''
}

// @Entry
@Component
struct Loading {
  @State message:string = "Loading component"
  @Prop
  loading:boolean


  // color 设置加载进度条前景色
  @State selectColor: Color = Color.Black
  @State colorList: Color[] = [Color.Black, Color.Blue, Color.Brown, Color.Green, Color.Orange, Color.Grey]

  // width 宽度通用属性
  @State widthValue: number = 48
  // height 高度通用属性
  private heightValue: number = 200
  private timer: any

  aboutToAppear() {
    console.log("loading",this.loading)
    this.runTimer()
  }

  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 2 on Page Show`)
  }

  onBackPress() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 3 on Back Press`)
  }

  onPageHide() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Loading onPageHide');
    clearInterval(this.timer)
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 5 about To Disappear`)
  }

  runTimer(){
    this.timer = setInterval(()=>{
      this.selectColor = this.colorList[getRandomInt(0,4)]
    },2000)
  }



  build() {
    Column() {

      Blank()
      Column() {
        LoadingProgress()
          .width(this.widthValue)
          .height(this.heightValue)
          .color(this.selectColor)
      }
      Blank()

    }
    .height('100%')
    .width('100%')
    .backgroundColor("#999")
    .opacity(0.5)
    .visibility(this.loading ? Visibility.Visible:Visibility.None)
  }
}

export {
  Loading
}