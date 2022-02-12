import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SquareAnimation(),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

const _duration = 1000;

class SquareAnimationState extends State<SquareAnimation> {
  static const squareSize = 50.0;
  
  Alignment _squareAlign =  Alignment.center;
  bool _isLeftEnabled = true;
  bool _isRightEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              AnimatedContainer(
                alignment: _squareAlign,
                duration: const Duration(milliseconds: _duration),
                child:Container(
                  width: squareSize,
                  height: squareSize,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(),
                  ),
                ),
              )
              
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _isLeftEnabled ? _leftBtnPressed : null
            , child: const Text("To the left")),
            ElevatedButton(
                onPressed: _isRightEnabled ? _rightBtnPressed : null
                , child: const Text("To the right"))
          ],
        )
      ],
    );
  }
  
  Future _leftBtnPressed() async {
    setState(() => {_squareAlign = Alignment.centerLeft, _isLeftEnabled = false, _isRightEnabled = false});
    await Future.delayed(const Duration(milliseconds: _duration));
    setState(() => _isRightEnabled = true);
  }
  
  Future _rightBtnPressed() async {
    setState(() => {_squareAlign = Alignment.centerRight, _isLeftEnabled = false, _isRightEnabled = false});
    await Future.delayed(const Duration(milliseconds: _duration));
    setState(() => _isLeftEnabled = true);
  }
}
