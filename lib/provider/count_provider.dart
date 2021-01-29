import 'dart:async';

class CountProvider {

  int _count = 0;

  final _onTapController = StreamController<void>();
  Sink<void> get increment => _onTapController.sink;

  final _countController = StreamController<int>();
  Stream<int> get count => _countController.stream;

  final _resetController = StreamController<void>();
  Sink<void> get reset => _resetController.sink;

  CountProvider(){
    _onTapController.stream.listen((_) {
      print('plus');
      _count++;
      _countController.sink.add(_count);
    });

    _resetController.stream.listen((_) {
      print('reset');
      _count = 0;
      _countController.sink.add(_count);
    });
  }

  void dispose(){
    _onTapController.close();
    _countController.close();
    _resetController.close();
  }
}