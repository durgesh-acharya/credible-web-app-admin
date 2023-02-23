
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../model/QRCode.dart';

class Qr extends StatefulWidget {


  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  int qrstatus = 0;
  bool loadervisible = true;
  TextEditingController _qrnum = TextEditingController();
   TextEditingController _qrrupees = TextEditingController();
   TextEditingController _qrunique = TextEditingController();
   //fetch qr

   Future getQr(int status)async{
    try{
      var response = await http.get(Uri.parse("http://52.66.119.148/api/qr/fromstatus/${status}"));
     var jsondata = jsonDecode(response.body);
    
      if(jsondata[0]["status"] == true){
        var jdata = jsondata[0]["data"];
        print(jdata);
        return jdata.map((json) => QrCode.fromJson(json)).toList();
      
      }else{
        
      }
    }on HttpException{
      print("http");
    }on SocketException{
      print("socket");
    }on PlatformException{
      print("platform");
    }
    catch(e){
      print(e);
    }
   }
// qr
  Future<void> qradd(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
         title: const Text("Add Category",style: TextStyle(color: Colors.green),),
         content: Container(
          width: 200.0,
          height: 200.0,
          child : Column(
            children: [
              //no of qr
                  TextFormField(
                    controller: _qrnum,
                     style: TextStyle(color: Colors.black,fontSize: 14.0),
                      cursorColor: Colors.black,
                      
                      maxLength: 35,
                      decoration: InputDecoration(
                          labelText: 'How many qr you want to add ?',
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
                  //qr amount
                   TextFormField(
                    controller: _qrrupees,
                     style: TextStyle(color: Colors.black,fontSize: 14.0),
                      cursorColor: Colors.black,
                      
                      maxLength: 35,
                      decoration: InputDecoration(
                          labelText: 'Amout',
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
                            if(_qrnum.text.length == 0 || _qrrupees.text.length == 0){
                           
                            }else{
                           
                              addQr(int.parse(_qrnum.text), double.parse(_qrrupees.text)).whenComplete((){
                                 Navigator.of(context).pop();
                                 _qrnum.clear();
                                 _qrrupees.clear();
                              });
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
                            _qrnum.clear();
                            _qrrupees.clear();
                          }, child: Text("Cancel",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                      )
                    ],
                  )
              
            ],
          )
         ),
      );
    });
  }

  Future addQr(int noofqr,double rupees)async{
   

    for(var i=1; i < noofqr+1 ;i++){
       Map qrmap = {
      "qrunique" : "",
      "qruse" : 0,
      "qrreedemed" : 0,
      "qrreedemedby" : "",
      "qrrupees" : rupees,
      "qrreedemstatus" : 0
    };
    String url = "http://52.66.119.148/api/qr/create";
   Map<String,String> headers = {'Content-Type': 'application/json'};
     try{
         var response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(qrmap),
          encoding: Encoding.getByName("utf-8")
          );
         
      if(response.statusCode == 200){
          var jsonresponse = jsonDecode(response.body);
          print(jsonresponse);
          var insertedid = jsonresponse['id'];
          var status = jsonresponse['status'];
          if(status == "success"){
          
            setState(() {
              
            });
          }
        }
          
     }on SocketException{
      print("soceket");
     }on HttpException{
      print("http");
     }on PlatformException{
      print("Platform");
     }
     catch(e){
      print(e);
     }
    }
  }

  //pair qr dialog
  Future<void> pairQr(int id){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title : Text("Pair QR"),
        content: Container(
          height: 150.0,
          child: Column(children: [
            //unique string
             TextFormField(
                    controller: _qrunique,
                     style: TextStyle(color: Colors.black,fontSize: 14.0),
                      cursorColor: Colors.black,
                      
                      maxLength: 35,
                      decoration: InputDecoration(
                          labelText: 'Pair Your QR ?',
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
                            if(_qrunique.text.length == 0){
                           
                            }else{
                           
                             
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
                            _qrunique.clear();
                            
                          }, child: Text("Cancel",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                      )
                    ],
                  )
          ]),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.white
   ),
   actions: [
    //radio row
     Padding(
       padding: const EdgeInsets.only(right :8.0),
       child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //radio unused
                  Radio(
                    activeColor: Colors.white,
                  value: 0, 
                  groupValue: qrstatus, 
                  onChanged: (value){
                    setState(() {
                      qrstatus = value!;
                    }); //selected value
                  }
                ),
                Text("Unused QR"),
                SizedBox(width: 20.0,),
            
                //radio used
            
                Radio(
                  activeColor: Colors.white,
                  value: 1, 
                  groupValue: qrstatus, 
                  onChanged: (value){
                    setState(() {
                      qrstatus = value!;
                    }); //selected value
                  }
                ),
                Text("Used QR"),
                 SizedBox(width: 20.0,),
            
                 //blocked qr
                  Radio(
                    activeColor: Colors.white,
                  value: 2, 
                  groupValue: qrstatus, 
                  onChanged: (value){
                    setState(() {
                      qrstatus = value!;
                    }); //selected value
                  }
                ),
                Text("Blocked QR"),
                ],
              ),
     ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(onPressed: (){
        qradd();
      }, icon: FaIcon(FontAwesomeIcons.plus,color: Colors.white,), label:  Text("Add Qr",style: GoogleFonts.fredokaOne(color:Colors.white),)),
    ),

   
   ],
      ),
      body: 
          //future builder stack
          Stack(
            children: [
              //when data
              FutureBuilder(
                future: getQr(qrstatus),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData){
                     return Visibility(
                visible: loadervisible,
                child: Center(child:CircularProgressIndicator(color: Colors.green,),
                      ),
              );
                  }return ListView.builder(
                    itemCount: snapshot.data.length == 0 ? 0 : snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(top :8.0),
                        child: ListTile(
                          dense: true,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                          side: BorderSide(color: Colors.black),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(snapshot.data[index].qrId.toString()),
                            SizedBox(width: 16.0,),
                            //qr unique
                             snapshot.data[index].qrUnique == "" ? GestureDetector(
                              onTap: (){
                                pairQr(snapshot.data[index].qrId);
                              },
                              child: Text("Pair With Qr",style: TextStyle(color: Colors.black,fontSize: 14.0),)) : Text(snapshot.data[index].qrUnique),
                             SizedBox(width: 8.0,),
                             snapshot.data[index].qrReedemed == 0 ? Text("Yet to Reedemed",style: TextStyle(color: Colors.red),) : Text("Reedemed",style: TextStyle(color: Colors.green)),
                             SizedBox(width: 8.0,),
                             Row(children: [
                                FaIcon(FontAwesomeIcons.indianRupeeSign,size: 14.0,),
                                 Text(snapshot.data[index].qrRupees.toString()),
                             ],),
                            SizedBox(width: 8.0,),
                            
                           
                          ],
                        ),                 
                        ),
                      );
                    });
                })
            ],
         
      ),
    );
  }
}