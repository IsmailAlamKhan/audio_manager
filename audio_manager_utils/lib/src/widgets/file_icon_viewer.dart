import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FileIconViewer extends StatelessWidget {
  const FileIconViewer({super.key, this.icon});
  final Uint8List? icon;
  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    if (icon == null) {
      return const Icon(Icons.music_note);
    }
    return Image.memory(
      icon,
      gaplessPlayback: true,
      height: 32,
      width: 32,
      fit: BoxFit.cover,
    );
  }
}
