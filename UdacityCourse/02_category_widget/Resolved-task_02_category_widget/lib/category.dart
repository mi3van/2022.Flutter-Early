// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.

const _widgetHeight = 100.0;
final _borderRadius = BorderRadius.circular(_widgetHeight / 2);

class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  const Category(this.iconLocation, this.name, this.clickColor, {Key? key})
      : super(key: key);

  final String name;
  final Color clickColor;
  final IconData iconLocation;

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://api.flutter.dev/flutter/material/Theme-class.html

  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: SizedBox(
            height: _widgetHeight,
            child: InkWell(
              splashColor: clickColor,
              highlightColor: clickColor,
              onTap: () {
                print('I was tapped!');
              },
              borderRadius: _borderRadius,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            iconLocation,
                            size: 60,
                          )),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 24),
                      )
                    ],
                  )),
            )));
  }
}
