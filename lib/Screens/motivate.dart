import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetMotivated extends StatefulWidget {
  const GetMotivated({Key? key}) : super(key: key);

  @override
  State<GetMotivated> createState() => _GetMotivatedState();
}

class _GetMotivatedState extends State<GetMotivated> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String content = "";
  String author = "";
  getData() async {
    String url = "https://api.quotable.io/random";
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    setState(() {
      content = jsonData["content"].toString();
      author = "by: ${jsonData["author"]}";
    });
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
                content,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                author,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 30),
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
                    child: const Text("Umm!!, Another")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
