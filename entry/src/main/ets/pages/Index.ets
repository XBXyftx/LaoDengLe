@Entry
@Component
struct Index {

  build() {
    //根组件
    Column() {

      //index核心tabs组件
      Tabs() {

        //首页
        TabContent(){

        }
        .tabBar(tabBarBuilder($rawfile('Firstpage.svg'),'首页',0))


      }
      .fullSize()

    }
    .fullSize()
  }
}

@Builder
function tabBarBuilder(img:Resource,text:string,index:number){
  Column(){
    Image(img)
      .height(40)
    Text(text)
      .fontSize(16)
  }
}

@Styles
function fullSize() {
  //根组件
  .height('100%')
  .width('100%')
}
