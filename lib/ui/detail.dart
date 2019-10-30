import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String name; final String url;
  final String desc; final String price;

  Detail({this.name, this.url, this.desc, this.price});

  createData() {
    final document = Firestore.instance.collection('items').document(name);

    Map<String, dynamic> data = {
      'name': name,
      'img': url,
      'desc': desc,
      'price': price
    };

    document.setData(data).whenComplete(() {
      return SnackBar(
        content: Text("$name sudah ditambahkan ke keranjang"),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(name,
            style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: name + price,
              child: Container(
                width: MediaQuery.of(context).size.width, height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(url), fit: BoxFit.cover))))]),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: 
                    BorderRadius.only(bottomRight: Radius.circular(50.0))),
            elevation: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: MediaQuery.of(context).size.height / 2 - 15.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(name, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text(desc,
                      style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 20.0),
                  Text("Rp. $price / Kg",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  SizedBox(height: 50.0),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton.extended(heroTag: "cartButton", backgroundColor: Colors.green,
                      onPressed: () {
                        createData();
                      }, icon: Icon(Icons.shopping_basket), label: Text("Add To Cart"))],
                  )]))))
      ]));
  }
}