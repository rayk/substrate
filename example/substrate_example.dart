// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library substrate.example;


import 'package:lookup_map/lookup_map.dart';

enum Area { time, stopping, count }

enum Time { delay, jumpforward, jumpbackwards }

_timeConfig(Time variable) {
  const int _delay = 3;
  const int _jumpforward = 5;
  const int _jumpbackbackwards = 9;

  const lookup = const LookupMap(const [
    Time.delay,
    _delay,
    Time.jumpforward,
    _jumpforward,
    Time.jumpbackwards,
    _jumpbackbackwards
  ]);

  return lookup[variable];
}

Function configurationLookup(Area area) {
  const configLook = const LookupMap(const [Area.time, _timeConfig, Area.count, 32]);
  return configLook[area];
}

main() {

  Function timeLu = configurationLookup(Area.time);

  int x = timeLu(Time.delay);

  print (x);

}
