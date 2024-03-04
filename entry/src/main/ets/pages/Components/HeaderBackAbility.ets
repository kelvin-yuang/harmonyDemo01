import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'


@Component
struct HeaderBackAbility {
  private title: ResourceStr
  /* 1 跳转到 一个新的 UIAbility 前准备 */
  private context = getContext(this) as common.UIAbilityContext

  build() {

    Row({ space: 5 }) {
      Image($r('app.media.returnBack'))
        .width(30).fillColor("#36D")
        .onClick(() => {
          /* 1 准备 want 对象 */
          let want: Want = {
            deviceId: "", /* 不填写 表示 当前设备 */
            bundleName: "com.yancy.application",
            moduleName: "entry",
            abilityName: 'EntryAbility',
          }
          /* 2 跳转 UIAbility */
          this.context.startAbility(want)
        })
      Blank()
      if (this.title) {
        Text(this.title).fontSize(20).fontWeight(FontWeight.Bold).fontColor('#36D')
      }
      Blank()
      Image($r('app.media.closeBTN'))
        .width(30)
        .fillColor(Color.Red)
        .colorBlend(Color.Blue)
        .onClick(()=>{
          AlertDialog.show({
            message: "Are you sure want to close ?",
            primaryButton: {
              value: "Yes",
              action: () => {
                /* TODO */
                /* 3 关闭当前 ability */
                this.context.terminateSelf((error) => {
                  if (error.code) {
                    // 处理业务逻辑错误
                    console.log('terminateSelf failed, error.code: ' + JSON.stringify(error.code) +
                    ' error.message: ' + JSON.stringify(error.message));
                    return;
                  }
                  // 执行正常业务
                  console.log('terminateSelf succeed');
                });
              }
            },
            secondaryButton: {
              value: "No",
              action: () => {
              }
            }
          })

        })
    }
    .width('98%').height(45)

  }
}

export {
  HeaderBackAbility
}