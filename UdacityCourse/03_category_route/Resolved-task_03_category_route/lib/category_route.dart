// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:task_03_category_route/category.dart';

// TODO: Define any constants

/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[0],
          color: _baseColors[0]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[1],
          color: _baseColors[1]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[2],
          color: _baseColors[2]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[3],
          color: _baseColors[3]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[4],
          color: _baseColors[4]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[5],
          color: _baseColors[5]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[6],
          color: _baseColors[6]),
      Category(
          iconLocation: Icons.cake,
          name: _categoryNames[7],
          color: _baseColors[7]),
    ];

    final listView = ListView(
      children: categories,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );

    final appBar = AppBar(
        elevation: 0,
        backgroundColor: Colors.green[100],
        title: const Center(
            child: Text(
          'Unit Converter',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        )));

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: appBar,
      body: listView,
    );
  }
}
