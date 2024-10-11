import { router } from '@kit.ArkUI';
interface Buts{
  img:Resource
  text:string
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
  build() {
    //根组件
    Column({space:15}) {

      MonitorBuilder()

      Row(){
        ForEach(this.Buts,(item:Buts,i)=>{
          Column(){
            Image(item.img)
              .width(30)
            Text(item.text)

          }
          .width(65)
        })
      }
      .padding({left:15,right:15,top:20,bottom:20})
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
      .borderRadius(10)
      .width('90%')

    }
    .fullSize()
    .linearGradient({
      direction: GradientDirection.LeftBottom,
      colors: [['#ff720491', 0], ['#ff9608b3', 0.3], ['#ff0902ba', 1]]
    })
    .expandSafeArea()
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