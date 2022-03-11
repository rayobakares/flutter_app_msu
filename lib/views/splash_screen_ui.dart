import 'package:flutter/material.dart';
import 'package:flutter_app_msu2/views/show_list_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {

  void initState(){
    Future.delayed(
      Duration(
        seconds: 3,
      ),
    ()=>Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:(context) => ShowListUI(),
        ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 164, 168),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fastfood.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'สายด่วนชวนกิน',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CircularProgressIndicator(
                  color: Color.fromARGB(255, 221, 16, 194),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Created By Arthur',
                  style: TextStyle(
                    color: Colors.amber[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
