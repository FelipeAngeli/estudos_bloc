import 'package:estudos_bloc/pages/bloc/home_bloc.dart';
import 'package:estudos_bloc/pages/bloc/home_event.dart';
import 'package:estudos_bloc/pages/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) =>
            HomeBloc(HomeLoadingState())..add(HomeFetchList()),
        child: HomePages(),
      ),
    );
  }
}
