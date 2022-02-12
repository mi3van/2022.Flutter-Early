// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:task_04_navigation/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatelessWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final String categoryName;
  final ColorSwatch backgroundColor;

  const ConverterRoute({
    required this.units,
    required this.categoryName,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we use a [ListView].
  Widget _buildUnitWidgets(List<Widget> units) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => units[index],
      itemCount: units.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: backgroundColor,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name!,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    final listView = _buildUnitWidgets(unitWidgets);

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        categoryName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
