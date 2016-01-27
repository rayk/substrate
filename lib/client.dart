// Copyright (c) 2015, Ray King. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The substrate client library provides runtime access to the substrate
/// server. By using this library in the **Client Application / Client Shell**
/// able to access services provided by the  substrate server, which is running
/// on the service worker thread.
///
/// The client API handles all the messaging with the substrate server. All
/// replies are provided in the response stream.

library client;

export 'src/client_api/client.dart';
