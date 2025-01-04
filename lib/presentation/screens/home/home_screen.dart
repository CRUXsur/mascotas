import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation.dart';




class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final userLocationAsync = ref.watch(UserLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicacion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ! Current Location
            Text('Ubicacion Actual'),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 30,),

            // ! Lat, Long
            Text('Seguimiento de Ubicacion'),
            watchLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),

          ],
        ),
      ),
    );
  }
}