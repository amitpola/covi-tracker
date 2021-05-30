import 'package:covitracker/datasource.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ's"),

      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
          return ExpansionTile(
            title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DataSource.questionAnswers[index]['answer']),
                ),
              ],
            );
        },
          ),
    );
  }
}
