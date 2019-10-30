import 'package:flutter/material.dart';
import 'package:fresh_app/ui/detail.dart';

class VegetableFavorite extends StatelessWidget {
  var data = [
    {
      "name": "Tomat",
      "src": "assets/sayur/tomato.jpg",
      "desc": "Tomato segar baru di petik dari kebun",
      "price": "112.000"
    },
    {
      "name": "Bayam",
      "src": "assets/sayur/bayam.jpg",
      "desc": "Bayam Segar yang dapat menambah kebugaran anda",
      "price": "120.000"
    },
    {
      "name": "Bawang Merah",
      "src": "assets/sayur/bmerah.jpg",
      "desc": "Bawang Merah, Untuk keperluan masak",
      "price": "142.000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        height: 230.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, i) {
            String name = data[i]['name'];
            String src = data[i]['src'];
            String desc = data[i]['desc'];
            String price = data[i]['price'];
            return Container(
                margin: EdgeInsets.only(right: 10.0),
                height: 220.0,
                width: 220.0,
                child: InkWell(
                  highlightColor: Colors.red,
                  splashColor: Colors.amber,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail(
                          name: name, url: src, desc: desc, price: price),
                    ));
                  },
                  child: GridTile(
                    child: Hero(
                      tag: name + price,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0)),
                            image: DecorationImage(
                                image: AssetImage(src), fit: BoxFit.cover)),
                      ),
                    ),
                    footer: Container(
                        color: Colors.white70,
                        height: 90.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("$name",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text("Rp. $price / Kg",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ),
                ));
          },
        ));
  }
}
