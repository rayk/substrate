@TestOn('content-shell')

import 'package:test/test.dart';
import 'package:substrate/src/external_api/ext_api.dart';

main(){
  group('Feature Support Lookup (Headless) :\t', () {

    test('Should return true to cross-origin supported.', () {
      expect(isFeatureSupported(browser.crossOrigin), isTrue);
    });

    test('Should return true to history support', () {
      expect(isFeatureSupported(browser.historyState), isTrue);
    });

    test('Should return false on serviceWorker', () {
      expect(isFeatureSupported(browser.serviceWorker), isTrue);
    });
  });
}