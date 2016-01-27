import 'package:test/test.dart';
import 'package:substrate/src/server/gateway.dart';

main() {
  group('Version Map Lookup :\t', () {
    setUp(() {});

    test('Should return a list when valid symbol is provided.', () {
      expect(versionLookup(#VDEF), isList);
      expect(versionLookup(#V001), isList);
    });

    test('Should contain a script name and scope in the returned list.', () {
      expect(versionLookup(#V002), isList);
      List result = versionLookup(#V002);
      expect(result[0], contains("_v002"));
    });

    test("Should return the default if the version does not exist not null.",(){
       expect(versionLookup(#DOESNOTEXIST), isList);
      List result = versionLookup(#DOESNOPTEXIST);
      expect(result[0], equals('substrate_default.dart'));
      expect(result[1], equals('./'));
    });
  });
}
