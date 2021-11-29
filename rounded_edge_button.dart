import 'package:flutter/material.dart';

class NfTextButton extends StatelessWidget {
  NfTextButton({this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(10.0),
      child: TextButton(
        child: Container(
            width: MediaQuery.of(context).size.width *0.30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!.toUpperCase(),
                style: TextStyle(fontSize: 14)
              ),
            const  Icon(Icons.arrow_forward , color: Colors.white,)

            ],
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:  MaterialStateProperty.all<Color>(Colors.brown.shade900),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.brown)
            )
          )
        ),
        onPressed:null
      ),
    );
  }
}