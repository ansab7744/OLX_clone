import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_project/view/addpage.dart';
import 'package:olx_project/view/homepage.dart';
import 'package:olx_project/view/loginpage.dart';
import 'package:olx_project/view/signuppage.dart';

class saignuppage extends StatefulWidget {
  const saignuppage({super.key});

  @override
  State<saignuppage> createState() => _saignuppageState();
}
class _saignuppageState extends State<saignuppage> {

  
var mailctr=TextEditingController();
var psdctr=TextEditingController();
var nmctr=TextEditingController();


  auth({required  email,required password,}){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString()).then((value) => 
    Navigator.push(context,MaterialPageRoute(builder: (context) => homepage(),))
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: 
              [Container(
          height:600 ,
          width:400 ,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 28, 57),
          ),
           child: Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Column(
                    children: [
                      Text("Sign Up",style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 8,),
                      Text("Please sign up to get start",style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),)
                    ],
                  ),
                ),
              ),
              Stack(
                children: 
                  [Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Container(
                      height: 600,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                        )
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 30,left: 30),
                        child: Text("NAME",style: TextStyle(
                        color: Colors.black,fontSize: 16,
                        fontWeight: FontWeight.w600
                       ),),
                      ),                   
                    ),
                  ),  
                    Padding(
                  padding: const EdgeInsets.only(top: 320,left: 30,right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    color: Color.fromARGB(255, 221, 220, 222),

                    ),
                    child: TextFormField(
                      controller: nmctr,
                      decoration: InputDecoration(
                        labelText: "Enter Name",
                        border: OutlineInputBorder(                       
                          borderRadius: BorderRadius.all(Radius.circular(18)),                         
                        ),
                         
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 390,left: 30),
                  child: Text("EMAIL",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                ),
                  Padding(
                  padding: const EdgeInsets.only(top: 420,left: 30,right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    color: Color.fromARGB(255, 221, 220, 222),

                    ),
                    child: TextFormField(
                      controller: mailctr,
                      decoration: InputDecoration(
                        labelText: "exapmle@gmail.com ",
                        border: OutlineInputBorder(                       
                          borderRadius: BorderRadius.all(Radius.circular(18)),                         
                        ),
                         
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 490,left: 30),
                  child: Text("PASSWORD",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,fontWeight: FontWeight.w600
                  ),),
                ),
                  Padding(
                  padding: const EdgeInsets.only(top: 520,left: 30,right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    color: Color.fromARGB(255, 221, 220, 222),

                    ),
                    child: TextFormField(
                      controller: psdctr,
                      decoration: InputDecoration(
                        labelText: "* * * * * * * * ",
                        suffixIcon: Icon(Icons.remove_red_eye_rounded),
                        border: OutlineInputBorder(                       
                          borderRadius: BorderRadius.all(Radius.circular(18)),                         
                        ),
                         
                      ),
                    ),
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 610,left: 15,right: 15),
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 203, 39, 27),
                      borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          
                          auth(email: mailctr.text, password: psdctr.text);},
                        child: Text("SIGN UP",style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 680,left: 35),
                  child: Row(
                    children: [
                      Text("Already you have account?",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ),),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginpage(),)),
                        child: Text("LOG IN",style: TextStyle(
                          color: Color.fromARGB(255, 240, 31, 16),
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                      )
                    ],
                  ),
                ),
            //      Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 40,
            //     width: 40,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(30)),
            //       color: Colors.white
            //     ),
            //     child: Center(child: InkWell(
            //       onTap: () => Navigator.pop(context),
            //       child: Icon(Icons.navigate_before_outlined,size: 30,))),
            //   ),
            // )
                ],
              )
            ],
      ),
          
      );
    
  }
}