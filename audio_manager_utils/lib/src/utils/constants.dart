import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

const appName = 'Audio manager';

Color tintColor({
  required Color color,
  required Color tint,
  required double opacity,
}) {
  return Color.alphaBlend(tint.withOpacity(opacity), color);
}

Color surfaceTintColor({
  required BuildContext context,
  double opacity = .5,
}) {
  return tintColor(
    color: Theme.of(context).colorScheme.surface,
    tint: Theme.of(context).colorScheme.surfaceTint,
    opacity: opacity,
  );
}

typedef FutureCallback<T> = Future<T> Function();

Uint8List? maybeDecodeImage(String data) {
  try {
    return base64Decode(data);
  } on FormatException catch (_) {
    return null;
  }
}
