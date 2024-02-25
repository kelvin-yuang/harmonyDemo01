class Item {
  name: string
  image: ResourceStr
  priceSource: number
  priceNow: number
  discount?: number

  constructor(name: string, image: ResourceStr, priceSource: number, priceNow: number, discount: number) {
    this.name = name
    this.image = image
    this.priceSource = priceSource
    this.priceNow = priceNow
    this.discount = discount
  }
}

import {PageHeader} from './components/PageHeader'
import {ProductItem} from './components/ProductItem'


@Styles function PageStyles(){
  .height("100%")
  .backgroundColor("#eee")
  .padding({ top: 10, left: 15, right: 15, bottom: 10 })
}

@Entry
@Component
struct ProductList {
  @State message: string = 'Hello World'

  // production Data
  private items: Array<Item> = [
    new Item("Product01", $r("app.media.icon"), 1001.00, 901.00, 100),
    new Item("Product02", $r("app.media.icon"), 1002.00, 902.00, 0),
    new Item("Product03", $r("app.media.icon"), 1003.00, 903.00, 100),
    new Item("Product04", $r("app.media.icon"), 1004.00, 904.00, 0),
    new Item("Product05", $r("app.media.icon"), 1005.00, 904.00, 100),
  ]

  build() {
    Column() {
      PageHeader({title:'Product list'})

      List({ space: 5 }) {
        ForEach(
          this.items,
          (item: Item) => {
            ListItem() {
              ProductItem(item)
            }
          })
      }
      .width("100%")
      .listDirection(Axis.Vertical)
      .layoutWeight(1)

    }.PageStyles()

  }
}