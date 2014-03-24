// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Use the File `readAsLines()` method to read file contents as lines.

import 'dart:io';

void main() {
  new File('file.txt').readAsLines().then((List<String> lines) {
    // Do something with lines.
  });
}