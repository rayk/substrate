/// CLI for building a substrate based upon the configuration files.
///
import 'package:path/path.dart' as path;
import 'dart:async';
import 'dart:io';

/// Check that file exist at the give location, acquires a reference to the file
/// and returns the file, otherwise it errors.
Function acquireFileReference(path.Context projectCtx) {
  var completePath = projectCtx.current;
  Future<File> getFile(String target) async {
    File referenceToFile;
    String fullPathFileName = completePath + target;
    await FileSystemEntity.isFile(completePath + target).then((bool result) {
      result
          ? referenceToFile = new File(fullPathFileName)
          : throw new ArgumentError('$fullPathFileName : Does exist as file!');
    });
    return referenceToFile;
  }
  return getFile;
}

main() async {
  Function fileReferenceFor = acquireFileReference(new path.Context());

  /// Blowup if these two files are not present.
  File pubspecFileRef = await fileReferenceFor('/pubspec.yaml');
  File configFileRef = await fileReferenceFor('/tool/substrate/substrate.yaml');


}

