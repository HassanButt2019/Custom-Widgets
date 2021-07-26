
import 'package:flutter/material.dart';

class ToggleBtn extends StatefulWidget {
  ToggleBtn({@required this.height , @required this.width});

  double height , width;

  @override
  _ToggleBtnState createState() => _ToggleBtnState();
}

class _ToggleBtnState extends State<ToggleBtn> {
  bool toggleValue = false;
  toggleButton(){
    setState(() {
      toggleValue = !toggleValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: toggleValue ? Colors.greenAccent[100] : Colors.redAccent[100],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            child: InkWell(
              onTap: toggleButton,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds:1000),
                transitionBuilder: (Widget child , Animation<double> animation){
                  return ScaleTransition(
                    scale: animation ,
                    
                     child: child,);
                },
                child: toggleValue? Icon(Icons.check_circle , color: Colors.green , size: 20.0,key: UniqueKey(),):Icon(Icons.remove_circle_outline , color: Colors.red , size: 20.0,key: UniqueKey(),),
              
              
              ),
            ),
             duration: Duration(milliseconds: 1000),
             curve: Curves.easeIn,
             top: 3.0,
             left: toggleValue?30.0:0.0,
             right: toggleValue?0.0:30.0,
            
            
            ),
        ],
      ),

    );
  }
}