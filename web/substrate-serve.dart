/// Bootstrapping the Service Worker to Host the Substrate Server.


import 'package:js/js.dart';
import 'package:substrate/src/server/external_api/browser_jop.dart';

installListener(ExtendableEvent value){
  Console.info('Install Event Heard');
  skipWaiting().then(allowInterop(claimClients));
}

activateListener(dynamic value){
  Console.info('Activation message heard');
}

claimClients(){

}


/// Executed when the script is registered
main() {

  String version ='0.0.39';

  Console.info('Bootstrapping $version');

  addEventListener('install', allowInterop(installListener));

  addEventListener('activate', allowInterop(activateListener));



}

