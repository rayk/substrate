/// This library is responsible for initialisation and configuration of the
/// substrate server. It executes within the main rendering thread of the window,
/// and attempts to load the substrate server onto the service worker.
library server.gateway;

import 'dart:async';
import 'dart:isolate';

import 'package:lookup_map/lookup_map.dart';

part 'startup/version_map.dart';

/// Represents the macro level controls to the substrate server. This is single
/// instance class, hence it is not important that you hang onto it. It is
/// just the control of the server not the actual server.
class ServerGateway {
  static ServerGateway _instance;
  String _serverScript, _scope;
  Symbol _version;
  ReceivePort gatewayReceivePort = new ReceivePort();

  /// Creates an instance of the substrate service gateway if one does not exist.
  factory ServerGateway([Symbol version]) =>
      _instance ?? new ServerGateway._internal(version);

  ServerGateway._internal([Symbol v]) {
    Symbol versionKey = v ?? #VDEF;
    List<String> scriptScope = versionLookup(versionKey);
    _serverScript = scriptScope[0];
    _scope = scriptScope[1];
    _version = versionKey;
    _instance = this;
  }

  /// Return the security scope in terms of the hosting domain that server
  /// can control.
  String get serverScope {
    return _scope;
  }

  /// Returns the actual name of the script that is executing on the service
  /// worker thread and head.
  String get serverScriptName {
    return _serverScript;
  }

  /// Returns the version number of the substrate server that is running on
  /// on the service worker.
  Symbol get serverVersion {
    return _version;
  }


}
