import 'dart:io';

void main() {
  var file = new File('test.json');
  var sink = file.openWrite();
  sink.write('FILE ACCESSED ${new DateTime.now()}\n');

  // Close the IOSink to free system resources.
  sink.close();
}