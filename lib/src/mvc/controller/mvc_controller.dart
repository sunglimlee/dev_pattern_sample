import 'package:dev_pattern_sample/src/model/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MVCController extends ControllerMVC {
  factory MVCController([StateMVC? state]) => _this ??= MVCController._(state);

  MVCController._(StateMVC? state)
      : model = Model(),
        super(state);

  static MVCController? _this; // 여기 맨처음 객체를 생성하면서 static 변수에다가 factory 객체를 연결시켜준다.
  final Model model;

  void update() => setState(() {});
  /* 가장 중요한 사실은 모델과 뷰를 떨어뜨려 놓기 위해서 컨트롤러가 중간에 존재한다. 그래서 모델이 바뀌더라도 컨트롤러쪽에서만 바꾸어주면 된다.
  말그대로 좀더 쉽게 유지보수를 한다는 거지.. 만약 컨트롤러 부분이 없다면..
  흩어져 있는 뷰에 일일이 찾아가면서 변경시켜줘야한다.
  그렇다면 컨트롤러가 있는 이유는? 모델을 바뀔수 있고 그에 따른 컨트롤러만 바꾸어주면 되니깐..
  더군다나 컨트롤러가 바뀔대도 이름은 그대로 유지한다면 컨트롤러의 내용도 바뀌어도 된다는거지..
  그리고 기억나? 여기서 사용하는 모델은 반드시 컨트롤러에서 일괄적으로 관리했었던거.. 뷰는 전혀 상관하지 않았다.
   */

  void incrementCounter() {
    model.incrementCounter();
    update();
  }

  void decreamentCounter() {
    model.decrementCounter();
    update();
  }
}
