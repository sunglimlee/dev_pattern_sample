class Model {
  int _count = 0; // 여기서 보듯이 모델에서 상태변수는 꽁공 숨겨둔다.

  int get counter => _count; // 그 상태변수를 수정하고 싶으면 내가 주는 get 과 set 함수를 통해서만 변경하도록 한다. 모델은 이걸로 끝
  int incrementCounter() => ++_count;
  int decrementCounter() => --_count;
}
