import 'package:flutter/material.dart';
import 'harsh.dart';
import 'mayank.dart';
import 'anvay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Laundry(),
      theme: ThemeData.dark(),
      // color: Colors.transparent,
      title: "laundry",
    );
  }
}

class Laundry extends StatefulWidget {
  @override
  _LaundryState createState() => _LaundryState();
}

class _LaundryState extends State<Laundry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laundry"),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Harsh"),
              trailing: Hero(
                tag: "harshKaTag",
                child: Image(
                  image: AssetImage("assets/har.jpg"),
                ),
              ),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Harsh(
                      name: "Harsh",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Mayank"),
              trailing: Hero(
                tag: "MayankKaTag",
                child: Image(
                  image: AssetImage("assets/may.jpg"),
                ),
              ),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Mayank(name: "Mayank")));
              },
            ),
            ListTile(
              title: Text("Anvay"),
              trailing: Hero(
                tag: "AnvayKaTag",
                child: Image(
                  image: AssetImage("assets/anv.jpg"),
                ),
              ),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Anvay(name: "Anvay"),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                
                Image.asset("assets/bg.jpg",
                fit: BoxFit.fill,
                height: 780.0,
                color: Colors.white70,
                colorBlendMode: BlendMode.color,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    "https://source.unsplash.com/random",
                    /*colorBlendMode: BlendMode.color,
                    color: Colors.black54,*/
                    fit: BoxFit.cover,
                     height: 750.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
