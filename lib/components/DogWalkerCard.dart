import 'package:flutter/material.dart';

class DogWalkerCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String rate;

  DogWalkerCard({required this.title,
    required this.description,
    required this.image,
    required this.rate});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 60,

            child: ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Align(
              alignment: Alignment.topLeft,
                heightFactor: 1,
                child: Text(title,
                    textAlign: TextAlign.start, style: const TextStyle()),
              ),
              Align(
                alignment: Alignment.topRight,
                heightFactor: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 2, 2),
                  child: Container(
                      //color: Colors.black,
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                      child: Text(
                      rate,
                      textAlign: TextAlign.center,
                  style: TextStyle(
                  backgroundColor: Colors.black,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.location_on,
              size: 15,
              color: Colors.orange,
            ),
            Text(description),
          ]),
    ),)
    ]
    ,
    )
    );
  }
}
