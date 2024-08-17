import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:function_testing/screens/home_screens/home_page.dart';
import 'package:function_testing/screens/utilise/calender_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../utilise/assets_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController gmailController = TextEditingController();

  bool isEmailValidate = false;

  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Stack(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: image != null
                        ? ClipOval(
                            child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          ))
                        : Image.asset(
                            profileImage,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () async {
                          await openDialog(context);
                          setState(() {});
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'last Name'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.none,
                  onTap: () {
                    pickDate(context, birthDateController,firstDate: DateTime(2000),lastDate: DateTime(2019));
                  },
                  controller: birthDateController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Date of Birth'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      counterText: "",
                      labelText: 'Mobile Number'),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: gmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'G-mail'),
                  onChanged: (val) {
                    if (val.contains('@gmail.com')) {
                      isEmailValidate = false;
                      setState(() {});
                    }
                  },
                ),
              ),
              if (isEmailValidate)
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter the valid email",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      counterText: "",
                      labelText: 'Enter the Password'),
                  maxLength: 8,
                  obscuringCharacter: '*',
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      counterText: "",
                      labelText: 'Confirm the password'),
                  maxLength: 8,
                  obscuringCharacter: '*',
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (firstNameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty &&
                      birthDateController.text.isNotEmpty &&
                      mobileNumberController.text.isNotEmpty &&
                      gmailController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    if (passwordController.text.length == 8 &&
                        confirmPasswordController.text.length == 8) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        if (gmailController.text.contains('@gmail.com')) {
                          isEmailValidate = false;
                          setState(() {});
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return HomePage(
                              user:
                                  ' ${firstNameController.text + lastNameController.text}',
                              mobileNumber: '${mobileNumberController.text}',
                              gmail: '${gmailController.text}',
                              birthDate: '${birthDateController.text}',
                            );
                          }));
                        } else {
                          isEmailValidate = true;
                          setState(() {});
                          print('Enter valid the gmail');
                        }
                      } else {
                        print('object');
                      }
                    } else {
                      print("object");
                    }
                  } else {
                    print('this ');
                  }
                },
                child: Text("Sign In"),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
       content: Container(
         height: 160,
         width: 200,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             InkWell(
               onTap: () async {
                 image = await picker.pickImage(
                   source: ImageSource.gallery,
                 );
                 Navigator.pop(context);
                 setState(() {});
               },
               child: Container(
                 height: 60,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13,),
                   border: Border.all(
                     color: Colors.green,
                   ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Icon(Icons.image,),
                     Text("Select from gallery",),
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: () async {
                 image = await picker.pickImage(
                   source: ImageSource.camera,
                 );
                 Navigator.pop(context);
                 setState(() {});
               },
               child: Container(
                 height: 60,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13,),
                   border: Border.all(
                     color: Colors.green,
                   ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Icon(Icons.camera_alt_outlined,),
                     Text("Select from camera",),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),

        );
      },
    );
  }




}
