import 'package:flutter/material.dart';
import 'package:fresh_app/model/vegetables_data.dart' as prefix1;
import 'package:fresh_app/ui/detail.dart';

class VegetablesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () { Navigator.of(context).pop();},
          icon: Icon(Icons.arrow_back_ios)),
      title: Text("All Vegetable"), elevation: 0.5),
    body: Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: ListView.builder(
        itemCount: prefix1.myItems.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[200], width: 5.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 150.0, width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(prefix1.myItems[i]['src'])))),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(prefix1.myItems[i]["name"],
                        style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text("Rp. ${prefix1.myItems[i]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green))])),
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
              shadowColor: Colors.grey[100], 
              color: Colors.transparent, elevation: 5.0,
              child: CircleAvatar(
                radius: 25.0, backgroundColor: Colors.amber,
                child: IconButton(
                  tooltip: "Details",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail(
                        name: prefix1.myItems[i]["name"],
                        url: prefix1.myItems[i]["src"],
                        desc: prefix1.myItems[i]["desc"],
                        price: prefix1.myItems[i]["price"],
                      )));
                  },
                  icon: Icon(Icons.more, color: Colors.white))))
            ]));
        })));
  }}