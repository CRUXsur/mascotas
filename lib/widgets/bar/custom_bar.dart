import 'package:flutter/material.dart';


import 'package:mascotas/widgets/widgets.dart';




class CustomBar extends StatelessWidget {
  const CustomBar({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        //color: Colors.deepOrange.withOpacity(0.2), //Color(0xFFF2F3EE),
        // color: Colors.black38.withOpacity(0.6),//blueGrey.withOpacity(0.4),
        color: Colors.blueGrey.withOpacity(0.8),
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //user
              BtnCircular(
                color: Colors.deepOrange,
                width: 25,
                child: const FadeInImage(
                  placeholder: AssetImage('assets/images/user_avatar.png'),
                  image: AssetImage('assets/images/user_avatar.png'),
                ),
                onTap: (){
                  //
                  // Get.to( ClientesScreen());
                },
              ),

              const Spacer(),

              //text 'Salva una Mascota'
              TextWidget(
                text: 'Salva una Mascota',
                textSize: 24,
                color: Colors.white,
                isTitle: true,
              ),


              const Spacer(),

              //add new signal
              BtnCircular(
                color: Colors.deepOrange,
                width: 25,
                child: const FadeInImage(
                  placeholder: AssetImage('assets/images/logo.png'),
                  image: AssetImage('assets/images/logo.png'),
                ),
                onTap: (){
                  //
                  // Get.to( ClientesScreen());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
