import 'dart:async';

StreamController<String> datecontroller = StreamController<String>();
Stream<String> get dataStream => datecontroller.stream;
