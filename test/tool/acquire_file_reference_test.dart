import 'package:test/test.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import '../../tool/substrate/build_substrate.dart';

main(){
  group('File Reference :\t', () {

    setUp(() {

    });

    test('Should return to reference for an existen file in the project.', () async{
      var ctx = new path.Context();
      Function fileReferenceFor = acquireFileReference(ctx);
      File pubSpecYalFile =  await fileReferenceFor('/pubspec.yaml');
      expect(pubSpecYalFile is File, isTrue);
      expect(pubSpecYalFile.toString(), contains('/substrate/pubspec.yaml'));
    });

    test('Should throw aurgument error if file does not exist', () async {
      var ctx = new path.Context();
      Function fileReferenceFor = acquireFileReference(ctx);
      expect(fileReferenceFor('/bigduckFile.txt'), throwsArgumentError);
    });
  });

}
