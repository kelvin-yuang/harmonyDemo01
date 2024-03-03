import router from '@ohos.router'

@Component
struct HeaderBackRouter {
  private title: ResourceStr

  build() {

    Row({ space: 5 }) {
      Image($r('app.media.returnBack'))
        .width(30).fillColor("#36D")
        .onClick(() => {
          router.showAlertBeforeBackPage({
            message: 'Are you sure,return back?'
          })
          router.back()
        })
      Blank()
      if (this.title) {
        Text(this.title).fontSize(20).fontWeight(FontWeight.Bold).fontColor('#36D')
      }
      Blank()
      Image($r('app.media.refresh')).width(30)
    }
    .width('98%').height(45)

  }
}

export {
  HeaderBackRouter
}