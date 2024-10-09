interface SheBeiList{
  name:string
  img:Resource
  state:string
}

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0
  sheBeiList:SheBeiList[]=[
    {name:'老登乐小车',state:'已连接',img:$rawfile('laoDengLeCar.svg')}
  ]
  build() {
    //根组件
    Column() {

      //index核心tabs组件
      Tabs() {

        //首页
        TabContent() {
          ShouYeBuilder()
        }
        .tabBar(this.tabBarBuilder($rawfile('Firstpage.svg'), '首页', 0))

        //我的
        TabContent() {

        }
        .tabBar(this.tabBarBuilder($rawfile('my.svg'), '我的', 1))

      }
      .onChange((index:number)=>{this.currentTabIndex=index})
      .barPosition(BarPosition.End)
      .fullSize()

    }
    .fullSize()
    .linearGradient({
      direction:GradientDirection.LeftBottom,
      colors:[['#ff720491',0],['#ff9608b3',0.3],['#ff0902ba',1]]
    })
    .expandSafeArea()
  }

  @Builder
  tabBarBuilder(img: Resource, text: string, index: number) {
    Column({ space: 2 }) {
      Image(img)
        .height(32)
        .fillColor(this.currentTabIndex==index?Color.White:Color.Black)
      Text(text)
        .fontSize(16)
        .fontColor(Color.White)
    }
    .width('100%')
    .border({ width: { bottom: this.currentTabIndex == index ? 3 : 0 }, color: { bottom: Color.White } })
  }
}


@Builder
function ShouYeBuilder() {
  Column() {
    Column(){
      Row(){
        Image($rawfile('add.svg'))
          .width(30)
      }
      .padding({right:5})
      .justifyContent(FlexAlign.End)
      .width('100%')
      Column({space:10}){
        Text('一方.ets的家')
          .fontSize(30)
          .fontWeight(600)
          .fontColor(Color.White)
        Text('1个设备')
          .fontColor(Color.White)
      }
      .padding({left:20})
      .alignItems(HorizontalAlign.Start)
      .width('100%')
    }
    .width('100%')
    .padding(5)
    // .backgroundColor(Color.White)
    .height('30%')
  }
  .fullSize()
}

@Styles
function fullSize() {
  .height('100%')
  .width('100%')
}
