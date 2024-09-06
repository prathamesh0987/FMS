import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Process Indicators'),
        ),
        body: Column(
          children: [
            ProcessBox(
              processName: 'Process A',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process B',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process C',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process D',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process E',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process F',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process G',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            ProcessBox(
              processName: 'Process H',
              indicator1Color: Colors.red,
              indicator2Color: Colors.green,
            ),
            // Add more ProcessBox widgets for additional processes
          ],
        ),
      ),
    );
  }
}

class ProcessBox extends StatelessWidget {
  final String processName;
  final Color indicator1Color;
  final Color indicator2Color;

  ProcessBox({
    required this.processName,
    required this.indicator1Color,
    required this.indicator2Color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                processName,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Indicator(label: '', initialColor: indicator1Color),
                  Indicator(label: '', initialColor: indicator2Color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatefulWidget {
  final Color initialColor;
  final String label;

  Indicator({required this.initialColor, required this.label});

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  late Color _currentColor;
  bool _clicked = false;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _changeColor() {
    final darkenedColor = darken(_currentColor);
    setState(() {
      _clicked = true;
      _currentColor = darkenedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_clicked) {
          _changeColor();
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentColor,
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color darken(Color color) {
    final hsv = HSVColor.fromColor(color);
    final darkenedColor = HSVColor.fromAHSV(
      hsv.alpha,
      hsv.hue,
      math.max(0.0, hsv.saturation - 0.2),
      math.max(0.0, hsv.value - 0.2),
    ).toColor();
    return darkenedColor;
  }
}
