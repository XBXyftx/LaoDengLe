@Preview
@Component
struct DengLu {
  build() {
    Column({space:30}) {
      Text('智能养老监护精灵')
        .fontSize(60)
        .width(60)

      Image($rawfile('FengMianLogo.svg'))
        .width(100)
        .margin({bottom:40})
    }
    .justifyContent(FlexAlign.End)
    .width('100%')
    .height('100%')
    .linearGradient({
      direction:GradientDirection.LeftBottom,
      colors:[['#ffd9039c',0],['#ffffffff',1]]
    })
    .expandSafeArea()
  }
}
export {DengLu}