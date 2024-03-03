import { Router } from './BaseDemo/Router/Router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Router()
    }
    .height('100%')
  }
}