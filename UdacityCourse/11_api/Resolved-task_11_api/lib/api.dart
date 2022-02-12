// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:task_11_api/unit.dart';

/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
const apiCategory = {
  'name': 'Currency',
  'route': 'currency',
};

class Api {
  final _httpClient = HttpClient();
  final _url = 'flutter.udacity.com';

  Future<List<Unit>?> getUnits(String category) async {
    final uri = Uri.https(_url, '/$category');
    final jsonResponse = await _getJson(uri);

    final jsonUnits = jsonResponse?['units'];
    if (jsonUnits == null || jsonUnits is! List) {
      print('Error retrieving units');
      return null;
    }

    return jsonUnits.map<Unit>((dynamic data) => Unit.fromJson(data)).toList();
  }

  Future<double?> convert(
    String category,
    String fromUnit,
    String toUnit,
    String amount,
  ) async {
    final uri = Uri.https(_url, '/$category/convert',
        {'from': fromUnit, 'to': toUnit, 'amount': amount});
    final jsonResponse = await _getJson(uri);

    final result = jsonResponse?['conversion'];
    if (result is! double) {
      print('Error retrieving conversion.');
      return null;
    }

    return result;
  }

  Future<dynamic> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
