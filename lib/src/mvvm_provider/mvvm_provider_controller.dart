import 'package:dev_pattern_sample/src/model/model.dart';
import 'package:flutter/material.dart';

class MVVMProviderController extends ChangeNotifier {
  late Model _model;
  MVVMProviderController() {
    _model = Model(); // 여기보이지? 내가 정확히 예측한대로 생성자에서 아니면 팩토리에서 모델 객체를 생성하고 있다.
  }

  int get count => _model.counter; // 그리고 해당 생성된 객체에서 count 를 받는 getter 함수를 만들었고..

  void update() { // 여기서 update 함수를 이용해서 notifyListener() 함수를 호출하고 있고..
    notifyListeners();
  }

  void incrementCounter() { // 마찬가지고 뷰에서 사용할 setter 함수를 만들었고...
    _model.incrementCounter();
    update();
  }

  void decreamentCounter() { // 여기도 setter 함수이고..
    _model.decrementCounter();
    update();
  }
}
