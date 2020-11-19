import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
 String cmd;
  var webdata;
   var fsconnect = FirebaseFirestore.instance;
  
  web(cmd) async {
  var url = "http://YOUR_IP_Address/cgi-bin/web.py?x=${cmd}";
  var response = await http.get(url);
   
  setState(() {
      webdata = response.body;
    });
    await fsconnect.collection("linuxcommands").add({
      'command' : cmd,
       'output' : webdata,
     });
    //print(webdata);
}

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff57003f),
                Color(0xfff57453),
              ],
              begin: Alignment.bottomLeft,
              stops: [0,100],
            )
          ),
          child: SingleChildScrollView(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 40),
                  child: Center(
                    child: SizedBox(
                      width:MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Material(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        color: Color.fromRGBO(56, 4, 40, 0.9),
                        type: MaterialType.canvas,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width:MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff504b45),
                                  Color(0xff3c3b37),
                                ],
                                stops: [0, 100]
                                ),
                              ),
                             child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: <Widget>[
                                ToolbarButton(
                                    gradient: LinearGradient(colors: [
                                        Color(0xffeF6E4E),
                                        Color(0xffE45828),
                                      ],
                                      stops: [0, 100]),
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 12,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  SizedBox(width: 4,),

                                  Text(
                                    "linux@command:-",
                                    style: TextStyle(color: Color(0xffd5d0ce)),
                                    )

                                ],
                              ),
                             ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget>[
                                  Text(
                                    "Welcome to Linux Terminal!",
                                    style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                 Text(
                                    "linux@command:-",style: TextStyle(color: Color(0xff87d441)), 
                                    ),
                                Expanded(
                                child: TextField(
                                  onChanged: (value){
                                    cmd = value;
                                  },
                                  autocorrect: false,
                                  autofocus: true,
                                  showCursor: true,
                  
                                  cursorColor: Colors.white,
                                  cursorWidth: 6,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration.collapsed(hintText: ""),
                                  ),
                                  ),
                                ],
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                 child: Text( webdata ?? ""  , style: TextStyle(fontSize: 15,color: Colors.white70,),),
                              ),
                              
                              

                              ],
                              )
                            )
                          
                          ],
                          
                        ),
                      ),
                      ),
                    
                      ),
                      
                  ),
                ),
              GestureDetector(
                        onTap: (){                          
                           web(cmd);  
                          },
                        
                         child: Container(
                          margin: EdgeInsets.all(10),                                                                //Run Button
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 40,
                           decoration: BoxDecoration(
                              border: Border.all(
                                 color: Colors.black,
                                 width: 2.0,
                               ),
                              color: Colors.red, borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                               BoxShadow(
                                 color: Colors.black87,
                                 offset: Offset(10.0,10.0),
                               blurRadius:20.0,
                               )
                             ]
                             ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                
                                width: 50,
                                decoration: BoxDecoration(
                                                
                            image: DecorationImage(
                              image: AssetImage('assets/enter48.png',),
                              
                              
                              ),
                              
                          ),
                          
                              ),
                              Container(
                                
                                child: Text('Run', style: TextStyle(fontSize: 20,letterSpacing: 2, color: Colors.black87, fontFamily: 'Hacked',decoration: TextDecoration.none,),),
                              ),
                              ],
                          ),
                        ),
                      ),
                    
              ],
              
            ),
          ),
          
        ),

         


      ],
    );
  }
}

class ToolbarButton extends StatelessWidget {
  final LinearGradient gradient;
  final Widget child;

  const ToolbarButton({Key key, this.gradient, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: gradient
                        ),
                        child: child
                        );
  }
}
