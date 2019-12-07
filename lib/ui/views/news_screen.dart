import 'dart:async';
import 'dart:convert';

import 'package:disease_app/ui/models/newsQuery.dart';
import 'package:disease_app/ui/resources/constants.dart';
import 'package:disease_app/ui/views/widgets/news_web_viewer.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.newsScreenTitle),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Diabetes",
                  background: Colors.deepOrange,
                  onPressed: () => _queryNews("Diabetes"),
                ),
              ),
            ]),
      ),
    );
  }

  Future _queryNews(String diseaseName) async {

    List<NewsQuery> list = List();
    setState(() {
      isLoading = true;
    });

    try {
      final response =
      await http.get('https://newsapi.org/v2/everything?q='+
          diseaseName +
          '&apiKey=' +
          Constants.newsApiKey);
      if (response.statusCode == 200) {
        list = (json.decode(response.body)['articles'] as List)
            .map((data) => new NewsQuery.fromJson(data))
            .toList();
        setState(() {
          isLoading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsViewer(query: diseaseName, siteList: list)
            ));
      }
    } on Exception catch (e) {
      print(e); //TODO: display to user https request failed
    }
  }
}
