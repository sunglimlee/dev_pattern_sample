import 'package:dev_pattern_sample/src/mvvm_provider/mvvm_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MVVMProviderView extends StatefulWidget {
  MVVMProviderView({Key? key}) : super(key: key);

  @override
  State<MVVMProviderView> createState() => _MVVMProviderViewState();
}

class _MVVMProviderViewState extends State<MVVMProviderView> {
  MVVMProviderController? controller; // 여기보듯이 사용할 컨트롤러 참조변수를 만들고..
  @override
  Widget build(BuildContext context) {
    controller = Provider.of<MVVMProviderController>(context, listen: false); // 홈에서 이미 빌드된 컨트롤러를 사용한다는 거지.
    return Scaffold( // Scaffold 를 사용을 해야지만 백버턴과 앱바의 타이틀을 넣을 수 있네..
      //appBar: AppBar(title: const Text('MVVM Provider 패턴'), ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("내가 변경한 MVVM Provider 패턴 - Back button"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MVVMProviderController>(
              builder: (_, dy, widget) {
                return Text(
                  dy!.count.toString(),
                  style: const TextStyle(fontSize: 150),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        controller!.incrementCounter(); // 여기서 버턴 눌러도 변경되지 않지.. 왜냐면 listen = false 를 사용하니깐..
                      },
                      child: const Text('+')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        controller!.decreamentCounter();
                      },
                      child: const Text('-')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
