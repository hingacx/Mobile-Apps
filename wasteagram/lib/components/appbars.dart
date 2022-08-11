import 'package:flutter/material.dart';

// Simple appbar widgets for the screens
AppBar mainAppBar() {
  return AppBar(
    centerTitle: true,
    title: const Text('wasteagram'),
  );
}

AppBar postAppBar(context, message) {
  return AppBar(
    leading: Semantics(
      onTapHint: 'Returns to the wasteagram post view',
      button: true,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ),
    centerTitle: true,
    title: Text('$message'),
  );
}
