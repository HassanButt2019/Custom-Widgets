

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vender_app/src/screens/authentication/login.dart';

class SplashScreen extends StatefulWidget {
  

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(seconds:3),()=>{
     Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent,)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:Colors.white,
                        radius: 70.0,
                        child: Image.asset(
                          'images/cart.png',
                          height: 80,
                          width:80,
                        
                        )
                        
                      ),
                      Padding(padding: EdgeInsets.only(top:10.0),),
                      Text("E-Cart" , style: TextStyle(color: Colors.white , fontSize: 24.0 , fontWeight: FontWeight.bold),)

                  ],),
                )
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white,),
                      Padding(padding: EdgeInsets.only(top:20)
                      ),
                      Text("The Best In The Market" , style: TextStyle(color: Colors.white , fontSize: 18.0 , fontWeight: FontWeight.bold),)
                    ],
                  ),

                ),



          ],)
        ],
      ),

    );
  }
}