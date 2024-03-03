import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
import hilog from '@ohos.hilog'

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

          /* 3 关闭当前 ability */
          this.context.terminateSelf((err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `-------- Ability terminateSelf Err:${JSON.stringify(err)}`);
          })
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
      Image($r('app.media.refresh')).width(30)
    }
    .width('98%').height(45)

  }
}

export {
  HeaderBackAbility
}