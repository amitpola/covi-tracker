import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: [
          StatusPanel(
            title: 'Confirmed',
            textColor:  Color(0xff39ff14),
            count: worldData['cases'].toString(),
            bgColor: Color(0xff39ff14),
          ),
          StatusPanel(
            title: 'Active',
            textColor: Color(0xfff535aa),
            count: worldData['active'].toString(),
            bgColor:Color(0xfff535aa) ,
          ),
          StatusPanel(
            title: 'Recovered',
            textColor: Color(0xff4d4dff),
            count: worldData['recovered'].toString(),
            bgColor: Color(0xff4d4dff),
          ),
          StatusPanel(
            title: 'Deaths',
            textColor: Color(0xfffff01f),
            count: worldData['deaths'].toString(),
            bgColor: Color(0xfffff01f),
          ),
        ],
      ),
    );
  }
}


class StatusPanel extends StatelessWidget {

  final Color textColor;
  final String title;
  final String count;
  final Color bgColor;

  StatusPanel({Key key, this.textColor, this.title, this.count,this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: bgColor,
            blurRadius: 20,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),

      height: 80,
      width: (MediaQuery.of(context).size.width)/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
        ],
      ),
    );
  }
}

