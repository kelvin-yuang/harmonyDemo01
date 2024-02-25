class Item {
  name: String
  image: ResourceStr
  priceSource: number
  priceNow: number
  discount?: number

  constructor(name: String, image: ResourceStr, priceSource: number, priceNow: number, discount: number) {
    this.name = name
    this.image = image
    this.priceSource = priceSource
    this.priceNow = priceNow
    this.discount = discount
  }
}

@Extend(Text) function ItemName(){
  .fontSize(18)
  .fontWeight(FontWeight.Bold)
}


@Builder function ProductItem (item:Item){
  Row({ space: 5 }) {
    Column() {
      Image(item.image)
        .width(80).height(80).interpolation(ImageInterpolation.High)
        .padding(5)
    }

    Column() {
      Text("" + item.name)
        .ItemName()

      if (item.discount > 0) {
        Text("原价：$" + item.priceSource.toFixed(2)).fontColor('#999').fontSize(14).decoration({type:TextDecorationType.LineThrough})
        Text("现价：$" + item.priceNow.toFixed(2)).fontColor("red").fontSize(18)
        Text("折扣：$" + (item.priceSource - item.priceNow).toFixed(2)).fontColor("red").fontSize(14)
      } else {
        Text("现价：$" + item.priceNow.toFixed(2)).fontColor("red").fontSize(18)
      }
    }
    .width('68%')
    .alignItems(HorizontalAlign.Start)
  }
  .alignItems(VerticalAlign.Top)
  .backgroundColor("#fff")
  .borderRadius(5)
  .padding({ top: 5, bottom: 5 })
  .width("100%")
  .shadow({radius:6,color:'#1f000000',offsetX:2, offsetY:2})
}
export {
  ProductItem
}