@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0

  build() {
    //根组件
    Column() {

      //index核心tabs组件
      Tabs() {

        //首页
        TabContent() {

        }
        .tabBar(tabBarBuilder($rawfile('Firstpage.svg'), '首页', 0))

        //我的
        TabContent() {

        }
        .tabBar(tabBarBuilder($rawfile('my.svg'), '我的', 1))

      }
      .barPosition(BarPosition.End)
      .fullSize()

    }
    .fullSize()
  }
}

@Builder
function tabBarBuilder(img: Resource, text: string, index: number) {
  Column({ space: 2 }) {
    Image(img)
      .height(40)
    Text(text)
      .fontSize(16)
      .margin({ bottom: 5 })
  }
  .border({ width: { bottom: 2 }, color: { bottom: Color.Blue } })
}

@Styles
function fullSize() {
  //根组件
  .height('100%')
  .width('100%')
}
