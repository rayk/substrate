/// Contains the universe of services the substrate can offer.
library services;

import 'dart:async';
import 'dart:core';
import 'dart:html';

import 'package:lookup_map/lookup_map.dart';
import 'package:substrate/src/external_api/ext_api.dart';

part 'configuration/config_lookup.dart';

/// Returns the configuration constant based upon the enumerated key from the lookup.
/// Blows up with [ArgumentError] the key is not present.
getConfig(var configurationSet) {
  var result = _configLookup[configurationSet];
  if (result == null) {
    throw new ArgumentError('$configurationSet could be found!');
  } else {
    return result;
  }
}
