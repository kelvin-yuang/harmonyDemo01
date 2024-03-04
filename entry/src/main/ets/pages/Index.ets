import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import { Router } from './BaseDemo/Router/Router'
import {toChangeScreenVertical} from './Utils/Utils'


@Entry
@Component
struct Index {
  @State message: string = 'Index Page'

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Index 1 aboutToAppear');
  }

  private context = getContext(this) as common.UIAbilityContext;
  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Index 2 onPageShow');
    toChangeScreenVertical(this.context)
  }

  onBackPress() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Index 3 onBackPress');
  }

  onPageHide() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Index 4 onPageHide');
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', '%{private}s', '--------Index 5 aboutToDisappear');
  }

  build() {
    Row() {
      Router()
    }
    .height('100%')
  }
}