
import 'dart:convert';
import 'dart:io';


import 'package:credible_steel_admin/screens/subcategoryscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../model/Cate.dart';


class CategoryScreen extends StatefulWidget {
  

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool errortext = false;
  bool loadervisible = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
//create category
  Future createCate(String name,String descrption)async{

    Map<String ,dynamic> cateMap = {
      "catename" : name,
      "catedescription" : descrption,
      "cateurl" : "",
      "cateactive" : 0
    };
   String url = "http://52.66.119.148/api/cate/create";
   Map<String,String> headers = {'Content-Type': 'application/json'};
  try{
    var response = await http.post(Uri.parse(url),
  headers: headers,
  body: jsonEncode(cateMap),
  encoding: Encoding.getByName("utf-8")
);

if(response.statusCode == 200){
  var jsonresponse = jsonDecode(response.body);
  print(jsonresponse);
  var insertedid = jsonresponse['id'];
  var status = jsonresponse['status'];
  if(status == "success"){
    Navigator.of(context).pop();
    _name.clear();
    _description.clear();
    setState(() {
      
    });
  }
}

  }on SocketException{
    print("Socket");
  }on HttpException{
    print("http");
  }on PlatformException{
    print("Platform");
  }
  catch(e){
print(e);
  }
  
  }

  //get Category list

  Future getCate()async{
     try{
      var response = await http.get(Uri.parse("http://52.66.119.148/api/cate"));
     var jsondata = jsonDecode(response.body);
    
      if(jsondata[0]["status"] == true){
        var jdata = jsondata[0]["data"];
        print(jdata);
        return jdata.map((json) => Cate.fromJson(json)).toList();
      
      }else{
        
      }
    }on SocketException{
      print("socket");
    }on HttpException{
      print("http");
    }on PlatformException{
      print("platform");
    }catch(e){
      print(e);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.white
   ),
   actions: [
    Padding(
      padding: const EdgeInsets.only(right :8.0),
      child: TextButton.icon(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
             title: const Text("Add Category",style: TextStyle(color: Colors.green),),
             content: Container(
              width: 200.0,
              height : 200.0,
               child: Column(
             
                children: [
                  //error text
                  Visibility(
                    visible: errortext,
                    child: Text("All Fields are mandatory",style: TextStyle(color: Colors.red),)),
                  //name
                  TextFormField(
                    controller: _name,
                     style: TextStyle(color: Colors.black,fontSize: 14.0),
                      cursorColor: Colors.black,
                      
                      maxLength: 35,
                      decoration: InputDecoration(
                          labelText: 'Enter Category Name',
                          labelStyle: TextStyle(
                            color: Colors.green
                          ),
                          helperText: '',
                          helperStyle: TextStyle(color: Colors.green),
                            counterText: "",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
       ),
   ),
                  ),

                  //descrption
                    TextFormField(
                      controller: _description,
                     style: TextStyle(color: Colors.black,fontSize: 14.0),
                      cursorColor: Colors.black,
                      
                      maxLength: 100,
                      decoration: InputDecoration(
                          labelText: 'Enter Category Descrption',
                          labelStyle: TextStyle(
                            color: Colors.green
                          ),
                          helperText: '',
                          helperStyle: TextStyle(color: Colors.green),
                            counterText: "",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
       ),
   ),
                  ),
                  //button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                          onPressed: (){
                            if(_name.text.length == 0 || _description.text.length == 0){
                              setState(() {
                                errortext = true;
                              });
                            }else{
                            //  createCate(_name.text, _description.text);
                            createCate(_name.text, _description.text);
                            }
                          }, child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                      Container(
                        width: 100.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                          ),
                          onPressed: (){
                            Navigator.of(context).pop();
                            _name.clear();
                            _description.clear();
                          }, child: Text("Cancel",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                      )
                    ],
                  )
                ],
               ),
             ),
          );
        });
      }, icon: FaIcon(FontAwesomeIcons.plus,color: Colors.white,), label: Text("Add Category",style: GoogleFonts.fredokaOne(color:Colors.white),)),
    )
   ],
      ),
      body: Stack(
        children: [
          //when data
          FutureBuilder(
        future: getCate(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
             return Visibility(
                visible: loadervisible,
                child: Center(child:CircularProgressIndicator(color: Colors.green,),
                      ),
              );
          }
          return ListView.builder(
            itemCount: snapshot.data.length == 0 ? 0 : snapshot.data.length,
            itemBuilder:(BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                     border: Border.all(width: 2, color: Colors.grey),
                  ),
                  
                  width: MediaQuery.of(context).size.width * 0.8,
                 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //network image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          child: Image.network(snapshot.data[index].cateUrl)),
                      ),
                      SizedBox(width: 20.0,),
                      Column(
                        children: [
                          Text(snapshot.data[index].cateName,style: GoogleFonts.fredokaOne(color: Colors.green,fontSize: 24.0))
                        ],
                      ),
                      Column(
                        children: [
                          snapshot.data[index].cateActive == 0 ? Container(
                              width: 100.0,
                              height: 30.0,
                            color: Colors.red,
                            child: Center(child: Text("Inactive",style: GoogleFonts.fredokaOne(color: Colors.white,fontSize: 16.0),))) : 
                            Container(
                                 width: 100.0,
                                 height: 30.0,
                              color: Colors.green,
                              child: Center(child: Text("Active",style: GoogleFonts.fredokaOne(color: Colors.white,fontSize: 16.0))))
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                                         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SubCategoryScreen(snapshot.data[index].cateId)),
  );

                        },
                        child: Icon(FontAwesomeIcons.squareCaretRight,size: 30.0,color: Colors.green,))
              
                    ],
                  ),
                ),
              );
            });
        },
      ),
        ],
      )
    );
  }
}