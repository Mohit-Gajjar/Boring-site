import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GettingBored extends StatefulWidget {
  const GettingBored({Key? key}) : super(key: key);

  @override
  State<GettingBored> createState() => _GettingBoredState();
}

class _GettingBoredState extends State<GettingBored> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String activity = "";
  String link = "";
  getData() async {
    String url = "http://www.boredapi.com/api/activity/";
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    setState(() {
      activity = jsonData["activity"];
      link = jsonData['link'];
    });
  }

  _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(link)) {
      // ignore: deprecated_member_use
      await launch(link);
    } else {
      SnackBar snackBar = SnackBar(content: Text('Could not launch $link'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                activity,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 170,
                child: OutlinedButton(
                    onPressed: getData,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Umm!!, NAAH")),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: _launchURL, child: Text(link)),
            ],
          ),
        ),
      ),
    );
  }
}
