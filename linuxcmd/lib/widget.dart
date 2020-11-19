import 'package:flutter/material.dart';
import 'package:linuxcmd/terminal.dart';


class HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            InkWell(
                             onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                                Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (context,a,b)=>Terminal()));
                              },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: BackgroundClipper(),
                              child: Hero(
                                  tag: 'background',
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.blue[700], Colors.purple[500]],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        )),
                                  ),
                                ),
                              ),
                ),
                          ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1 * 0.1),
                child: InkWell(
                  onTap: (){
                     Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (context,a,b)=>Terminal()));
                  },
                  child: Image.asset('assets/linux512.png', scale: 1.5,)),
              ),
              ), 
            Positioned(
              bottom: 20,
              left: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text('Linux', 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 22, 
                  letterSpacing: 2),
                  ),
                Text('Click for more details', 
                style: TextStyle(
                  color: Colors.white70, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 12, 
                  letterSpacing: 2),
                  ),
              ],
              ),
            ),    

          ] ,
    );
  }
}
class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    
    return true;
  }
}
