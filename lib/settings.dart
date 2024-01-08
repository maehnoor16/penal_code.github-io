import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = '';
  late int age;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    isLogin();

  }
  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('string').toString();
    age = sp.getInt('age') ?? 0;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: FloatingActionButton(onPressed:
        () {

        },
        ),
      ),
    );
  }
}
