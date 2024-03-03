import hilog from '@ohos.hilog'
import { HeaderBackRouter } from '../../Components/HeaderBackRouter'
import { TextList } from './components/TextList'


@Entry
@Component
struct PageLifeCycle {
  @State message: string = 'Page Life Cycle'

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 1 about To Appear`)
  }

  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 2 on Page Show`)
  }

  onBackPress() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 3 on Back Press`)
  }

  onPageHide() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 4 on Page Hide`)
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', '%{private}s', `${this.message} ----- 5 about To Disappear`)
  }

  build() {
    Column() {
      Row() {
        HeaderBackRouter({ title: this.message })
      }

      TextList()

    }
    .width('100%')
    .height('100%')
  }
}