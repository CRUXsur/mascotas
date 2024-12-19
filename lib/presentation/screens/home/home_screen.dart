
import 'package:flutter/material.dart';

import 'package:mascotas/widgets/widgets.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // appBar: AppBar(
      //   title: const Text('Salva una Mascota'),
      //   actions: [
      //     IconButton(
      //         onPressed: (){},
      //         icon: const Icon(Icons.settings)
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //
            CustomBar(),
            SizedBox(height: 15,),
            //
          ],
        ),
      ),
    );
  }
}

