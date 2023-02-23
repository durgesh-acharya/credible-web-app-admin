// @dart=2.9
import 'package:credible_steel_admin/screens/categoryscreen.dart';
import 'package:credible_steel_admin/screens/qr.dart';
import 'package:credible_steel_admin/screens/reedemscreen.dart';
import 'package:credible_steel_admin/screens/subcategoryscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
 

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credible Steel",style: GoogleFonts.secularOne(color:Colors.white, fontWeight:FontWeight.bold),),
      
        actions: [
          //category button
          Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Center(child: TextButton(onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  CategoryScreen()),
  );
            }, child: Text("Category",style: GoogleFonts.fredokaOne(color:Colors.white),))),
          ),
          //subcategory button
          Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Center(child: TextButton(onPressed: (){
  //                Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) =>  SubCategoryScreen()),
  // );
            }, 
            child: Text("Sub-Category",style: GoogleFonts.fredokaOne(color:Colors.white),))),
          ),
  //reedem button
           Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Center(child: TextButton(onPressed: (){
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ReedemScreen()),
  );
            }, 
            child: Text("Reedem",style: GoogleFonts.fredokaOne(color:Colors.white),))),
          ),
          //qr
           Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Center(child: TextButton(onPressed: (){
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Qr()),
  );
            }, 
            child: Text("Qr",style: GoogleFonts.fredokaOne(color:Colors.white),))),
          ),
          //user
          Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Center(child: TextButton(onPressed: (){
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ReedemScreen()),
  );
            }, 
            child: Text("User",style: GoogleFonts.fredokaOne(color:Colors.white),))),
          ),
        ],
      ),
      body: Center(child : Text("Dashboard")),
    );
  }
}