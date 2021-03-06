import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50.0,
        title: Text(
          "Custom Card Example",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.red],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 3.0,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png"))),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2018/01/20/08/33/sunset-3094078_960_720.jpg"))),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                            top:
                                50 + MediaQuery.of(context).size.height * 0.35),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Beautiful Sunset at Paddy Field",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text.rich(TextSpan(
                                    text: "Posted on",
                                    children: [
                                      TextSpan(
                                          text: " June 18 2019",
                                          style: TextStyle(color: Colors.pink))
                                    ])),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Spacer(flex: 10),
                                    Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Spacer(flex: 1),
                                    Text("99"),
                                    Spacer(flex: 5),
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Spacer(flex: 1),
                                    Text("99"),
                                    Spacer(flex: 10)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
