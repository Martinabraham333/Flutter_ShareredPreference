import 'package:flutter/material.dart';
import 'package:shared_preference/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://stackoverflow.com/questions/54377188/how-to-use-shared-preferences-to-keep-user-logged-in-flutter
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController usernameFilter = new TextEditingController();
   
   final TextEditingController passwordFilter = new TextEditingController();
  
  Future setSession(String username) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }


  Future<String?> getSession() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: usernameFilter,
            decoration: InputDecoration(
              hintText: "Enter Username",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
          ),

          Padding(padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: passwordFilter,
            decoration: InputDecoration(
              
              hintText: "Enter Password",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
          ),

          Padding(padding: EdgeInsets.all(10),
          
          child:Container(
            height: 50,
            width: 80,
            
            child: TextButton(onPressed: (){
              
              String username=usernameFilter.text;
              String password=passwordFilter.text;
              print(username);
              print(password);


              setSession(username).then((value) {

          getSession().then((value) => print("Session Value:"+value.toString()));
    
              });

        Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
            },
           
           child:Text("Login",style: TextStyle(color:Colors.white ) ,),
           
          ),
          color: Colors.blue,
          )
          
          
          )
        ],
      ),
    ),
    
    );
  }
}