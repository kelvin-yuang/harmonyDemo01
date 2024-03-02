import router from '@ohos.router'
import { Header } from '../../Components/Header'

import { SizeChagne } from './components/SizeChange'
import { Carousel } from './components/Carousel'


@Entry
@Component
struct ImagesView {
  @State params?: any = router?.getParams()

  build() {
    Column() {
      Row() {
        Header({ title: this.params?.title || "" })
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