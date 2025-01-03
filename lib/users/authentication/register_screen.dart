import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


import 'package:mascotas/widgets/widgets.dart';
import 'package:mascotas/api_connection/api_connection.dart';






class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var isObsecure = true.obs;

  //validate phone number
  validateUserCelular() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.validateCelular),
        body: {
          'phone': phoneController.text.trim(),
        },
      );

      if(res.statusCode == 200) //from flutter app the connection with api to server - success
          {
        var resBodyOfValidatePhone = jsonDecode(res.body);

        if(resBodyOfValidatePhone['phoneFound'] == true)
        {
          Fluttertoast.showToast(msg: "El numero ya se encuentra Registrado.");
        }
        else
        {
          //Fluttertoast.showToast(msg: "You are ready to save to DB SERVER!");
          //register & save new admin record to database
          registerAndSaveUserRecord();
        }
      }
      else
      {
        Fluttertoast.showToast(msg: "Status is not 200");
      }

    }
    catch(e)
    {
      //print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  //Save new user register to server db
  registerAndSaveUserRecord() async
  {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      phoneController.text.trim(),
      passController.text.trim(),
    );

    try
    {
      var res = await http.post(
        Uri.parse(API.register),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200) //from flutter app the connection with api to server - success
          {
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'] == true)
        {
          Fluttertoast.showToast(msg: "Gracias!, te Registraste con exito!.");

          setState(() {
            nameController.clear(); //same as! nameController.text = "";
            emailController.clear();
            phoneController.clear();
            passController.clear();
          });
        }
        else
        {
          Fluttertoast.showToast(msg: "Ocurrio un Error, Vuelve a intentarlo.");
        }
      }
    }
    catch(e)
    {
      //print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 60,),

                  //register screen register form
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),//60
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                        child: Column(
                          children: [

                            //name-email-password || register button
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  //name
                                  TextFormField(
                                    controller: nameController,
                                    validator: (val) => val == "" ? "Please write name" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        // color: Colors.black,
                                        color: Color(0xFFEF9B53),
                                      ),
                                      hintText: "nombre...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 18,),

                                  //email
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) => val == "" ? "Please write email" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        // color: Colors.black,
                                        color: Color(0xFFEF9B53),
                                      ),
                                      hintText: "email...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 18,),

                                  //celular
                                  TextFormField(
                                    controller: phoneController,
                                    validator: (val) => val == "" ? "Please write celularNumber" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.phone_android_rounded,
                                        // color: Colors.black,
                                        color: Color(0xFFEF9B53),
                                      ),
                                      hintText: "celular...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),//30
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 18,),

                                  //password
                                  Obx(
                                        ()=> TextFormField(
                                      controller: passController,
                                      obscureText: isObsecure.value,
                                      validator: (val) => val == "" ? "Please write password" : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Color(0xFFEF9B53),
                                          // color: Colors.black,
                                        ),
                                        suffixIcon: Obx(
                                              ()=> GestureDetector(
                                            onTap: ()
                                            {
                                              isObsecure.value = !isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                              // color: Colors.black,
                                              color: Color(0xFFEF9B53),
                                            ),
                                          ),
                                        ),
                                        hintText: "password...",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),//30
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),//30
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),//30
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),//30
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),

                                  //button
                                  Material(
                                    color: Color(0xFFE07107),//Colors.black,
                                    borderRadius: BorderRadius.circular(3),//30
                                    child: InkWell(
                                      onTap: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {
                                          //validate the email
                                          validateUserCelular();
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(3),//30
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "Registrarme",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,//16
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16,),


                          ],
                        ),
                      ),
                    ),
                  ),

                  //register picture
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,50,10,10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: Image.asset(
                        "assets/pets/register.jpeg",
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );

  }

}
