library tool.dev;

import 'package:dart_dev/dart_dev.dart' show dev, config;

main(List<String> args) async {




  // Available task configurations:
  config.analyze.entryPoints = ['lib/'];
  // config.copyLicense
  // config.coverage
  // config.docs
  // config.examples
  // config.format
  config.test
    ..unitTests=['test/substrate/unit']
    ..integrationTests = ['test/substrate/integration'];

  await dev(args);
}
