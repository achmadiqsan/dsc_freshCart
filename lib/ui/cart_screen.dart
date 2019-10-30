import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatelessWidget {
  final int status;

  Cart({this.status});

  deleteData(String name) {
    final document = Firestore.instance.collection('items').document(name);

    document.delete().whenComplete(() {
      print("&name Deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("My Cart"),
        backgroundColor: Colors.green,
        elevation: 0.5,
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0, right: 20.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection('items').snapshots(),
          builder: (context, snap) {
            if (snap.hasData && snap.data != null) {
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: snap.data.documents.length,
                    itemBuilder: (c, i) {
                      return Stack(children: <Widget>[
                        Card(
                            margin: EdgeInsets.only(
                                right: 15.0, top: 15.0, bottom: 12.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                            child: Container(
                              padding: EdgeInsets.only(top: 10.0),
                              height: 120.0,
                              child: ListTile(
                                title: Text(snap.data.documents[i]['name']),
                                subtitle: Text(
                                    "Rp. ${snap.data.documents[i]['price']} / Kg",
                                ),
                                leading: Container(
                                  height: 150.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(snap.data.documents[i]['img'])
                                    )
                                  ),
                                )),
                            )),
                        Positioned(
                          bottom: 110.0,
                          right: 0,
                          child: InkWell(
                              onTap: () {
                                ///////////////////////
                                deleteData(snap.data.documents[i]['name']);
                              },
                              splashColor: Colors.pink,
                              highlightColor: Colors.amber,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.red),
                                height: 30.0,
                                width: 30.0,
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        )
                      ]);
                    },
                  ),
                ],
              );
            } else {
              return Center(child: Text("Data Tidak Ada"));
            }
          },
        ),
      ),
    );
  }
}
