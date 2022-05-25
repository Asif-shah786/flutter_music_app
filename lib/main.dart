import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';

import 'blocs/network_bloc_old/export_network_bloc.dart';
import 'models/connection_util.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}
ConnectionUtil connectionUtilModel = ConnectionUtil.getInstance();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ConnectionUtil>(
      model: connectionUtilModel,
      child: MaterialApp(
        title: 'Flutter Music App task',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 3,
            )
        ),
        home: const HomePage(),
      ),
    );
  }
}





