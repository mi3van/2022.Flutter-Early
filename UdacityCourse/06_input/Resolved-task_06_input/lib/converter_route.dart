// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);
const _horizontalPadding = EdgeInsets.symmetric(horizontal: 16);
const _verticalMiniPadding = EdgeInsets.symmetric(vertical: 8);

const _borderRadius = 0.0;

final _outlineBorder =
    OutlineInputBorder(borderRadius: BorderRadius.circular(_borderRadius));

const _inputErrorText = 'Invalid number enterd';

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Color for this [Category].
  final ColorSwatch color;
  late final Color errorColor;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the color and units to not be null.
  ConverterRoute({
    required this.color,
    required this.units,
    Key? key,
  }) : super(key: key) {
    errorColor = color['error'] ?? Colors.red;
  }

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  Unit? _fromUnit;
  Unit? _toUnit;
  double? _inputValue;
  String _convertedValue = '';

  List<DropdownMenuItem<String>>? _unitMenuItems;
  bool _showValidationError = false;

  @override
  initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  @override
  Widget build(BuildContext context) {
    final inputWidgetsGroup = Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: Theme.of(context).textTheme.headline4,
              onChanged: _onInputChanged,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  errorText: _showValidationError ? _inputErrorText : null,
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      borderSide:
                          BorderSide(width: 1, color: widget.errorColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      borderSide:
                          BorderSide(width: 1, color: widget.errorColor)),
                  errorStyle: TextStyle(color: widget.errorColor),
                  labelText: 'Input',
                  labelStyle: Theme.of(context).textTheme.headline4,
                  border: _outlineBorder),
            ),
            _createDropdown(_fromUnit!.name, _updateFromConversion)
          ],
        ));

    const arrows = RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ));

    final outputWidgetGroup = Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputDecorator(
              decoration: InputDecoration(
                  labelText: 'Output',
                  labelStyle: Theme.of(context).textTheme.headline4,
                  border: _outlineBorder),
              child: Text(_convertedValue,
                  style: Theme.of(context).textTheme.headline4),
            ),
            _createDropdown(_toUnit!.name, _updateToConversion)
          ],
        ));

    final converter = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [inputWidgetsGroup, arrows, outputWidgetGroup]);

    return Padding(
      padding: _padding,
      child: converter,
    );
  }

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems() {
    final newItems = <DropdownMenuItem<String>>[];
    for (var unit in widget.units) {
      newItems.add(DropdownMenuItem(
          value: unit.name,
          child: Text(
            unit.name!,
            style: const TextStyle(fontWeight: FontWeight.bold),
            softWrap: true,
          )));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  /// Sets the default values for the 'from' and 'to' [Dropdown]s.
  void _setDefaults() {
    setState(() {
      _fromUnit = widget.units[0];
      _toUnit = widget.units[1];
    });
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  void _updateConversion() {
    setState(() {
      _convertedValue = _format(
          _inputValue! * (_toUnit!.conversion! / _fromUnit!.conversion!));
    });
  }

  void _onInputChanged(String input) {
    setState(() {
      if (input.isEmpty) {
        _convertedValue = '';
      } else {
        try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  Unit? _getUnit(String? unitName) =>
      widget.units.firstWhere((Unit unit) => unit.name == unitName);

  void _updateFromConversion(String? unitName) {
    if (unitName == null) return;

    setState(() {
      _fromUnit = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateToConversion(String? unitName) {
    if (unitName == null) return;

    setState(() {
      _toUnit = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
  }

  Widget _createDropdown(String? currentValue, Function(String?) onChanged) =>
      Container(
        margin: const EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
        ),
        padding: _verticalMiniPadding,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.grey[50]),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value: currentValue,
                items: _unitMenuItems,
                onChanged: onChanged,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
      );
}
