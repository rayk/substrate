library client.api;

import 'browser.dart';
import 'sw_init.dart';

/// Returns [SubstrateServerAPI] after it is loaded on the service worker thread.
///
/// This function lets the 'Genie out of the bottle', upon activating it will
/// take command of the complete scope of the application. The only way to
/// talk with the Genie is via the returned API.
loadSubstrate(Map configOptions) async {

  await initializeServiceWorker(configOptions);

}

/// This is the API the substrate exposes to the Client Application.
///
/// By listening to the provide stream the client is informed by substrate
/// events and able to message the substrate via this API.
class SubstrateServerAPI {
  String version;
  String installStatus;
  String operatingStatus;
  String scope;
}
