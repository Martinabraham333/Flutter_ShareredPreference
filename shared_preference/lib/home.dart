import 'package:flutter/material.dart';
import 'package:shared_preference/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:Column(
          children: [
            Padding(padding: EdgeInsets.all(20),
            child: Text("Home Page"),
            ),

            Padding(padding: EdgeInsets.all(20),
            child: Container(
              height: 40,
              width: 75,
              color: Colors.blue,
              child: TextButton(
                onPressed: () async{
                   SharedPreferences prefs  = await SharedPreferences.getInstance();
                   prefs.remove('username');

                   Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));


                }, 
                child: Text("SignOut",
                style: TextStyle(color: Colors.white),
                )),
            ),
            )

          ],
        )


      ),
    );
  }
}