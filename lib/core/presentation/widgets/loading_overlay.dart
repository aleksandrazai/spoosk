import 'package:flutter/material.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // Prevents taps from passing through
                behavior: HitTestBehavior.opaque,
              ),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;

      ;
    }
  }
}
