@Preview
@Component
struct DengLu {
  build() {
    Column({space:200}) {
      Text('老登乐')
        .fontSize(60)
        .width(60)

      Image($rawfile('FengMianLogo.svg'))
        .width(100)
        .margin({bottom:40})
    }
    .justifyContent(FlexAlign.End)
    .width('100%')
    .height('100%')
  }
}
export {DengLu}