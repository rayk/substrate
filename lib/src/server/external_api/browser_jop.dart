/// This library contains all the javascript bindings to the browser.
library browser_jop_bindings;

import 'package:js/js.dart';

@JS("JSON.stringify")
external String stringify(obj);

@JS('CacheStorage')
class CacheStorage {}

@JS('Clients')
class Clients {
  external static Promise claim();
  external Promise matchAll();
}

@JS('console')
class Console {
  external static Console dir(Object obj);
  external static Console info(Object obj);
  external static Console warn(Object obj);
}

@JS('Event')
class Event {
  external static get target;
  external static String get type;
  external Event();
  external static dynamic currentTarget();
  external static void preventDefault();
}

@JS('ExtendableEvent')
class ExtendableEvent{

  external waitUntil(Function returnsPromise)

}

@JS('IDBFactory')
class IDBFactory {}

@JS("navigator")
class Navigator {
  external static ServiceWorkerContainer get serviceWorker;
}

@JS("Promise")
class Promise {
  external Promise(
      void executor(void onResolve(dynamic value), void onError(error)));

  external void then(Function onFulfilled, Function onRejected);

  external static Promise all(List input);

  // Call allowInterop when passing these.
  external static Promise resolve(dynamic value);

//external void catchError(Function func);
}

@JS('PushManager')
class PushManager {}

@JS("ServiceWorker")
class ServiceWorker {
  external String get scriptURL;

  external String get state;
}

@JS('ServiceWorkerContainer')
class ServiceWorkerContainer {
  external ServiceWorker get controller;

  external Promise register(String workerScript, Map options);
}

@JS('ServiceWorkerGlobalScope')
class ServiceWorkerGlobeScope {
  external IDBFactory get indexedDB;
  external ServiceWorkerRegistration get registration;
  external skipWaiting();
}

@JS('ServiceWorkerRegistration')
class ServiceWorkerRegistration {
  external ServiceWorker get active;
  external ServiceWorker get installing;
  external PushManager get pushManger;
  external String get scope;
  external ServiceWorker get waiting;
  external unregister();
  external set onupdatefound(Function handler);
}

@JS('WorkerConsole')
class WorkerConsole {}

@JS('addEventListener')
external Event addEventListener(String type, Function listener);


@JS('skipWaiting')
external Promise skipWaiting();