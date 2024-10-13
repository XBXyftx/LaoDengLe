import { router } from '@kit.ArkUI';
interface Buts{
  img:Resource
  text:string
}
interface Urgency {
  text:string
  img:Resource
}

@Entry
@Component
struct XiaoCheXiangQing {
  Buts:Buts[]=[
    {img:$rawfile('cutScreen.svg'),text:'截图'},
    {img:$rawfile('MaiKe.svg'),text:'对讲'},
    {img:$rawfile('LuZhi.svg'),text:'录制'},
    {img:$rawfile('DuoPingXieTong.svg'),text:'多路同屏'},
  ]
  Urgency:Urgency[]=[
    {text:'报警',img:$rawfile('police.svg')},
    {text:'急救',img:$rawfile('JiJiuTu.svg')},
    {text:'消防',img:$rawfile('XiaoFang.svg')},
  ]
  build() {
    //根组件
    Column({space:15}) {

      MonitorBuilder()

      this.ButtonsArea()

      Stack(){
        Row(){

        }
        .border({radius:100,color:Color.Gray,width:14})
        .width(180)
        .height(180)
        Row(){

        }
        .linearGradient({
          direction:GradientDirection.Bottom,
          colors:[['#ffb1b1b1',0],['#fff8f7f7',0.5],['#ffb1b1b1',1],]
        })
        .border({radius:100,color:'#ffbababa',width:2})
        .width(60)
        .height(60)
        .shadow({
          color:Color.Black,
          radius:50
        })
      }
      .backgroundColor(Color.White)
      .width('90%')
      .layoutWeight(1)
      .borderRadius(10)

    }
    .fullSize()
    .linearGradient({
      direction: GradientDirection.LeftBottom,
      colors: [['#ff720491', 0], ['#ff9608b3', 0.3], ['#ff0902ba', 1]]
    })
    .expandSafeArea()
  }

  @Builder
  ButtonsArea() {
    Row() {
      ForEach(this.Buts, (item: Buts, i) => {
        Column() {
          Image(item.img)
            .width(30)
            .fillColor(Color.Black);
          Text(item.text);

        }
        .width(65);
      });
    }
    .padding({
      left: 15,
      right: 15,
      top: 20,
      bottom: 20
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .width('90%')

    Row() {
      ForEach(this.Urgency, (item: Urgency, i) => {
        Row({ space: 10 }) {
          Text(item.text)
            .fontSize(20);
          Image(item.img)
            .width(30)
            .fillColor(Color.Red);
        }
        .border({ width: 3, color: Color.Red })
        .borderRadius(10)
        .padding(8)
        .backgroundColor(Color.White);
      });

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('90%')
  }
}

@Builder
function MonitorBuilder() {
  Stack({ alignContent: Alignment.End }) {
    Column() {
      Image($rawfile('TestPicture.jpg'))
        .height('100%');

    }
    .fullSize()
    .backgroundColor(Color.Black);

    Column({ space: 10 }) {
      Image($rawfile('ic_public_refresh.svg'))
        .SvgStyle();
      Image($rawfile('MaiKe.svg'))
        .SvgStyle();
      Image($rawfile('voice.svg'))
        .SvgStyle();
      Image($rawfile('cutScreen.svg'))
        .SvgStyle();
      Image($rawfile('LuZhi.svg'))
        .SvgStyle();
      Blank();
      Image($rawfile('QuanPing.svg'))
        .SvgStyle();
    }
    .height('100%')
    .margin({ right: 10 })
    .padding({ top: 5, bottom: 5 })

    Row({space:10}){
      Image($rawfile('arrow-left.svg'))
        .SvgStyle()
        .onClick(()=>{
          router.back()
        })
      Text('老登乐小车监控界面')
        .fontSize(16)
        .fontColor(Color.White)
    }
    .position({x:4,y:4})
  }
  .expandSafeArea()
  .height('40%')
}

@Extend(Image)
function SvgStyle() {
  .width(30)
  .backgroundColor(Color.Gray)
  .borderRadius(30)
  .padding(5)
  .fillColor(Color.White)
}

@Styles
function fullSize() {
  .height('100%')
  .width('100%')
}