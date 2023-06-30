import 'dart:async';

StreamController<String> datecontroller = StreamController<String>.broadcast();
Stream<String> get dataStream => datecontroller.stream;
