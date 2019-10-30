import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fresh_app/ui/cart_screen.dart';
import 'package:fresh_app/ui/fruits_screen.dart';
import 'package:fresh_app/ui/vegetables_screen.dart';
import 'package:fresh_app/ui/widget/fruits_card.dart';
import 'package:fresh_app/ui/widget/vegetable_card.dart';
import 'package:fresh_app/ui/detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> img = [
    "assets/slider4.jpg",
    "assets/Vegetable-Banner.jpg",
    "assets/vegetables.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                  color: Colors.green,
                  padding: EdgeInsets.only(right: 20.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu, color: Colors.white)),
                      Text("Fresh App",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cart()));
                        },
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            StreamBuilder(
                              stream: Firestore.instance
                                    .collection('items')
                                    .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return (snapshot.data.documents.length > 0) 
                                  ? Positioned(
                                    left: 10.0,
                                    child: CircleAvatar(
                                      radius: 9.0,
                                      backgroundColor: Colors.red,
                                      child: Text(snapshot
                                          .data.documents.length
                                          .toString()),
                                    ))
                                  : Text('');
                                } else {
                                  return Text('');
                                }})],
                        )),
                    ],
                  )),
              Stack(
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 85.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                  ),
                  Positioned(
                    top: 25.0,
                    child: Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width / 2 + 150,
                      child: Swiper(
                        itemCount: img.length,
                        autoplay: true,
                        pagination: SwiperPagination(),
                        itemBuilder: (BuildContext context, i) {
                          return Image.asset(img[i], fit: BoxFit.cover);
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 65.0),
              // END HEADER HERE /////////////////////
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VegetablesItem()));
                      },
                      child: Container(
                      height: 60.0,
                      width: 80.0,
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.redAccent])),
                      child: Image.asset(
                        "assets/vegetables.png",
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FruitsItems()));
                      },
                      child: Container(
                        height: 60.0,
                        width: 80.0,
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.redAccent])),
                        child: Image.asset(
                          "assets/fruits.png",
                          height: 30.0,
                          width: 30.0,
                        )),
                    )
                  ],
                ),
              ),
              Divider(),
              // END MENU CATEGORY ////
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Buahan Favorite"),
                    FlatButton(color: Colors.white70,splashColor: Colors.green,
                      highlightColor: Colors.greenAccent, 
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FruitsItems()));
                      },
                      child: Text(
                        "All",textAlign: TextAlign.left,
                      ),
                    )
                  ],
                )),
              Container(
                height: 230.0,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal, shrinkWrap:  true,
                  children: <Widget>[
                    BuahanFavorite(src: "assets/buah/naga.png", name: "Buah Naga",
                        desc: "Buah Naga Fresh Baru Di Petik",
                        price: "200.00"),
                    SizedBox(width: 10.0),
                    BuahanFavorite(src: "assets/buah/orange.jpg",name: "Buah Jeruk",
                        desc: "Buah Jeruk Frsh Baru di Petik",
                        price: "230.00"),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              // END CARDLIST FRUITS///////
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Sayuran Favorite"),
                      FlatButton(
                        color: Colors.white70,
                        splashColor: Colors.green,
                        highlightColor: Colors.greenAccent,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VegetablesItem()));
                        },
                        child: Text(
                          "All",
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  )),
              VegetableFavorite(),
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
