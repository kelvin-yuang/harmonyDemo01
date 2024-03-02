@Component
export struct Carousel {


  // for swiper
  @State selectTab: number = 1
  private swiperController: SwiperController = new SwiperController()
  private listValue: string[] = [
    'https://slk368-go.oss-cn-shenzhen.aliyuncs.com/static/upload/20210821/202108211045203025.jpg',
    'https://slk368-go.oss-cn-shenzhen.aliyuncs.com/static/upload/20210821/2021082110472610225.jpg',
    'https://slk368-go.oss-cn-shenzhen.aliyuncs.com/static/upload/20210821/202108211428269059.jpg',
    'https://slk368-go.oss-cn-shenzhen.aliyuncs.com/static/upload/20210821/202108211431506651.jpg',
  ]

  // autoPlay 自动播放
  @State autoPlay: boolean = true

  // interval 自动播放时播放的时间间隔
  @State interval: number = 5000

  // indicator 是否启用导航点指示器
  @State indicator: boolean = true

  // loop 是否开启循环
  @State loop: boolean = true

  // vertical 是否纵向滑动
  @State vertical: boolean = false

  // itemSpace 子元素间距
  @State itemSpace: number = 0

  // disableSwipe 组件滑动切换功能
  @State disableSwipe: boolean = false

  build() {
    Row() {
      Stack() {
        Row() {
          Swiper(this.swiperController) {
            ForEach(this.listValue, (value: string) => {
              Row() {
                Image(value)
                  .width('100%')
                  .borderRadius(5)
                  .objectFit(ImageFit.Fill)

              }
              .justifyContent(FlexAlign.Center)
              .backgroundColor($r('app.color.background_white'))
              .padding(4)
            })
          }
          .autoPlay(this.autoPlay)
          .interval(this.interval)
          .indicator(this.indicator)
          .loop(this.loop)
          .vertical(this.vertical)
          .itemSpace(this.itemSpace)
          .disableSwipe(this.disableSwipe)
          .width("100%")
          .height(250)
        }

        Row({ space: 20 }) {
          Image($r('app.media.previous'))
            .width(30)
            .interpolation(ImageInterpolation.High)
            .fillColor(Color.Green)
            .onClick(() => {
              this.swiperController.showPrevious()
            })
          Blank()
          Image($r('app.media.next'))
            .width(30)
            .interpolation(ImageInterpolation.High)
            .fillColor(Color.Green)
            .onClick(() => {
              this.swiperController.showNext()
            })
        }.width('100%')

      }

    }
  }
}