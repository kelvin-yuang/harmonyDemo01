@Component
struct PageHeader{
  private title:ResourceStr

  build(){
    // 页标题
    Row() {
      Image($r('app.media.returnBack')).width(26).fillColor("#36D")
      Text(this.title)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({left:2})
      Blank()
      Image($r('app.media.refresh')).height(20).fillColor("#36D").onClick((e)=>{
        console.log("refresh...", JSON.stringify(e))
      })
    }
    .width("100%")
    .padding({left:2,right:2})
    .margin({ bottom: 5 })
  }
}
export {
  PageHeader
}