import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final emailController = TextEditingController();
    final passswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'email'
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passswordController,
               decoration: InputDecoration(
                  hintText: 'password',
                  
                ),
                
              ),
               SizedBox(height: 10,),
               
            GestureDetector(
              
              onTap: () {
                signin(emailController.text.toString(),passswordController.text.toString());
              },
              child: Container(
                height: 20,
                width: 80,
                color: Colors.red,
                child: Text('submit'),
              ),
            )
                       ],
          ),
      ),
    );
  }

  void signin(String email,password) async{
    try{
   final response = await http.post(Uri.parse('https://reqres.in/api/register'),
body:{
  'email':email,
  'password':password
});
if(response.statusCode ==200){
  var data=json.decode(response.body.toString());
  print(data);
  print(data['token']);
  print('sucess');
}
else{
  print('faild');
}
    }
    catch(e){
      throw e;
    }
  }
}