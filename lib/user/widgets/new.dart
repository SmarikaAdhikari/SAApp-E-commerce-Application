import 'dart:async';

StreamController<String> newcontroller = StreamController<String>.broadcast();
Stream<String> get dataStream => newcontroller.stream;
