import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mascotas/presentation/presentation.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  get future => null;


  //nos permite crear este observador (del estado de la app)
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  //como hemos anadido un observer, necesitamos hacer una limpieza
  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    //print('State: $state');
    // aqui puedo tener el provider que yo estoy escuchando
    // .notifier , lo autorizo
    // state : lo actualizo
    ref.read(AppStateProvider.notifier).state = state;

    /*
    | resumed   :  app paso del background al foreground
    | inactive  :  app ya no esta focused, no esta en 1er plano
    | paused    :  app se mando a segundo plano
    | detached  :  app destruida
    */

    super.didChangeAppLifecycleState(state);
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pets',
      debugShowCheckedModeBanner: false,
      //theme: AppTheme().getTheme(),
      home: FutureBuilder(
        future: future,
        builder: (context, dataSnapShot)
        => const HomeScreen(),
      ),
    );
  }
}

