import 'package:test/test.dart';
import 'package:substrate/server.dart';

main() {
  group('ServerGateway:\t', () {
    ServerGateway testGate00, testGate01;

    setUp(() {
      testGate00 = new ServerGateway();
      testGate01 = new ServerGateway(#VDEF);
    });

    test('Should also return same instance of gateway .', () {
      expect(identical(testGate00, testGate01), isTrue);
    });

    test('Should provide the default serverScript name.', () {
      expect(testGate00.serverScriptName, equals('substrate_default.dart'));
      expect(testGate01.serverScriptName, equals('substrate_default.dart'));
    });

    test('Should provide the default server scope.', ()  {
       expect(testGate01.serverScope, equals('./'));
      expect(testGate00.serverScope, equals('./'));
    });

    test('Should provide the service version number.',() {
      expect(testGate00.serverVersion, equals(#VDEF));
    });

    test(
        'Should provide the cached instance not a new one just because version included.',
        () {
      ServerGateway testGate4 = new ServerGateway(#V001);
      expect(testGate4.serverScriptName, isNot(equals('substrate_v001.dart')),
          reason: 'Return cached instance - There is only one service worker');
    });
  });
}
