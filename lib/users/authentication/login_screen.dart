import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


import 'package:mascotas/api_connection/api_connection.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var celularController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;


  loginUserNow() async {

    try
    {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "phone": celularController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if(res.statusCode == 200) //from flutter app the connection with api to server - success
          {
        var resBodyOfLogin = jsonDecode(res.body);
        if(resBodyOfLogin['success'] == true)
        {
          Fluttertoast.showToast(msg: "Usted ha iniciado sesión exitosamente.");

          //save userInfo to local Storage using Shared Prefrences


          Future.delayed(const Duration(milliseconds: 2000), ()
          {
            //Get.to( const DashboardFragment());
          });

        }
        else
        {
          Fluttertoast.showToast(msg: "Credenciales incorrectas.\n Vuelva a intentarlo.");
        }
      }
      else
      {
        Fluttertoast.showToast(msg: "Status is not 200");
      }
    }
    catch(errorMsg)
    {
      //print("Error :: " + errorMsg.toString());
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

                  //login screen login form
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

                            //email-password-login button
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  //celular
                                  TextFormField(
                                    controller: celularController,
                                    validator: (val) => val == "" ? "Ingrese su numero de Celular" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.phone_android_rounded,
                                        //color: Colors.black,
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
                                        horizontal: 7,//14
                                        vertical: 3,//6
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 18,),

                                  //password
                                  Obx(
                                        ()=> TextFormField(
                                      controller: passwordController,
                                      obscureText: isObsecure.value,
                                      validator: (val) => val == "" ? "Ingrese su password" : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          // color: Colors.black,
                                          color: Color(0xFFEF9B53),
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
                                          horizontal: 7,//14
                                          vertical: 3,//6
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
                                          loginUserNow();
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(3),//30
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 160,),

                  //login picture
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,50,10,10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: Image.asset(
                        "assets/pets/login.jpeg",
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
