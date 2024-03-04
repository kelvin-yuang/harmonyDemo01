import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

class textContent {
  static id: number = 1
  content: string = `New Ability ${textContent.id++}`
}

@Component
export struct TextList {
  @State message: string = "New ability TextList"
  @State textArr: textContent[] = []
  @State index: number = 0
  /* 1 跳转到 一个新的 UIAbility 前准备 */
  private context = getContext(this) as common.UIAbilityContext

  handleAddText() {
    this.textArr.push(new textContent())
    /* 2 跳转到 一个新的 UIAbility */

    /* 3 准备 want 对象 */
    let want: Want = {
      deviceId: "", /* 不填写 表示 当前设备 */
      bundleName: "com.yancy.application",
      moduleName: "entry",
      abilityName: 'AbilityDocument',
      parameters: {
        instanceKey: `idx_${this.index++}`
      }
    }
    /* 4 跳转 UIAbility */
    this.context.startAbility(want)
  }

  build() {
    Column() {
      Row() {
        Button("Add Text").width(200).margin({ top: 20, bottom: 20 })
          .onClick(() => {
            this.handleAddText()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      List({ space: 5 }) {
        ForEach(this.textArr, (item: textContent, index) => {
          ListItem() {
            Row() {
              Text(item.content)
                .fontSize(24).fontColor(Color.White)
                .onClick(() => {
                  /* 1 准备 want 对象 */
                  let want: Want = {
                    deviceId: "", /* 不填写 表示 当前设备 */
                    bundleName: "com.yancy.application",
                    moduleName: "entry",
                    abilityName: 'AbilityDocument',
                    parameters: {
                      instanceKey: `idx_${index}`
                    }
                  }
                  /* 2 跳转 UIAbility */
                  this.context.startAbility(want)
                })

              Column() {
                Image($r('app.media.deleteBTN'))
                  .width(20)
                  .fillColor(Color.White)
                  .onClick(() => {
                    AlertDialog.show({
                      message: "Are you sure want to delete ?",
                      primaryButton: {
                        value: "Yes",
                        action: () => {
                          /* TODO */
                          this.textArr.splice(index, 1)
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
              .width(35)
              .height(35)
              .borderRadius(35)
              .backgroundColor(Color.Orange)
              .justifyContent(FlexAlign.Center)

            }
            .width("98%")
            .height(50)
            .padding({ left: 10, right: 10 })
            .backgroundColor($r('app.color.list_item2'))
            .borderRadius(15)
            .justifyContent(FlexAlign.SpaceBetween)
          }
        })
      }
      .width("100%")
      .listDirection(Axis.Vertical)
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
  }
}