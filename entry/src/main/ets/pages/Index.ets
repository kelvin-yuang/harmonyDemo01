@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor("#36d")

          .onClick((e)=>{
            console.log("onCLick",e)
            this.message = "This is Demo01"

          })

      }
      .width('50%')
      .borderRadius(5)


      Column()
      {
        Image($r('app.media.icon'))
          .width(200)
          .borderRadius(200)
          .interpolation(ImageInterpolation.High) //专用 插值 优化 分辨率


      }.width('50%')
    }
    .height('100%')
  }
}