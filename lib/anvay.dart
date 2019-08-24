import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anvay extends StatefulWidget {
  final String name;
  Anvay({this.name});
  @override
  _AnvayState createState() => _AnvayState();
}

class _AnvayState extends State<Anvay> {
  int _counter = 0;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _initial();
  }

  void _initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('anvay');
    });
  }

  void _laundrycounter() async {
    _counter = (prefs.getInt('anvay') ?? 0);
    setState(() {
      _counter++;
    });
    await prefs.setInt('anvay', _counter);
  }

  void _decrement() async {
    _counter = (prefs.getInt('anvay') ?? 0);
    setState(() {
      if (_counter > 0) _counter--;
    });
    await prefs.setInt('anvay', _counter);
  }

  void _clear() async {
    setState(() {
      _counter = 0;
    });
    await prefs.setInt('anvay', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/bg1.jpg",
          fit: BoxFit.fill,
          height: 900.0,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            title: new Text(widget.name),
          ),
          body: Container(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120.0, left: 10.0),
                    child: Text(
                      "Anvay ke dwara diye \n gaye kapdo ki sankhya \n hai : $_counter",
                      style: TextStyle(fontSize: 20.0, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 250.0, left: 50.0),
          child: Hero(
            child: ClipOval(
                child: Image.asset(
              "assets/anv.jpg",
              height: 300.0,
              width: 300.0,
              fit: BoxFit.fitWidth,
            )),
            tag: "anvayKaTag",
          ),
        ),
        Positioned(
          top: 780,
          right: 20,
          height: 60,
          width: 60,
          child: ClipOval(
            child: RaisedButton(
              child: Text(
                "+",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: _laundrycounter,
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          top: 780,
          left: 20,
          height: 60,
          width: 60,
          child: ClipOval(
            child: GestureDetector(
              // child: RaisedButton(
              child: Container(
                  child: RaisedButton(
                onPressed: (){},
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 20.0),
                  
                ),
                color: Colors.transparent,
              )),
              onTap: _decrement, //
              onLongPress: _clear,

              // color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
