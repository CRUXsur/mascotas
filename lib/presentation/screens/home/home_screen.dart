
import 'package:flutter/material.dart';

import 'package:mascotas/widgets/widgets.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ! Barra custom utilities bar
        const CustomBar(),
        //const SizedBox(height: 15,),
        //! Boton para salir --------------------------------------------------
        // Positioned( top: 40, left: 20,
        //     child: IconButton.filledTonal(onPressed: () {
        //       //context.pop();
        //     }, icon: const Icon( Icons.arrow_back ))
        // ),

        // ! Ir a la posición del usuario -------------------------------------
        Positioned( bottom: 140, right: 20,
            child: IconButton.filledTonal(onPressed: () {
              //
            }, icon: const Icon( Icons.location_searching ))
        ),

        // ! Seguir usuario ---------------------------------------------------
        Positioned( bottom: 190, right: 20,
          child: IconButton.filledTonal(onPressed: () {
            //
          }, icon:  Icon(Icons.directions_run)
          ),
        ),

        // ! Crear marcador ---------------------------------------------------
        Positioned( bottom: 240, right: 20,
          child: IconButton.filledTonal(onPressed: () {


          }, icon: const Icon( Icons.pin_drop )), //Icons.accessibility_new_outlined
        ),

      ],
    );
  }
}

