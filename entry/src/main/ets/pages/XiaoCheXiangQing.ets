@Entry
@Component
struct XiaoCheXiangQing {
  build() {
    Column() {

    }
    .fullSize()
    .linearGradient({
      direction: GradientDirection.LeftBottom,
      colors: [['#ff720491', 0], ['#ff9608b3', 0.3], ['#ff0902ba', 1]]
    })
    .expandSafeArea()
  }
}

@Styles
function fullSize() {
  .height('100%')
  .width('100%')
}