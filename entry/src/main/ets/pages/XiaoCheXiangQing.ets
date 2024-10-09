@Entry
@Component
struct XiaoCheXiangQing {
  build() {
    //根组件
    Column() {

      MonitorBuilder()

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
    .padding({ top: 5, bottom: 5 });
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