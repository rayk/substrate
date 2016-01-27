part of services;

const _configLookup = const LookupMap(const [
  serviceWorker.script,
  _swFileName,
  serviceWorker.scope,
  _swScope,
  testConfig.config1,
  _tcValue1,
  testConfig.config2,
  _tcValue2
]);

const String _swFileName = 'substrate-server.js';
const String _swScope = './';
const String _tcValue1 = 'First String Value for Test';
const int _tcValue2 = 934873101;

/// Configuration of Service Worker Variables.
enum serviceWorker {
  // Name of the script that contains service worker code.
  script,
  // Domain scope the service works is allowed to control.
  scope,
}

/// Test Configurations, will be tree shaken out when built to JS.
enum testConfig {
  // Will shaken out in production.
  config1,
  // Will also be shaken out in production.
  config2,
  // Should cause an exception
  missing,
}
