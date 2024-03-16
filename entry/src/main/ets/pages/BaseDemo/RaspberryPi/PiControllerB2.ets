// @ts-nocheck
import { TouchEvent } from '@ohos.multimodalInput.touchEvent'
import curves from '@ohos.curves'
import common from '@ohos.app.ability.common';
import {toChangeScreenLandscape} from '../../Utils/Utils';
import { moveAPI } from './api/moveDriver'
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct Controller {
  fishX: number = 0
  fishY: number = 30
  @State colorValue:number = 100
  @State angle: number = 0
  @State src: Resource = $rawfile("GIF/B001B.gif")
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

  controller: web_webview.WebviewController = new web_webview.WebviewController();

  private context = getContext(this) as common.UIAbilityContext;
  aboutToAppear() {
    toChangeScreenLandscape(this.context)
  }

  build() {
    Column() {
      Column() {
        Row(){
          Image($r('app.media.turnLeft'))
            .width(60).height(60)
            .position({x:this.centerX-90,y:this.centerY-190})
          Image($r('app.media.turnRight'))
            .width(60).height(60)
            .position({x:this.centerX+20,y:this.centerY-190})
        }
        // 外圆
        Row(){
          Circle({ width: this.maxRadius * 2, height: this.maxRadius * 2 })
            .fill('#555')
            .position({ x: this.centerX - this.maxRadius, y: this.centerY - this.maxRadius })
          // 内圆
          Circle({ width: this.radius * 2, height: this.radius * 2 })
            .fill('#FFFFFF')
            .position({ x: this.positionX - this.radius, y: this.positionY - this.radius })
        }
      }
      .width(240)
      .height("100%")
      .justifyContent(FlexAlign.Center)
      .position({ x: 0, y: 120 })
      .onTouch(this.handleTouchEvent.bind(this))

      Column(){
        Row(){
          Web({
            src:$rawfile("WEB/Camera.html"),
            controller: this.controller
          }).width(320).height(240)
        }.margin({top:35,bottom:20})

        Row(){
            Slider({
              min: 100,
              max: 300,
              value: this.colorValue,
              step: 10,
              style: SliderStyle.InSet,
              direction: Axis.Horizontal
            })
            .width('98%')
            .blockColor('#36D')
            .trackThickness(20)
            .showTips(true)
            .onChange((value) => {
              this.colorValue = value
            })
        }
      }.width("33%")

      Column(){

      }.width("30%")

    }
    .width("100%")
    .height("100%")
    .backgroundColor("#999")
  }

  handleTouchEvent(event: TouchEvent) {
    // console.log("handleTouchEvent----", JSON.stringify(event.touches[0]))
    switch (event.type) {
      /* 手指抬起 */
      case TouchType.Up:
        animateTo(
          { curve: curves.springMotion() },
          () => {
            this.positionX = this.centerX
            this.positionY = this.centerY
          }
        )
        /* 关闭角色 移动 */
        this.stopMoveMent()

        break

      /* 手指按下 */
      case TouchType.Down:
      /* 7 开始定时任务 */

        break

      /* 手指移动 */
      case TouchType.Move:
      /* 1 获取手指的位置 */
        // console.log("Touch",JSON.stringify(event.touches))
        let x: number = event.touches[0]?.x
        let y: number = event.touches[0]?.y
      /* 2 计算手指于中心点的 坐标差值*/
        let vx = x - this.centerX
        let vy = y - this.centerY

      /* 3 计算手指于中心点的 x轴 正半轴 的夹角 */
        let angle = Math.atan2(vy, vx)
        this.startMoveMent(vx,vy)

      /* 4 计算手指于中心点的距离 */
        let distance = this.getDistance(vx, vy)
        // console.log("distance-",distance)

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
    let d = Math.sqrt(x * x + y * y)
    return Math.min(d, this.maxRadius)
  }
  startMoveMent(vx,vy){
    let y = -vy
    let angle = Math.atan2(vy, vx)
    let degree = 0;
    if(-(angle  / (Math.PI/180))>0){
      degree = -(angle / (Math.PI/180))
    }else{
      degree = 180 + 180-(angle / (Math.PI/180))
    }
    moveAPI.movement({
      method:"SetMovementAngle",
      params:{"angle":degree}
    })
  }

  stopMoveMent(){
    moveAPI.movement({
      method:"SetMovementAngle",
      params:{"angle":-1}
    })
  }
}