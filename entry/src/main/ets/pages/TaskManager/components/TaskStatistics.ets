@Styles function card() {
  .width("100%")
  .padding({ left: 10, right: 10, top: 15, bottom: 15 })
  .borderRadius(15)
  .backgroundColor("#fff")
  .shadow({ radius: 6, color: '#1f000000', offsetX: 2, offsetY: 2 })
}

@Component
struct TaskStatistics {
  @Prop taskDone: number
  @Prop taskTotal: number

  build() {
    Row() {
      Text("Task Progress").fontWeight(FontWeight.Bold).fontSize(24)
      Stack() {
        Progress({
          value: this.taskDone,
          total: this.taskTotal,
          type: ProgressType.Ring
        }).width(120)

        Row() {
          Text(this.taskDone.toString()).fontColor("#36D").fontSize(20)
          Text(" / ").fontColor("#36D").fontSize(20)
          Text(this.taskTotal.toString()).fontColor("#36D").fontSize(20)
        }
      }
    }
    .card()
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
export {
  TaskStatistics
}