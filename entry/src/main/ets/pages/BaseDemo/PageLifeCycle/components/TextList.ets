import hilog from '@ohos.hilog'

class textContent {
  static id: number = 1
  content: string = `Task ${textContent.id++}`
}

@Component
export struct TextList {
  @State message: string = "Page Life Cycle-------TextList"
  @State textArr: textContent[] = []

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 1 about To Appear`)
  }

  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 2 on Page Show`)
  }

  onBackPress() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 3 on Back Press`)
  }

  onPageHide() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 4 on Page Hide`)
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 5 about To Disappear`)
  }

  handleAddText() {
    this.textArr.push(new textContent())
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
              Text(item.content).fontSize(24).fontColor(Color.White)
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