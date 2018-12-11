import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DocumentSnapshot> travelData;

  @override
  void initState() {
    super.initState();
    travelData = new List<DocumentSnapshot>();
    TravelDataService().getTravelData().listen((QuerySnapshot snapshot) {
      var firestoreDocuments = snapshot.documents;
      setState(() {
        travelData = firestoreDocuments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              Text(
                "travelogram",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width - 220),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
                color: Colors.grey,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/chris.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 30.0,
                width: 30.0,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    height: (MediaQuery.of(context).size.height / 7) / 2,
                    width: (MediaQuery.of(context).size.height / 7) / 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.navigation),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "MALDIVES TRIP 2018",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                    Text(
                      "Add an Update",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          fontSize: 15.0,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(width: 95.0),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  color: Colors.grey,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('FROM THE COMMUNITY',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Quicksand',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          _buildGrid()
        ],
      ),
    );
  }

  _buildGrid() {
    var images = [
      "https://firebasestorage.googleapis.com/v0/b/testproject-bc027.appspot.com/o/beach1.jpg?alt=media&token=2c5262ab-f88b-43ae-b3de-82f7af6db0ed",
      "https://firebasestorage.googleapis.com/v0/b/testproject-bc027.appspot.com/o/benagil-sea-cave-algarve-portugal-cr-getty.jpg?alt=media&token=3a558e68-a61a-4fc3-98e2-64f6590ba8d4",
      "https://firebasestorage.googleapis.com/v0/b/testproject-bc027.appspot.com/o/boracay-willys-rock-GettyImages-112269463.jpg?alt=media&token=1a2a4d74-36a1-47fc-9e4c-a4419ee3fc3d"
    ];
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[_buildTripImagesGrid(images)],
    );
    // return ListView.builder(
    //   primary: false,
    //   shrinkWrap: true,
    //   itemCount: travelData.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     var travelInfo = travelData[index];
    //     var images = List.from(travelInfo['images']);
    //     var owner = travelInfo['owner'].toString();
    //     var tripname = travelInfo['tripname'].toString();
    //     var uploadedAt = DateTime.parse(travelInfo['uploadedAt'].toString());
    //     //_buildTripImagesGrid(images);
    //     _buildTripDetailsInfo(images.length, tripname, owner, uploadedAt);
    //   },
    // );
  }

  _buildTripDetailsInfo(
      int numberOfImages, String tripname, String owner, DateTime uploadedAt) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tripname,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '$owner added $numberOfImages photos',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10.0,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "${uploadedAt.difference(DateTime.now())} ago",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 8.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(width: 80.0),
          ImageIcon(AssetImage('assets/images/navarrow.png')),
          ImageIcon(AssetImage('assets/images/fav.png')),
          ImageIcon(AssetImage('assets/images/speechbubble.png')),
        ],
      ),
    );
  }

  _buildTripImagesGrid(List<String> images) {
    return Row(
      children: <Widget>[
        Container(
          height: 225.0,
          width: (MediaQuery.of(context).size.width / 2) + 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(images[0]
                      .toString()) //AssetImage("assets/images/beach1.jpg"),
                  )),
        ),
        SizedBox(width: 2.0),
        Column(
          children: <Widget>[
            Container(
              height: 111.5,
              width: (MediaQuery.of(context).size.width / 2) - 72.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[1]
                          .toString()) //AssetImage("assets/images/beach2.jpg"),
                      )),
            ),
            SizedBox(height: 2.0),
            Container(
              height: 111.5,
              width: (MediaQuery.of(context).size.width / 2) - 72.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[2]
                          .toString()) //AssetImage("assets/images/beach3.jpg"),
                      )),
            )
          ],
        )
      ],
    );
  }
}
