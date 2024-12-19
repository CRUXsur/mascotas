import 'package:flutter/material.dart';




class CustomBar extends StatelessWidget {
  const CustomBar({super.key});






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        //color: Colors.deepOrange.withOpacity(0.2), //Color(0xFFF2F3EE),
        color: Colors.blueGrey.withOpacity(0.4),
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //user
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.insert_emoticon_sharp),
              ),
              Spacer(),

              // title: Text('Salva una Mascota',
              //   style: TextStyle(fontSize: 24, color: Colors.blue ),
              // ),

              Spacer(),
              //add new signal
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.insert_emoticon_sharp),
                //icon: ImageIcon( ImageIcon. 'assets/logo.png'),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
