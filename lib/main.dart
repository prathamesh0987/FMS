import 'package:flutter/material.dart';
import 'package:fms/screen/camera_widget.dart';
import 'package:fms/screen/process_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FMS APP'),
        ),
        body: MyResizableWidgets(),
      ),
    );
  }
}

class MyResizableWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildBorderContainer(
            color: Colors.blue,
            child: Center(
              child: MyProgressBar(),
            ),
          ),
        ),
        Expanded(
          child: _buildBorderContainer(
            color: Colors.green,
            child: Center(
              child: Text('Widget 2'),
            ),
          ),
        ),
        Expanded(
          child: _buildBorderContainer(
            color: Colors.orange,
            child: Center(
              child: CameraWidgetWithBackground(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBorderContainer({required Color color, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set your desired border color here
          width: 2.0, // Set your desired border width here
        ),
        color: color,
      ),
      child: ResizableBox(child: child),
    );
  }
}

class ResizableBox extends StatefulWidget {
  final Widget child;

  ResizableBox({required this.child});

  @override
  _ResizableBoxState createState() => _ResizableBoxState();
}

class _ResizableBoxState extends State<ResizableBox> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: widget.child,
        );
      },
    );
  }
}

class CameraWidgetWithBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow, // Set your desired background color here
      child: CameraWidget(),
    );
  }
}
   