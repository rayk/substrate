part of server.gateway;

/// Contains a tree shakeable constant lookup map of version number to
/// script and scope.

/// Returns a list with the script and scope of a substrate server version
/// if the version can not be located it returns the default.
List<String> versionLookup(Symbol versionNumber) {
  List<String> result;

  LookupMap versionTable = const LookupMap(const [
    #VDEF,
    const ['substrate-serve.dart.js', './'],
    #V001,
    const ["substrate-v001.dart.js", './'],
    #V002,
    const ["substrate-002.dart.js", './'],
  ]);

  result = versionTable[versionNumber] as List<String>;

  if (versionTable[versionNumber] == null) {
    result = versionTable[#VDEF] as List <String>;
    assert(result != null);
  }

  return result;
}
