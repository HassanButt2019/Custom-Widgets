import 'package:flutter/material.dart';

class NfTextField extends StatefulWidget {


  NfTextField({this.enable , this.keyboardType , this.icon , this.labelText , this.obscure});
  

  bool? enable;
  TextInputType? keyboardType;
  String? labelText;
  final IconData? icon;
  bool? obscure;

  @override
  _NfTextFieldState createState() => _NfTextFieldState();
}

class _NfTextFieldState extends State<NfTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          color: Colors.white,
          child:  Container(
            child: TextFormField(
              enabled: widget.enable,
              style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold),
              keyboardType:  widget.keyboardType,
              cursorColor: Colors.brown,
              obscureText: widget.obscure!,
              decoration:  InputDecoration(
                      focusColor:Colors.brown,
                      hoverColor: Colors.brown,
                      border: InputBorder.none,
                      hintStyle:TextStyle(color: Colors.brown), 
                      labelText: widget.labelText,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10.0),
                      prefixIcon: Icon(widget.icon , color: Colors.brown, ),
                      ),
                      
            ),
          ),
        ),
      );
  }
}