import { HeaderBackRouter } from '../../Components/HeaderBackRouter'
import { TextList } from './components/TextList'

@Entry
@Component
struct NewAbility {
  @State title: string = 'New Ability'

  build() {
    Column() {
      Row() {
        HeaderBackRouter({ title: this.title })
      }

      Divider()

      Row() {
        TextList()
      }

    }
    .width('100%')
  }
}