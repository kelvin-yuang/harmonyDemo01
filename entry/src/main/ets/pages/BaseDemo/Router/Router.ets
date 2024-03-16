import router from '@ohos.router';


class RouterInfo {
  url: string
  title: string

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title
  }
}

@Entry
@Component
export struct Router {
  @State message: string = 'Router List'
  private routers: RouterInfo[] = [
    new RouterInfo("pages/BaseDemo/TaskManager/TaskManager", "TaskManager"),
    new RouterInfo("pages/BaseDemo/ImagesView/ImagesView", "ImagesView"),
    new RouterInfo("pages/BaseDemo/Animations/Animations", "Animations"),
    new RouterInfo("pages/BaseDemo/Controller/Controller", "Controller"),
    new RouterInfo("pages/BaseDemo/PageLifeCycle/PageLifeCycle", "PageLifeCycle"),
    new RouterInfo("pages/BaseDemo/NewAbility/NewAbility", "NewAbility"),
    new RouterInfo("pages/BaseDemo/LoginAD/LoginAD", "LoginAD"),
    new RouterInfo("pages/BaseDemo/RaspberryPi/PiController", "PiController")
  ]


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
          .fontColor("#36d")
          .height(80)

        List({ space: 15 }) {
          ForEach(this.routers, (router, index) => {
            ListItem() {
              this.RouterItem(router, index + 1)
            }
          })
        }
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Center)
        .width('100%')

      }
      .width('100%')
      .borderRadius(5)

    }
  }

  @Builder
  RouterItem(r: RouterInfo, i: number) {
    Row() {
      Text(i + '.').fontSize(20).fontColor(Color.White)
      Blank()
      Text(r.title).fontSize(20).fontColor(Color.White)

    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(15)
    .shadow({ radius: 6, color: '#4F000000', offsetX: 2, offsetY: 2 })
    .onClick(() => {
      router.pushUrl(
        {
          url: r.url,
          params: { id: i, title: r.title }
        },
        router.RouterMode.Single,
        (err) => {
          if (err) {
            console.log("router fails", r.url, err.code, err.message)
          }
        }
      )
    })

  }
}
