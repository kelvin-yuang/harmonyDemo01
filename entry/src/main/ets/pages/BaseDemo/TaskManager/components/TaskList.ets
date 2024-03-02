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

@Observed //解决 深层 对象变化 不能触发渲染的问题
class Task {
  static id: number = 1
  taskName: any = `Task ${Task.id++}`
  status: boolean = false
}

@Component
struct TaskList {
  @Link
  taskDone: number
  @Link
  taskTotal: number
  @State
  taskArr: Task[] = []

  handleCheckBoxChange() {
    this.taskDone = this.taskArr.filter((item) => item.status === true).length
  }

  build() {
    Column() {
      Row() {
        Button("New Task").width(200).margin({ bottom: 10 })
          .onClick(() => {
            this.taskArr.push(new Task())
            this.taskTotal = this.taskArr.length
          })
      }

      List({ space: 5 }) {
        ForEach(this.taskArr, (item: Task) => {
          ListItem() {
            TaskItem({ item: item, taskDone: $taskDone, onTaskChange: this.handleCheckBoxChange.bind(this) })

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

@Component
struct TaskItem {
  @ObjectLink item: Task
  @Link taskDone: number
  // @ObjectLink taskArr: Task[]

  onTaskChange: () => void // 无参函数 无返回值函数

  build() {
    Row() {
      if (this.item.status) {
        Text(this.item.taskName).finishedTask()
      } else {
        Text(this.item.taskName)
      }
      Checkbox({ name: "Done" }).select(this.item.status)
        .onChange(() => {
          this.item.status = !this.item.status
          this.onTaskChange()

        })

    }.card().justifyContent(FlexAlign.SpaceBetween)
  }
}