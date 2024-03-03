import router from '@ohos.router';

import { calculateAngle } from '../../Utils/Utils'

@Entry
@Component
struct Animations {
  @State status: boolean = false
  @State src: Resource = $rawfile('GIF/B001.gif')
  @State fishX: number = 320
  @State fishY: number = 700
  @State angle: number = 0
  @State fishX2: number = 320
  @State fishY2: number = 700
  @State angle2: number = 0
  private timer: any
  @State operatorComponentStatus: boolean = false
  @State timerCounter: number = 0

  sleep(delay) {
    for (var t = Date.now(); Date.now() - t <= delay; ) ;
  }

  getRandomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  changePosition(type: string, tempX: number, tempY: number) {
    if (type === "A") {
      animateTo(
        { duration: 2000 },
        () => {
          if (tempX < 320 && tempX > 0) {
            this.fishX = tempX
          }
          if (tempY < 700 && tempY > 0) {
            this.fishY = tempY
          }
        }
      )
    }
    if (type === "B") {
      animateTo(
        { duration: 2200 },
        () => {
          if (tempX < 320 && tempX > 0) {
            this.fishX2 = tempX
          }
          if (tempY < 700 && tempY > 0) {
            this.fishY2 = tempY
          }
        }
      )
    }

  }

  build() {
    Column() {
      Row() {
        Button('Return')
          .width(100)
          .backgroundColor("#36D")
          .type(ButtonType.Normal)
          .borderRadius(15)
          .opacity(0.8)
          .zIndex(999)
          .onClick(() => {
            router.back()
          })
      }
      .width("100%")
      .height(30)

      .margin({ top: 5, left: 5 })
      .justifyContent(FlexAlign.Start)

      Row() {
        if (!this.status) {
          Row() {
            Button("Start")
              .width(150)
              .onClick(() => {
                this.status = true

                this.timer = setInterval(() => {
                  this.timerCounter += 1
                  let tempX = this.getRandomInt(-180, 180)
                  let tempY = this.getRandomInt(-180, 180)
                  let tempAngle = calculateAngle({ x: this.fishX, y: this.fishY }, { x: tempX, y: tempY }) + 90

                  let tempX2 = this.getRandomInt(180, -180)
                  let tempY2 = this.getRandomInt(180, -180)
                  let tempAngle2 = calculateAngle({ x: this.fishX2, y: this.fishY2 }, { x: tempX2, y: tempY2 }) + 90

                  animateTo(
                    { duration: 200 },
                    () => {
                      this.angle = tempAngle
                    }
                  )
                  animateTo(
                    { duration: 200 },
                    () => {
                      this.angle2 = tempAngle2
                    }
                  )

                  this.sleep(500)
                  this.changePosition('A', tempX, tempY)
                  this.changePosition('B', tempX2, tempY2)

                }, 4000)

              })
          }
          .height("100%")
          .alignItems(VerticalAlign.Center)

        } else {

          Stack() {

            Image(this.src)
              .width(60)
              .position({ x: this.fishX, y: this.fishY })
              .rotate({ angle: this.angle, centerX: '50%', centerY: '50%' })

            Image($rawfile("GIF/B001.gif"))
              .width(160)
              .position({ x: this.fishX2, y: this.fishY2 })
              .rotate({ angle: this.angle2 })

            Row() {
              Image($rawfile("PNG/lotusPond1.png"))
                .width(200)
                .position({ x: "15%", y: "30%" })
                .rotate({ angle: 45 })
              Image($rawfile("PNG/lotusPond1.png"))
                .width(220)
                .position({ x: "30%", y: "35%" })
                .rotate({ angle: 55 })
              Image($rawfile("PNG/lotusPond1.png"))
                .width(200)
                .position({ x: "5%", y: "40%" })
                .rotate({ angle: 45 })
                .transform({ x: -1 })


              Image($rawfile("PNG/lotusPond1.png"))
                .width(200)
                .rotate({ angle: 45 })
            }
            .width("100%")
            .height("100%")
            .justifyContent(FlexAlign.End)

          }
          .width("100%")
          .height("100%")

        }
      }

      Row() {
        Button('←').backgroundColor("#20101010")
          .onClick(async () => {
            switch (this.angle) {
              case 0:
              case 90:
              case 180:
                this.angle = -90
                console.log("----------1", this.angle)
            }
            this.fishX -= 100
          })

        Column() {
          Button("↑").backgroundColor("#20101010")
            .onClick(async () => {
              switch (this.angle) {
                case 180:
                case -90:
                case 90:
                  this.angle = 0
                  console.log("----------1", this.angle)
              }
              this.fishY -= 100
            })
          Button("↓").backgroundColor("#20101010")
            .onClick(async () => {
              switch (this.angle) {
                case 0:
                case -90:
                case 90:
                  this.angle = 180

              }
              this.fishY += 100
            })
        }

        Button('→').backgroundColor("#20101010")
          .onClick(async () => {
            switch (this.angle) {
              case 0:
              case 180:
              case -90:
                this.angle = 90
                console.log("----------1", this.angle)
            // await this.sleep(1500)
            }
            this.fishX += 20
            // this.fishY -= 20
          })
      }
      .position({ x: "8%", y: "75%" })
      .id("operator")
      .displayPriority(0)
      .visibility(this.operatorComponentStatus ? Visibility.Visible : Visibility.None)

    }
    .width('100%')
    .height('100%')
    .backgroundColor("#f4f4fa")

  }
}