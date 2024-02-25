@Styles function card() {
  .width("100%")
  .padding({ left: 10, right: 10, top: 15, bottom: 15 })
  .borderRadius(15)
  .backgroundColor("#fff")
  .shadow({ radius: 6, color: '#1f000000', offsetX: 2, offsetY: 2 })
}

@Extend(Text) function finishedTask() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor("#B1B2B1")
}

class Task {
  static id: number = 1
  taskName: any = `Task ${Task.id++}`
  status: boolean = false
}

@Component
struct TaskList {
  @Link taskDone: number
  @Link taskTotal: number

  @State taskArr: Task[] = []


  build() {
    Column() {
      Row() {
        Button("New Task").width(200).margin({bottom:10})
          .onClick(() => {
            this.taskArr.push(new Task())
            this.taskTotal = this.taskArr.length
          })
      }

      List({ space: 5 }) {
        ForEach(this.taskArr, (item: Task) => {
          ListItem() {
            Row() {
              Text(item.taskName)
              Checkbox({ name: "Done" }).select(item.status)
                .onChange(() => {
                  item.status = !item.status
                  this.taskDone = this.taskArr.filter((item) => item.status === true).length
                })

            }.card().justifyContent(FlexAlign.SpaceBetween)
          }.swipeAction({
            end: this.DeleteBTN(item.taskName)
          })

        })
      }
      .width("100%")
      .listDirection(Axis.Vertical)
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }

  }

  // 构建函数
  @Builder DeleteBTN(taskName: string) {
    Button() {
      Image($r("app.media.deleteBTN")).fillColor(Color.White).width(20)
    }
    .width(40)
    .height(40)
    .backgroundColor(Color.Orange)
    .margin({ left: 5 })
    .type(ButtonType.Circle)
    .onClick(() => {
      this.taskArr = this.taskArr.filter((item) => item.taskName !== taskName)
      this.taskTotal = this.taskArr.length
      this.taskDone = this.taskArr.filter(item => item.status === true).length
    })
  }
}

export {
  TaskList
}