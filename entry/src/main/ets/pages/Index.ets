import { router } from '@kit.ArkUI'
import { DengLu } from '../module/DengLu'
import { text } from '@kit.ArkGraphics2D'

interface SheBeiList {
  name: string
  img: Resource
  state: string
}

interface MyPage_Serves {
  img: Resource
  str: string
}

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0
  sheBeiList: SheBeiList[] = [
    { name: '智能监护小车', state: '已连接', img: $rawfile('laoDengLeCar.svg') },
    { name: '智能监护无人机', state: '充电中', img: $rawfile('WuRenJi.svg') }
  ]
  @State time: number = 5
  @State Id: number = 0

  build() {
    //根组件
    Stack() {

      Column() {

        //index核心tabs组件
        Tabs() {

          //首页
          TabContent() {
            ShouYe_Builder(this.sheBeiList)
          }
          .tabBar(this.tabBarBuilder($rawfile('Firstpage.svg'), '首页', 0))

          //我的
          TabContent() {
            MyPage_Builder()
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

      //开屏加载
      if (this.time != 0) {
        DengLu()
          .onAppear(() => {
            console.log('开屏加载页加载成功，开始倒计时')
            this.Id = setInterval(() => {
              this.time--
              if (this.time == 0) {
                clearInterval(this.Id)
              }
            }, 1000)
          })
          .onDisAppear(() => {
            console.log('开屏加载结束')
          })
          .transition(TransitionEffect.OPACITY.animation({ curve: Curve.Ease }))
      }


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


@Component
struct MyPage_Builder {
  MyPage_Serves: MyPage_Serves[] = [
    { img: $rawfile('ShuoMingShu.svg'), str: '产品百科' },
    { img: $rawfile('SheQuFuWu.svg'), str: '社区服务' },
    { img: $rawfile('HuLi.svg'), str: '医疗护理' },
    { img: $rawfile('DingZhi.svg'), str: '特殊定制' },
  ]
  MyPage_Serves2: MyPage_Serves[] = [
    { img: $rawfile('ErWeiMa.svg'), str: '扫码添加设备' },
    { img: $rawfile('ShangCheng.svg'), str: '商城' },
    { img: $rawfile('WeiXinXiaoXi.svg'), str: '微信消息推送' },
    { img: $rawfile('LunTan.svg'), str: '论坛' },
    { img: $rawfile('ShiYan.svg'), str: '新品实验室' },
    { img: $rawfile('SheBeiXieTong.svg'), str: '多设备协同' },
  ]
  MyPage_Serves3: MyPage_Serves[] = [
    { img: $rawfile('Setting.svg'), str: '设置' },
    { img: $rawfile('ZhangHuSafe.svg'), str: '账户安全' },
    { img: $rawfile('YinSi.svg'), str: '隐私管理' },
    { img: $rawfile('Help.svg'), str: '帮助与反馈' },
  ]

  build() {
    Column({ space: 10 }) {
      Row() {
        Text('我的')
          .fontSize(25)
          .fontColor(Color.White)
        Image($rawfile('message.svg'))
          .height(30)
          .fillColor(Color.White)
      }
      .padding({ left: 1, right: 1 })
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      List({ space: 10 }) {
        //顶部用户头像和昵称卡片
        ListItem() {
          Row({ space: 15 }) {
            Image($rawfile('head.jpg'))
              .borderRadius(1000)
              .height(60)
            Text('一方通行')
              .fontColor(Color.White)
              .fontSize(20)
          }
          .width('100%')
        }
        .padding(20)
        .borderRadius(15)
        .backgroundColor('#c6585858')
        .width('100%')

        //我的页四项快捷服务
        ListItem() {
          Row() {
            ForEach(this.MyPage_Serves, (item: MyPage_Serves, i) => {
              Column({ space: 15 }) {
                Image(item.img)
                  .width(30)
                Text(item.str)
                  .fontSize(16)
                  .fontColor(Color.White)
              }
            })
          }
          .borderRadius(15)
          .justifyContent(FlexAlign.SpaceBetween)
          .backgroundColor('#c6585858')
          .padding(15)
          .width('100%')
        }

        //详细功能区
        ListItem() {
          Column({ space: 20 }) {
            ForEach(this.MyPage_Serves2, (item: MyPage_Serves, i) => {
              Row({ space: 20 }) {
                Image(item.img)
                  .width(25)
                  .fillColor('#ffe1dede')
                Text(item.str)
                  .fontSize(20)
                  .fontColor(Color.White)
              }
              .margin({ top: i == 0 ? 5 : 0, bottom: i == this.MyPage_Serves2.length - 1 ? 5 : 0 })
              .width('100%')

              if (i != this.MyPage_Serves2.length - 1) {
                Divider()
                  .width('100%')
                  .color('#ffc2c2c2')
                  .strokeWidth(1.5)
              }

            })
          }
          .borderRadius(15)
          .backgroundColor('#c6585858')
          .padding(15)
          .width('100%')
        }

        //设置区
        ListItem() {
          Column({ space: 20 }) {
            ForEach(this.MyPage_Serves3, (item: MyPage_Serves, i) => {
              Row({ space: 20 }) {
                Image(item.img)
                  .width(25)
                  .fillColor('#ffe1dede')
                Text(item.str)
                  .fontSize(20)
                  .fontColor(Color.White)
              }
              .margin({ top: i == 0 ? 5 : 0, bottom: i == this.MyPage_Serves3.length - 1 ? 5 : 0 })
              .width('100%')

              if (i != this.MyPage_Serves3.length - 1) {
                Divider()
                  .width('100%')
                  .color('#ffc2c2c2')
                  .strokeWidth(1.5)
              }
            })
          }
          .borderRadius(15)
          .backgroundColor('#c6585858')
          .padding(15)
          .width('100%')
        }

      }
      .scrollBar(BarState.Off)
      .width('100%')
      .layoutWeight(1)

    }
    .padding(10)
    .fullSize()
  }
}

@Builder
function ShouYe_Builder(list: SheBeiList[]) {
  Column() {
    //顶部
    ShouYe_DingBu_Builder()
    ShouYe_XiaBu_Builder(list)
  }
  .fullSize()
}

@Builder
function ShouYe_XiaBu_Builder(list: SheBeiList[]) {
  Row({ space: 15 }) {
    Text('设备')
      .fontSize(25)
      .fontColor(Color.White);
    Text('空间')
      .fontSize(25)
      .fontColor(Color.White);
    Text('自定义分组')
      .fontSize(25)
      .fontColor(Color.White);
  }
  .padding({ left: 15, bottom: 5 })
  .width('100%')

  List() {
    ForEach(list, (item: SheBeiList, i) => {
      ShouYe_SheBei_Builder(item);
    });
  }
  .padding(10)
  .lanes(2)
  .layoutWeight(1)
  .width('100%')
}

@Builder
function ShouYe_DingBu_Builder() {
  //顶部
  Column({ space: 30 }) {
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
function ShouYe_SheBei_Builder(sheBei: SheBeiList) {
  ListItem() {
    Column({ space: 5 }) {
      Text(sheBei.name)
        .fontColor(Color.White)
        .fontSize(20)
        .fontWeight(500)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.Ellipsis})
      Text(sheBei.state)
        .fontColor(Color.White)
        .fontSize(14)
      Blank()
      Image(sheBei.img)
        .width(60)
    }
    .alignItems(HorizontalAlign.Start)
    .fullSize()
    .onClick(() => {
      router.pushUrl({ url: "pages/XiaoCheXiangQing" })
    })
    .margin({right:10})
  }
  .padding(10)
  .borderRadius(10)
  .height(130)
  .backgroundColor('#6fcccccc')
  .width('90%')
}

@Styles
function fullSize() {
  .height('100%')
  .width('100%')
}
