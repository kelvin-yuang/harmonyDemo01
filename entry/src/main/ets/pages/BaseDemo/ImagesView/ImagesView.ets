import router from '@ohos.router'
import { HeaderBackRouter } from '../../Components/HeaderBackRouter'

import { SizeChagne } from './components/SizeChange'
import { Carousel } from './components/Carousel'


@Entry
@Component
struct ImagesView {
  @State params?: any = router?.getParams()

  build() {
    Column() {
      Row() {
        HeaderBackRouter({ title: this.params?.title || "" })
      }

      Row() {
        SizeChagne()
      }

      Row() {
        Carousel()
      }

    }
  }
}