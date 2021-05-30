import 'package:covitracker/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>FAQ())
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FAQ's",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              launch('https://www.google.com/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Donate".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MythBusters".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
