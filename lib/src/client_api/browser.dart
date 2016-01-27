library client.api.browser;

import 'package:js/js.dart';
import 'dart:html';
import 'package:lookup_map/lookup_map.dart';

@JS('navigator')
external get navigator;

@JS('console')
external get console;

@JS('console.info')
external consoleInfo(String message);


LookupMap _detectionLookUp = const LookupMap(const [
  browser.crossOrigin,
  _isCrossOriginSupported,
  browser.crypto,
  _isCryptoSupported,
  browser.fileSystem,
  _isFileSystemSupported,
  browser.hashChange,
  _isHashChangeEventSupported,
  browser.historyState,
  _isHistoryStateSupported,
  browser.loadEndEvent,
  _isLoadEndEventSupported,
  browser.loadProgress,
  _isLoadProgressEventSupported,
  browser.mediaSources,
  _isMediaSourceSupported,
  browser.mediaStream,
  _isMediaStreamSupported,
  browser.notification,
  _isNotificationSupported,
  browser.performance,
  _isPerformanceSupported,
  browser.serviceWorker,
  _isServiceWorkerSupported,
  browser.shadowRoot,
  _isShadowRootRootSupported,
  browser.SIMD,
  _isSIMDTypesSupported,
  browser.webSockets,
  _isWebSocketSupported,
  browser.worker,
  _isWorkerSupported,
]);

/// Constant Fast Lookup for Function to determine environmental factors.
bool isFeatureSupported(browser feature) {
  Function detector = _detectionLookUp[feature];
  return detector();
}

bool serviceWorkerSupport() {
  if (navigator.serviceWorker != null) {
    return true;
  }

  return false;
}

bool _isCrossOriginSupported() => HttpRequest.supportsCrossOrigin;

bool _isCryptoSupported() => FileSystem.supported;

bool _isFileSystemSupported() => FileSystem.supported;

bool _isHashChangeEventSupported() => HashChangeEvent.supported;

bool _isHistoryStateSupported() => History.supportsState;

bool _isLoadEndEventSupported() => HttpRequest.supportsLoadEndEvent;

bool _isLoadProgressEventSupported() => HttpRequest.supportsProgressEvent;

bool _isMediaSourceSupported() => MediaSource.supported;

bool _isMediaStreamSupported() => MediaStream.supported;

bool _isNotificationSupported() => Notification.supported;

bool _isPerformanceSupported() => Performance.supported;

bool _isServiceWorkerSupported() => serviceWorkerSupport();

bool _isShadowRootRootSupported() => ShadowRoot.supported;

bool _isSIMDTypesSupported() => Platform.supportsSimd;

bool _isWebSocketSupported() => WebSocket.supported;

bool _isWorkerSupported() => Worker.supported;

enum browser {
  crossOrigin,
  crypto,
  fileSystem,
  hashChange,
  historyState,
  loadEndEvent,
  loadProgress,
  mediaSources,
  mediaStream,
  notification,
  performance,
  serviceWorker,
  shadowRoot,
  SIMD,
  webSockets,
  worker
}

noServiceWorkerStrategy(){

}
