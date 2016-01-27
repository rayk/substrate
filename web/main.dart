library substrate.services.webapi;


import 'package:substrate/src/server/external_api/browser_jop.dart';


import 'package:js/js.dart';

updateFoundHandler(dynamic value){
  Console.info('There has been an update Found!');
}

/// Web App Kick Off.
main() async {
  Console.info("Registering Substrate Service.");

  ServiceWorkerContainer swCtx;

  try {
    swCtx = acquireServiceWorkerContainer();
  } catch (e) {
    Console.warn(e.toString());
  }

  success(dynamic value) {
    var state;
    ServiceWorkerRegistration swRego = value;
    value.onupdatefound = allowInterop(updateFoundHandler);
    if (swRego.installing != null) {
      state = 'Installing';
    }
    if (swRego.waiting != null) {
      state = "Waiting";
    }
    if (swRego.active != null) {
      state = "Active";
    }
    Console.info('Substrate Server Registration  $state.');
    Console.info("Registered Server Scope: ${swRego.scope}");
    var ContrMsg = isControlledByServiceWorker()
        ? 'Substrate Server is controlling this page.'
        : "Substrate Server Does not have controll of this page.";
    Console.info(ContrMsg);
  }

  fail(dynamic value) {
    Console.dir('Error Function: $value');
  }



  swCtx.register('substrate-serve.dart.js', {0: './'})
      .then(allowInterop(success), allowInterop(fail));
}

ServiceWorkerContainer acquireServiceWorkerContainer() =>
    Navigator.serviceWorker ??
        (throw new NotSupportedException('No Browser Support.'));

bool isControlledByServiceWorker() =>
    (Navigator.serviceWorker.controller != null) ? false : true;

class NotSupportedException implements Exception {
  NotSupportedException([message]);
}
