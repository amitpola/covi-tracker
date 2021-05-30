import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {

  final List countryData;

  const MostAffected({Key key, this.countryData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
              SizedBox(width: 10,),
              Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Text(
                  'Deaths: '+countryData[index]['deaths'].toString(),
                style: TextStyle(
                  color: Color(0xffff073a),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 5,
      ),
    );
  }
}
