import { router } from '@kit.ArkUI'
import {DengLu} from '../module/DengLu'

interface SheBeiList {
  name: string
  img: Resource
  state: string
}

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0
  sheBeiList: SheBeiList[] = [
    { name: '老登乐小车', state: '已连接', img: $rawfile('laoDengLeCar.svg') }
  ]
  @State time:number=0

  build() {
    //根组件
    Stack(){

      Column() {

        //index核心tabs组件
        Tabs() {

          //首页
          TabContent() {
            ShouYeBuilder(this.sheBeiList)
          }
          .tabBar(this.tabBarBuilder($rawfile('Firstpage.svg'), '首页', 0))

          //我的
          TabContent() {

          }
          .tabBar(this.tabBarBuilder($rawfile('my.svg'), '我的', 1))

        }
        .onChange((index: number) => {
          this.currentTabIndex = index
        })
        .barPosition(BarPosition.End)
        .fullSize()

      }
      .fullSize()
      .linearGradient({
        direction: GradientDirection.LeftBottom,
        colors: [['#ff720491', 0], ['#ff9608b3', 0.3], ['#ff0902ba', 1]]
      })
      .expandSafeArea()

      DengLu()


    }
    .fullSize()
    .expandSafeArea()


  }

  @Builder
  tabBarBuilder(img: Resource, text: string, index: number) {
    Column({ space: 2 }) {
      Image(img)
        .height(32)
        .fillColor(this.currentTabIndex == index ? Color.White : Color.Black)
      Text(text)
        .fontSize(16)
        .fontColor(Color.White)
    }
    .width('100%')
    .border({ width: { bottom: this.currentTabIndex == index ? 3 : 0 }, color: { bottom: Color.White } })
  }
}


@Builder
function ShouYeBuilder(list: SheBeiList[]) {
  Column() {
    //顶部
    ShouYeDingBuBuilder()
    Row({space:15}){
      Text('设备')
        .fontSize(25)
        .fontColor(Color.White)
      Text('空间')
        .fontSize(25)
        .fontColor(Color.White)
      Text('自定义分组')
        .fontSize(25)
        .fontColor(Color.White)
    }
    .padding({left:15,bottom:5})
    .width('100%')
    List({space:10}){
      ForEach(list,(item:SheBeiList,i)=>{
        SheBeiBuilder(item)
      })
    }
    .padding(10)
    .lanes(2)
    .layoutWeight(1)
    .width('100%')
  }
  .fullSize()
}

@Builder
function ShouYeDingBuBuilder() {
  //顶部
  Column({space:30}) {
    Row() {
      Image($rawfile('add.svg'))
        .width(30);
    }
    .padding({ right: 5 })
    .justifyContent(FlexAlign.End)
    .width('100%');

    Column({ space: 10 }) {
      Text('一方.ets的家')
        .fontSize(30)
        .fontWeight(600)
        .fontColor(Color.White);
      Text('1个设备')
        .fontColor(Color.White);
    }
    .padding({ left: 20 })
    .alignItems(HorizontalAlign.Start)
    .width('100%');
  }
  .width('100%')
  .padding(5)
  // .backgroundColor(Color.White)
  .height('30%')
}

@Builder
function SheBeiBuilder(sheBei:SheBeiList) {
  ListItem() {
    Column({space:5}){
      Text(sheBei.name)
        .fontColor(Color.White)
        .fontSize(20)
        .fontWeight(500)
      Text(sheBei.state)
        .fontColor(Color.White)
        .fontSize(14)
      Blank()
      Image(sheBei.img)
        .width(60)
    }
    .alignItems(HorizontalAlign.Start)
    .fullSize()
    .onClick(()=>{
      router.pushUrl({url:"pages/XiaoCheXiangQing"})
    })
  }
  .padding(10)
  .borderRadius(10)
  .height(130)
  .backgroundColor('#6fcccccc')
  .width('100%')
}

@Styles
function fullSize() {
  .height('100%')
  .width('100%')
}
