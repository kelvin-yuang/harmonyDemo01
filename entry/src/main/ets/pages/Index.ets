import { Router } from './BaseDemo/Router/Router'

@Entry
@Component
struct Index {
  @State message: string = 'Index Page'

  aboutToAppear() {
    console.log(this.message, "----1 aboutToAppear")
  }

  onPageShow() {
    console.log(this.message, "----2 onPageShow")
  }

  onBackPress() {
    console.log(this.message, "----3 onBackPress")
  }

  onPageHide() {
    console.log(this.message, "----4 onPageHide")
  }

  aboutToDisappear() {
    console.log(this.message, "----5 aboutToDisappear")
  }

  build() {
    Row() {
      Router()
    }
    .height('100%')
  }
}