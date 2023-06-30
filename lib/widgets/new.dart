import 'dart:async';

StreamController<String> newcontroller = StreamController<String>();
Stream<String> get dataStream => newcontroller.stream;
