import 'package:flutter/material.dart';

class NormalView extends StatefulWidget {
  NormalView({Key? key}) : super(key: key);

  @override
  State<NormalView> createState() => _NormalViewState();
}
// 보다시피 이 객체안에 모델이 여러군데로 흩어져있고 또 컨트롤러도 산발적으로 모델을 참조하고 있고 뷰에서도 컨트롤러와 모델을 직접 접근하고 있다.
// 완전히 짬뽕이지.. 그래서 빌드함수가 계속 호출되는거고..
class _NormalViewState extends State<NormalView> {
  int count = 0;
  void update() => setState(() {});

  void incrementCounter() {
    count++;
    update();
  }

  void decrementCounter() {
    count--;
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NO 패턴')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(), style: TextStyle(fontSize: 150)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: incrementCounter, child: const Text('+')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: decrementCounter, child: const Text('-')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
