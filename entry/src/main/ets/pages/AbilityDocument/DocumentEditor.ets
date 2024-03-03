import { HeaderBackAbility } from '../Components/HeaderBackAbility'
@Entry
@Component
struct DocumentEditor {
  @State message: string = 'Hello Document Editor'

  build() {
      Column() {
        Row(){
          HeaderBackAbility()
        }

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
  }
}