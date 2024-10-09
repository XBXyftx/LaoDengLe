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
        .tabBar(this.tabBarBuilder($rawfile('Firstpage.svg'), '首页', 0))

        //我的
        TabContent() {

        }
        .tabBar(this.tabBarBuilder($rawfile('my.svg'), '我的', 1))

      }
      .barPosition(BarPosition.End)
      .fullSize()

    }
    .fullSize()
  }

  @Builder
  tabBarBuilder(img: Resource, text: string, index: number) {
    Column({ space: 2 }) {
      Image(img)
        .height(32)
      Text(text)
        .fontSize(16)
    }
    .width('100%')
    .border({ width: { bottom: this.currentTabIndex == index ? 2 : 0 }, color: { bottom: Color.Blue } })
  }
}


@Styles
function fullSize() {
  //根组件
  .height('100%')
  .width('100%')
}
