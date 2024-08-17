import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user, required this.mobileNumber, required this.gmail, required this.birthDate,});
  final String user;
  final String mobileNumber;
  final String gmail;
  final String birthDate;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Center(

child: Column(
  mainAxisAlignment: MainAxisAlignment.center,

  children:[
    SizedBox(
      height: 30,
    ),
    CircleAvatar(
      radius: 50,
    ),
    SizedBox(
      height: 30,
    ),

    Text("User Name:${widget.user}"),
    SizedBox(
      height: 20,
    ),
    Text("E-mail :${widget.gmail}"),
    SizedBox(
      height: 20,
    ),
    Text("Date of Birth:${widget.birthDate}"),
    SizedBox(
      height: 20,
    ),
    Text("Mobile Number:${widget.mobileNumber}"),

  ],
),
      )

    );
  }
}
