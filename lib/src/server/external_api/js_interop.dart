/// Contains the general JS interop wrapping and alike that are specific to an
/// API.

library jsinterop;

import "dart:js" as js;
import 'dart:async';

Future promiseToFuture(promise) {

  var completer = new Completer();
  promise.then(([e]) {
    completer.complete(e);
  });

  promise.catchError(([e]) {
    completer.completeError(e);
  });

  return completer.future;
}

/*
class Promise {
  static Promise all(List input) {
    return js.context["Promise"].callMethod("all", [input]);
  }

  final js.JsObject obj;

  Promise(this.obj);

  void then(Function func) {
    obj.callMethod("then", [func]);
  }

  void catchError(Function func) {
    obj.callMethod("catch", [func]);
  }
}
*/
