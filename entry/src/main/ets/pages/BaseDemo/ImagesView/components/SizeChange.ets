@Component
export struct SizeChagne {
  @State imageWidth: number = 150

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)

      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text(`${this.imageWidth}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

      Slider({
        min: 100,
        max: 300,
        value: this.imageWidth,
        step: 10,
        style: SliderStyle.InSet,
        direction: Axis.Horizontal
      })
        .width('98%')
        .selectedColor('red')
        .blockColor('#36D')
        .trackThickness(20)
        .showTips(true)
        .onChange((value) => {
          this.imageWidth = value
        })
    }

  }
}
