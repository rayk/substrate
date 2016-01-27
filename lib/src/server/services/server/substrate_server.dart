/// This is the substrate server running in the service worker scope.
/// The service listens to certain event beside that all communication is
/// via messages on ports.

library substrateServer;

import 'dart:async';
import 'dart:html';
import 'dart:indexed_db';
import 'dart:isolate';

import 'package:js/js.dart';

@JS('ServiceWorkerGlobalScope')
external get clients;


final ReceivePort _mainInboundPort = new ReceivePort();

main() {



  _mainInboundPort.listen((message){


  });

}





