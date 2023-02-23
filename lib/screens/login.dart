
import 'package:credible_steel_admin/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
 

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


//user name widget
  Widget usernameinput(){
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white,fontSize: 14.0),
   cursorColor: Colors.white,
   initialValue: '',
   maxLength: 10,
   decoration: InputDecoration(
       icon: FaIcon(FontAwesomeIcons.user,color: Colors.white,),
       labelText: 'Enter Your Mobile Number',
       labelStyle: TextStyle(
         color: Colors.white
       ),
       helperText: 'Eg. 9999999999',
       helperStyle: TextStyle(color: Colors.white),
        counterText: "",
       enabledBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
       ),
   ),
 ),
    );
  }
  //password widget

  Widget passwordinput(){
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white,fontSize: 14.0),
   cursorColor: Colors.white,
   initialValue: '',
   maxLength: 12,
   decoration: InputDecoration(
       icon: FaIcon(FontAwesomeIcons.key,color: Colors.white,),
       labelText: 'Enter Your Password',
       labelStyle: TextStyle(
         color: Colors.white
       ),
       helperText: '',
       helperStyle: TextStyle(color: Colors.white),
        counterText: "",
       enabledBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
       ),
   ),
 ),
    );
  }
  
  //login button

  Widget loginbutton(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white
          ),
  onPressed: () {
         Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>  DashBoard()),
  );
  },
  child: Text("Login",style: TextStyle(color: Colors.lightGreen,fontSize: 18.0,fontWeight: FontWeight.bold),),
),
      )
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.green,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.white,
              )
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25.0,
                    color: Colors.black38
                  )
                ]
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 400.0,
              child: Card(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("Credible Steel",style: GoogleFonts.fredokaOne(color: Colors.green,fontSize: 36.0),),
                Padding(
                  padding: const EdgeInsets.only(top :12.0,bottom : 12.0),
                  child: VerticalDivider(
                    color: Colors.green,
                    thickness: 2.0,
                  ),
                ),
                // Container(
                  
                //   decoration: BoxDecoration(
                //     color: Colors.grey
                //   ),
                // )
                Card(child: Container(color: Colors.white,width: 300.0,height: 200.0,
                child : Column(children: [
                  Container(
                    width: double.infinity,
                    height: 35.0,
                    child: ElevatedButton(onPressed: (){
                            Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>  DashBoard()),
  );
                    }, child: Text("Login")))
                ],)
                ),)
              ])),
            ),
          )
        ],
      )
    );
  }
}