import 'package:flutter/material.dart';
import 'package:fresh_app/ui/detail.dart';

class BuahanFavorite extends StatelessWidget {
  final String src, name, desc, price;
  BuahanFavorite({this.src, this.name, this.desc, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      height: 200.0,
      width: 420.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Detail(name: name, url: src, desc: desc, price: price),
          ));
        },
        highlightColor: Colors.red,
        splashColor: Colors.amber,
        child: Hero(
          tag: name + price,
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              height: 70.0,
              child: Center(
                child: Text(name),
              ),
            ),
            child: Image.asset(src, fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
