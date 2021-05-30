import 'dart:convert';

import 'package:covitracker/pages/countrypage.dart';
import 'package:covitracker/widgets/info.dart';
import 'package:covitracker/widgets/mostaffectedcountries.dart';
import 'package:covitracker/widgets/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:covitracker/datasource.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData() async {
    var response=await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData=json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async{
    var response=await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData=json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState.
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text("Covi-Tracker",style: TextStyle(color: Color(0xffff073a)),)),
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.black54,
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Worldwide',
                    style: TextStyle(
                      letterSpacing: 1,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData==null ?
            LinearProgressIndicator(
              backgroundColor: Colors.red,
            ):
            WorldWidePanel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Most Affected countries',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),
              ),
            ),
            SizedBox(height: 10,),
            countryData==null?
                Container():
            MostAffected(
              countryData: countryData,
            ),
            Info(),
            SizedBox(height: 20,),
            Center(
              child: Text(
                'We are together in this fight.'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 1,color:Color(0xff39ff14) ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
