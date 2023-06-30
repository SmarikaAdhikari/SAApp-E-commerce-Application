import 'dart:async';

StreamController<String> biocontroller = StreamController<String>();
Stream<String> get dataStream => biocontroller.stream;
