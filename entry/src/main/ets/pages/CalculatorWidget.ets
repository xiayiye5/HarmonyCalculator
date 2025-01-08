@Component
export struct CalculatorWidget {
  data: Array<Array<CalculatorData>> =
    [[{ num: "AC", color: "#B5B5B5" }, { num: "+/-", color: "#B5B5B5" }, { num: "%", color: "#B5B5B5" },
      { num: "/", color: "#FE9D12" }],
      [{ num: "7", color: "#414141" }, { num: "8", color: "#414141" }, { num: "9", color: "#414141" },
        { num: "x", color: "#FE9D12" }],
      [{ num: "4", color: "#414141" }, { num: "5", color: "#414141" }, { num: "6", color: "#414141" },
        { num: "-", color: "#FE9D12" }],
      [{ num: "0", color: "#414141" }, { num: ".", color: "#414141" }, { num: "=", color: "#FE9D12" }]]
  @State inputNum: string = "0"

  build() {
    //计算器布局
    Column() {
      Row() {
        //输入框
        Text(this.inputNum)
          .fontColor(Color.White)
          .fontSize(40)
          .textOverflow({ overflow: TextOverflow.Clip }).lineHeight(40)
          .maxLines(3)
      }
      .height("20%")
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.End)
      .width("100%")
      .padding({ right: 10 })

      Divider().backgroundColor(Color.White).height(1).margin({ left: 10, right: 10 })
      Column() {
        ForEach(this.data, (itemData: Array<CalculatorData>) => {
          Row({ space: 20 }) {
            ForEach(itemData, (item: CalculatorData) => {
              //按钮组
              Stack({ alignContent: Alignment.Center }) {
                Text(item.num).fontSize(36)
                  .fontColor(Color.White)
              }
              .aspectRatio(item.num == "0" ? 2 : 1)
              .layoutWeight(item.num == "0" ? 2 : 1)
              .borderRadius(50)
              .onClick((e) => {
                if (item.num == "AC") {
                  //清空输入框
                  this.inputNum = "0"
                } else if (this.inputNum == "0" && item.num != ".") {
                  this.inputNum = item.num
                } else {
                  this.inputNum += item.num
                }
              })
              .backgroundColor(item.color)
            })
          }.width("100%")
          .justifyContent(FlexAlign.SpaceEvenly)
        })
      }.width("90%").height("80%").justifyContent(FlexAlign.SpaceEvenly)

    }.width("100%").backgroundColor("#121212")
  }
}

interface CalculatorData {
  num: string,
  color: string | Resource
}
