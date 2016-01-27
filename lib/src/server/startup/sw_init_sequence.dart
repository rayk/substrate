library server.gateway.serviceWorker;

import 'dart:html';
import 'dart:async';


/// Returns [true] if the Service Worker thread is Initialised with
/// the substrate server script.
Future<bool> initializeServiceWorker(String script, String scope) async {
  if (scope == null || script == null) {
    throw new ArgumentError('Null passed!');
  }
  const String msg01 =
      'Service Worker Registration Called. [InitializeServiceWorker]';
  const String msg02 = 'Service Worker Failed to initalise! :';
  bool initialized = false;

  ServiceWorkerContainer swContainer = window.navigator.serviceWorker;
  ServiceWorkerRegistration swRego;
  assert(swContainer != null);

  try {
    swContainer.register(script, {0: scope});
    window.console.info(msg01);
    window.console.info((swRego.scope));
    window.console
        .info('Asking container if ready: ${swContainer.ready.toString()}');
    var response = await window.navigator.serviceWorker;
    var second = await response.ready;
    window.console.info(second);

    initialized = true;
  } catch (e) {
    initialized = false;
  }

  return initialized;
}
