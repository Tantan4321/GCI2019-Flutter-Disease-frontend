import 'package:disease_app/ui/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.newsScreenTitle),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Test Button",
                  background: Colors.blue,
                  onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("TESTING BUTTON"),
                  )),
                ),
              ),
            ]
        ),
      ),
    );
  }
}