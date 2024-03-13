import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_bloc.dart';
import 'package:tarefa_dev/sources/routes.dart';
import 'package:tarefa_dev/sources/services/storage_service.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  StorageService storageService = StorageService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PeriodsBloc(storageService: storageService))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarefa Dev',
        routes: RoutesApp.routes,
        initialRoute: RoutesApp.configurations,
      )
    );
  }
}