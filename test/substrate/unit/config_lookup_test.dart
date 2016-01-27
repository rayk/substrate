@TestOn('content-shell')
import 'package:test/test.dart';
import 'package:substrate/src/services/services.dart';

main() {
  group('Config Lookup :\t', () {
    setUp(() {});

    test('Should return a configuration when it exist.', () {
      expect(getConfig(testConfig.config1) is String, isTrue);
      expect(
          getConfig(testConfig.config1), equals('First String Value for Test'));
    });

    test('Should second configuration which is an int.', () {
      expect(getConfig(testConfig.config2) is int, isTrue);
    });

    test('Should blowup when the configuration does not exist.', () {
      expect(()=> getConfig(testConfig.missing),  throwsArgumentError);
    });
  });
}
