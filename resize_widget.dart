import 'package:flutter/material.dart';
import 'package:poster_maker/EditImageScreen/stateManagement/colorChange.dart';
import 'package:provider/provider.dart';

class ResizebleWidget extends StatefulWidget {
  ResizebleWidget({this.child, this.text});

  final Widget? child;
  var text;
  ValueChanged<bool>? tap;
 

    // --> NOTE this! <--
  static _ResizebleWidgetState? of(BuildContext context) =>
    context.findAncestorStateOfType<_ResizebleWidgetState>();
  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

const ballDiameter = 20.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double height = 50;
  double width = 70;

  double top = 100;
  double left = 100;
  var scale = 1.5;
  bool? color_change = true;

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
      print(height);
      print(width);
    });
  } 
  ValueChanged<bool>? onChange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Consumer<SwitchChanged>(
      builder: (BuildContext context, value, Widget? child) =>GestureDetector(
        onDoubleTap: (){
          setState(() {
           color_change = !color_change!;
           value.add(color_change!);
           print(value.val);

          });
    
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: top,
              left: left,
              child: Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: widget.child
                  )),
            ),
            // top left
            Positioned(
              top: top - ballDiameter / 2,
              left: left - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var mid = (dx + dy) / 2;
                  var newHeight = height - 2 * mid;
                  var newWidth = width - 2 * mid;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                    width = newWidth > 0 ? newWidth : 0;
                    top = top + mid;
                    left = left + mid;
                    scale = top * 0.2;
                    print("HELLO");
                  });
                },
              ),
            ),
            // top middle
            Positioned(
              top: top - ballDiameter / 2,
              left: left + width / 2 - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var newHeight = height - dy;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                    top = top + dy;
                    print("checkk");
                  });
                },
              ),
            ),
            // top right
            Positioned(
              top: top - ballDiameter / 2,
              left: left + width - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var mid = (dx + (dy * -1)) / 2;
      
                  var newHeight = height + 2 * mid;
                  var newWidth = width + 2 * mid;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                    width = newWidth > 0 ? newWidth : 0;
                    top = top - mid;
                    left = left - mid;
                    print("chekck2");
                  });
                },
              ),
            ),
            // center right
            Positioned(
              top: top + height / 2 - ballDiameter / 2,
              left: left + width - ballDiameter / 2,
              child: ManipulatingBall(
                change:  value.val,
                onDrag: (dx, dy) {
                  var newWidth = width + dx;
      
                  setState(() {
                    width = newWidth > 0 ? newWidth : 0;
                  });
                },
              ),
            ),
            // bottom right
            Positioned(
              top: top + height - ballDiameter / 2,
              left: left + width - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var mid = (dx + dy) / 2;
      
                  var newHeight = height + 2 * mid;
                  var newWidth = width + 2 * mid;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                    width = newWidth > 0 ? newWidth : 0;
                    top = top - mid;
                    left = left - mid;
                    print("check3");
                  });
                },
              ),
            ),
            // bottom center
            Positioned(
              top: top + height - ballDiameter / 2,
              left: left + width / 2 - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var newHeight = height + dy;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                  });
                },
              ),
            ),
            // bottom left
            Positioned(
              top: top + height - ballDiameter / 2,
              left: left - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var mid = ((dx * -1) + dy) / 2;
      
                  var newHeight = height + 2 * mid;
                  var newWidth = width + 2 * mid;
      
                  setState(() {
                    height = newHeight > 0 ? newHeight : 0;
                    width = newWidth > 0 ? newWidth : 0;
                    top = top - mid;
                    left = left - mid;
                  });
                },
              ),
            ),
            //left center
            Positioned(
              top: top + height / 2 - ballDiameter / 2,
              left: left - ballDiameter / 2,
              child: ManipulatingBall(
                change: value.val,
                onDrag: (dx, dy) {
                  var newWidth = width - dx;
      
                  setState(() {
                    width = newWidth > 0 ? newWidth : 0;
                    left = left + dx;
                  });
                },
              ),
            ),
            // center center
            Positioned(
              top: top + height / 2 - ballDiameter / 2,
              left: left + width / 2 - ballDiameter / 2,
              child: ManipulatingBall(
                change:  value.val,
                onDrag: (dx, dy) {
                  setState(() {
                    top = top + dy;
                    left = left + dx;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  ManipulatingBall({this.onDrag, this.change});

  final Function? onDrag;
  bool? change;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double? initX;
  double? initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag!(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: widget.change!
              ? Colors.transparent
              : Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
