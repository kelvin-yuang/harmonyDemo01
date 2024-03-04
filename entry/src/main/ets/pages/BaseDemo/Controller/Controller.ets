// @ts-nocheck
import { TouchEvent } from '@ohos.multimodalInput.touchEvent'
import curves from '@ohos.curves'
import common from '@ohos.app.ability.common';
import {toChangeScreenLandscape} from '../../Utils/Utils';

@Entry
@Component
struct Controller {
  @State fishX: number = 100
  @State fishY: number = 120
  @State angle: number = 0
  @State src: Resource = $rawfile("GIF/B001.gif")
  @State maxRadius: number = 100
  @State radius: number = 20
  @State centerX: number = 120
  @State centerY: number = 120
  @State positionX: number = this.centerX
  @State positionY: number = this.centerY
  sin: number = 0
  cos: number = 0
  speed: number = 0
  taskId: number = -1

  private context = getContext(this) as common.UIAbilityContext;
  aboutToAppear() {
    toChangeScreenLandscape(this.context)
  }

  build() {
    Column() {
      Stack() {
        Image(this.src)
          .width(60)
          .position({ x: this.fishX, y: this.fishY })
          .rotate({ angle: this.angle, centerX: '50%', centerY: '50%' })
      }

      Row() {
        Circle({ width: this.maxRadius * 2, height: this.maxRadius * 2 })
          .fill('#20101010')
          .position({ x: this.centerX - this.maxRadius, y: this.centerY - this.maxRadius })

        Circle({ width: this.radius * 2, height: this.radius * 2 })
          .fill('#403A3A3A')
          .position({ x: this.positionX - this.radius, y: this.positionY - this.radius })
      }
      .width(240)
      .height(240)
      .justifyContent(FlexAlign.Center)
      .position({ x: 0, y: 120 })
      .onTouch(this.handleTouchEvent.bind(this))

    }.width("100%").height("100%").backgroundColor("#f4f4fa")
  }

  handleTouchEvent(event: TouchEvent) {
    // console.log("handleTouchEvent----", JSON.stringify(event.touches[0]))

    switch (event.type) {
      case TouchType.Up:
      /* 关闭角色 移动 */
        this.speed = 0
        clearInterval(this.taskId)

        animateTo(
          { curve: curves.springMotion() },
          () => {
            this.positionX = this.centerX
            this.positionY = this.centerY
          }
        )
        break
      case TouchType.Down:
      /* 7 开始定时任务 */
        this.taskId = setInterval(() => {
          this.fishX += this.speed * this.cos
          this.fishY += this.speed * this.sin
        }, 40)
        break
      case TouchType.Move:
      /* 1 获取手指的位置 */
        let x: number = event.touches[0]?.x
        let y: number = event.touches[0]?.y
        console.log("handleTouchEvent----x", x)
        console.log("handleTouchEvent----y", y)
      /* 2 计算手指于中心点的 坐标差值*/
        let vx = x - this.centerX
        let vy = y - this.centerY
      /* 3 计算手指于中心点的 x轴 正半轴 的夹角 */
        let angle = Math.atan2(vy, vx)
      /* 4 计算手指于中心点的距离 */
        let distance = this.getDistance(vx, vy)

      /* 5 计算摇杆 小球的 坐标 */
        this.cos = Math.cos(angle)
        this.sin = Math.sin(angle)

        animateTo(
          { curve: curves.responsiveSpringMotion() },
          () => {
            this.positionX = this.centerX + distance * this.cos
            this.positionY = this.centerY + distance * this.sin

            /* 6 加算 角色 的坐标 */
            this.speed = 10
            this.angle = angle * 180 / Math.PI + 90


          })
        break
    }


  }

  getDistance(x: number, y: number) {
    /* a平方+ b平方 开平方根 = c 三角函数 计算斜边 */
    let d = Math.sqrt(x * x, y * y)
    return Math.min(d, this.maxRadius)
  }
}