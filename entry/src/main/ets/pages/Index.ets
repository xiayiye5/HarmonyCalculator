import { CalculatorWidget } from './CalculatorWidget';

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      CalculatorWidget()
    }
    .height('100%')
    .width('100%')
  }
}