import 'package:defov_flutter/src/config/route_generator.dart';
import 'package:defov_flutter/src/data/datasources/local/persist/database_helper.dart';
import 'package:defov_flutter/src/domains/entities/user_model.dart';
import 'package:defov_flutter/src/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    insert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: TextButton(
          onPressed: insert,
          child: const Text('Click me'),
        ),
      ),
    );
  }

  void insert() async {
    final user = UserModel(id: 1, name: 'huyen', description: 'hello');
    final count = await injector<DatabaseHelper>().queryRowCount();
    print(count);
  }
}
