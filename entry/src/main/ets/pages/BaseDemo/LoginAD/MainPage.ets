// @ts-nocheck
import router from '@ohos.router'
@Entry
@Component
struct MainPage {
  @State params?: any = router?.getParams()

  aboutToAppear() {}

  build() {
    Row() {
      Column() {
        Text(this.params.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}