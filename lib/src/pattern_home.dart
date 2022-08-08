import 'package:dev_pattern_sample/src/mvc/views/mvc_view.dart';
import 'package:dev_pattern_sample/src/mvvm/views/mvvm_view.dart';
import 'package:dev_pattern_sample/src/mvvm_getx/mvvm_getx_controller.dart';
import 'package:dev_pattern_sample/src/mvvm_getx/mvvm_getx_view.dart';
import 'package:dev_pattern_sample/src/mvvm_provider/mvvm_provider_controller.dart';
import 'package:dev_pattern_sample/src/mvvm_provider/mvvm_provider_view.dart';
import 'package:dev_pattern_sample/src/normal/normal_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PatternHome extends StatelessWidget {
  const PatternHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('패턴')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NormalView()));
                },
                child: const Text('NO PATTERN')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MVCView()));
                },
                child: const Text('MVC PATTERN')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MVVMView()));
                },
                child: const Text('MVVM PATTERN')),
            ElevatedButton( // 이부분을 보면서 느낀건데 그안의 내용을 바꾸는것도 의미가 있는데 이건 지금 라우팅을 해서 새롭게 가는거잖아..
              // 뭐 이렇게 해도 좋은게 여전히 BottomNavigation을 같은걸 사용하고 Provider 에서 제공하는 값을 이용해서 bottom navi 아이콘 선택가능하고
                onPressed: () {
                  Navigator.push( // 이것도 appbar 에 관련된거지.. //QnaAppbar
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<MVVMProviderController>.value(
                        value: MVVMProviderController(),
                        child: MVVMProviderView(),
                      ),
                    ),
                  );
                },
                child: const Text('MVVM PROVIDER PATTERN')),
            ElevatedButton(
                onPressed: () {
                  Get.to(MVVMGetxView(), binding: BindingsBuilder(
                    () {
                      Get.put(MVVMGetxController()); // 여기서 컨트롤러 객체를 넘겨준다.
                    },
                  ));
                },
                child: const Text('MVVM GETX PATTERN')),
          ],
        ),
      ),
    );
  }
}
