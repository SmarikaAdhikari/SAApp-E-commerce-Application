import 'dart:async';

StreamController<String> biocontroller = StreamController<String>.broadcast();
Stream<String> get dataStream => biocontroller.stream;
