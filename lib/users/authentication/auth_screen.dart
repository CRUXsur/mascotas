import 'package:flutter/material.dart';


import 'package:mascotas/users/users.dart';



class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEF9B53),//Colors.white60,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Cancel Btn
              //TabBar
              Container(
                width: 220,
                height: 40,
                margin: const EdgeInsets.only(top: 48,bottom: 0),
                //padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xFFE19557),//Colors.indigo,//Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelColor: Color(0xFF21160D),
                    unselectedLabelColor: Colors.black45,
                    tabs: const[
                      Tab(text: 'Login',),
                      Tab(text: 'Register',),
                    ]
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            // color: Color(0xFFF2F3EE),
          ),
          child: const TabBarView(
            children: [
              //LoginScreen(),
              //RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }


}