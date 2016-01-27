/// The service library exposes the end points for client API and contains
/// the various services provided by the server. All the code contained in this
/// library reside in the service worker heap and executes on it's thread at
/// runtime.
///
/// All runtime interaction with the client is via message passing.

library server;

/// Substrate service API provide server lifecycle operations to the client.
///
export 'package:substrate/src/server/gateway.dart';
